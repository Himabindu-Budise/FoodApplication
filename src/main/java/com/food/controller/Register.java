package com.food.controller;

import java.io.IOException;

import com.food.dao.UserDao;
import com.food.daoImpl.UserDaoImpl;
import com.food.model.User;
import com.food.secure.EncryptData;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String password=req.getParameter("password");
		
		if(password.equals(req.getParameter("cpassword"))) {
			String username=EncryptData.encrypt(req.getParameter("username"));
		    password=EncryptData.encrypt(req.getParameter("password"));
			String email=EncryptData.encrypt(req.getParameter("email"));
			String address=EncryptData.encrypt(req.getParameter("address"));
		
			
			UserDao udaoi=new UserDaoImpl();
			udaoi.insert(new User(username,password,email,address));
			resp.sendRedirect("Login.jsp");
		}
		else {
			resp.sendRedirect("failure.jsp");
		}
	
}
	
}
