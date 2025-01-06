package com.food.controller;

import java.io.IOException;
import java.util.Map;

import com.food.dao.OrderDAO;
import com.food.daoImpl.OrderImpl;
import com.food.daoImpl.OrderItemImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Order;
import com.food.model.OrderItems;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	private OrderImpl orderImpl;
	private double status;
	private String paymentMode;
	private Object itemTotal;
	private Object itemId;
	private int orderItemId;
	private int quantity;
	private int menuId;
	private OrderDAO orderDAO;


	public void init()throws ServletException {
		super.init();
		this.orderDAO = new OrderImpl(); 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");

		if (cart != null && user != null && !cart.getAllItems().isEmpty()) {
			System.out.println("Inside checkoutServlet IF is true");
			String paymentMethod = req.getParameter("paymentMode");
			System.out.println("Payment Method: " + paymentMethod);
			float orderTotalAmount = (float) cart.getAllItems().values().stream()
					.mapToDouble(item -> item.getPrice() * item.getQuantity())
					.sum();
			System.out.println("Calculated Total Amount: " + orderTotalAmount);

			Integer restaurantId = (Integer) session.getAttribute("restaurantId");
			float totalAmount = (Float) session.getAttribute("totalAmount");
			System.out.println(restaurantId);

			Order order = new Order();
			order.setUserId(user.getUserId());
			order.setRestaurantId(restaurantId);
			order.setTotalAmount(orderTotalAmount);
			order.setPaymentMode(paymentMethod);
			order.setStatus("Pending");

			OrderDAO orderdao = new OrderImpl();
			int orderId = orderdao.insert(order);  
			if (orderId > 0) {
				System.out.println("Generated Order ID: " + orderId);
				OrderItemImpl orderItemsImpl = new OrderItemImpl();
				int x = 0;

				for (Map.Entry<Integer, CartItem> entry : cart.getAllItems().entrySet()) {
					CartItem item = entry.getValue();
					double itemTotal = (int) (item.getPrice() * item.getQuantity());
					System.out.println("Inserting OrderItem: ItemID = " + item.getItemId() + ", Quantity = " + item.getQuantity() + ", Total = " + itemTotal);
					x = orderItemsImpl.insert(new OrderItems(0, orderId, item.getItemId(), item.getQuantity(),itemTotal));
				}

				if (x != 0) {
					session.removeAttribute("cart");
					resp.sendRedirect("placeOrder.jsp");
				} else {
					resp.sendRedirect("home.jsp");
				}
			} else {
				System.out.println("Failed to insert order.");
			}
		} else {
			System.out.println("Cart is empty or user not logged in.");
		}
	}
}





//		if (cart != null) {
//
//			totalPrice = 0;
//			for (CartItem item : cart.getAllItems().values()) {
//				totalPrice += item.getPrice() * item.getQuantity();
//			}
//			session.setAttribute("totalPrice", totalPrice);
//		}
//		Order order = new Order();
//		OrderImpl orderdaoImpl = new OrderImpl();
//		orderdaoImpl.insert(order);
//	    int orderId = orderdaoImpl.insert(order);
//		
//		OrderItemImpl orderItemDao = new OrderItemImpl();
//        if (cart != null) {
//        	Map<Integer, CartItem> items = cart.getAllItems();
//            for (Map.Entry<Integer, CartItem> entry : items.entrySet()) {
//                CartItem item = entry.getValue();
//                int menuId = entry.getKey();
//                
//                int quantity = item.getQuantity();
//                String name = item.getName();
//                double itemTotal = item.getPrice();
//               
//                OrderItems orderItem = new OrderItems(orderItemId,orderId,menuId,quantity,itemTotal);
//                orderItemDao.addOrderItem(orderItem);
//            }
//        }
//		resp.sendRedirect("placeOrder.jsp");
//	}
//
//}