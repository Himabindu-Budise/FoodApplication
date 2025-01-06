package com.food.controller;

import java.io.IOException;

import java.util.ArrayList;

import com.food.daoImpl.RestaurantDaoImpl;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class getAllRestaurants extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDaoImpl rdaoi = new RestaurantDaoImpl();
		ArrayList<Restaurant> restaurantList =rdaoi.fetchAll();
		HttpSession session=req.getSession();
		session.setAttribute("restaurantList", restaurantList);

		resp.sendRedirect("home.jsp");
	}
}
