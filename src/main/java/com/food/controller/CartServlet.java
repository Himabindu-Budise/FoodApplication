package com.food.controller;

import java.io.IOException;

import com.food.dao.MenuDAO;
import com.food.daoImpl.MenuImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			resp.sendRedirect("Login.jsp");
			return;
		}
		Cart cart = (Cart) session.getAttribute("cart");

		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			System.out.println("New cart initialized and added to session");
		}

		String action = req.getParameter("action");
		String itemIdParam = req.getParameter("itemId");

		if (action == null || itemIdParam == null) {
			resp.sendRedirect("Cart1.jsp");
			return;
		}

		try {
			int itemId = Integer.parseInt(itemIdParam);
			MenuDAO menudao = new MenuImpl();

			System.out.println("Action: " + action + ", Item ID: " + itemId);

			if ("add".equals(action)) {
				Menu menuItem = menudao.getMenu(itemId);
				if (menuItem != null) {
					CartItem cartItem = new CartItem(
							menuItem.getMenuId(),
							menuItem.getRestaurantId(),
							menuItem.getName(),
							menuItem.getPrice(),
							1
							);
					cart.addItem(cartItem);
					System.out.println("Cart after adding: " + cart.getAllItems());
				} else {
					System.err.println("Menu item not found for ID: " + itemId);
				}
			} else if ("update".equals(action)) {
				String quantityParam = req.getParameter("quantity");
				if (quantityParam != null) {
					int quantity = Integer.parseInt(quantityParam);
					cart.updateItem(itemId, quantity);
					System.out.println("Cart after update: " + itemId+", Quantity"+quantity);
				} else {
					System.err.println("Invalid update request: Missing quantity parameter");
				}
			} else if ("remove".equals(action)) {
				cart.removeItem(itemId);
				System.out.println("Cart after removal: " + itemId);
			} 

		} catch (NumberFormatException e) {
			//            System.err.println("Invalid itemId or quantity parameter");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.setAttribute("cart", cart);
		System.out.println(cart);
		resp.sendRedirect("Cart1.jsp");
	}


}