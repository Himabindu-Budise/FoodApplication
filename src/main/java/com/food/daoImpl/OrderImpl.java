package com.food.daoImpl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.food.dao.OrderDAO;
import com.food.model.Order;
import com.food.util.DBConnectionUtil;



public class OrderImpl implements OrderDAO 
{
	static ArrayList<Order> ordersList=new ArrayList<Order>();

	//	private static final String FETCHALL="select * from orders";
	//	private static final String FETCHONE="select * from orders where orderId=?";
	//	private static final String UPDATE="update orders set totalAmount=? where orderId=?";
	//	public static final String DELETE="delete from orders where orderId=?";
	static Connection con;

	static 
	{
		con=DBConnectionUtil.connect();
	}

	private PreparedStatement pstmt;
	//	private Statement stmt;
	//	private ResultSet resultSet;
	//	private Order o;
	//	private int orderid;
	@Override
	public int insert(Order order) {
		int orderId= 0;
		String query = "INSERT INTO orders (userId, restaurantId, totalAmount, paymentMode, status) VALUES (?, ?, ?, ?, ?)";

		try (PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
			pstmt.setInt(1, order.getUserId());
			pstmt.setInt(2, order.getRestaurantId());
			pstmt.setDouble(3, order.getTotalAmount());
			pstmt.setString(4, order.getPaymentMode());
			pstmt.setString(5, order.getStatus());

			int affectedRows = pstmt.executeUpdate();

			int rows = pstmt.executeUpdate();
			if (rows > 0) {
				ResultSet keys = pstmt.getGeneratedKeys();
				if (keys.next()) {
					orderId=keys.getInt(1);
					order.setOrderId(orderId);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderId;
	}
	//	@Override
	//	public ArrayList<Order> fetchAll() 
	//	{
	//		
	//		try 
	//		{
	//			stmt=con.createStatement();
	//			resultSet=stmt.executeQuery(FETCHALL);
	//			ordersList=extractOrderListFromResultSet(resultSet);
	//
	//		}
	//		catch(Exception e)
	//		{
	//			e.printStackTrace();
	//		}
	//		ArrayList<Order> orderList = null;
	//		return orderList;
	//	}
	//
	//	@Override
	//	public Order fetchOne(int orderid) 
	//	{
	//		try 
	//		{
	//			pstmt=con.prepareStatement(FETCHONE);
	//			pstmt.setInt(1, orderid);
	//			resultSet=pstmt.executeQuery();
	//			o=extractOrderListFromResultSet(resultSet).get(0);
	//		}
	//		catch(Exception e) {
	//			e.printStackTrace();
	//		}
	//
	//		return o;
	//	}
	//	ArrayList<Order> extractOrderListFromResultSet(ResultSet resultSet)
	//	{
	//		try 
	//		{	
	//			while(resultSet.next())
	//			{ 
	//				ordersList.add(
	//						new Order(
	//								resultSet.getInt("orderId"),
	//								resultSet.getInt("userId"),
	//								resultSet.getInt("restaurantId"),
	//								resultSet.getString("status"),  
	//								resultSet.getString("paymentMode") 
	//							 
	//								)
	//						);
	//			}
	//		}
	//		catch(Exception e)
	//		{
	//			e.printStackTrace();
	//		}
	//		return ordersList;
	//
	//	}
	//	@Override
	//	public int update(int orderId, int totalAmount) {
	//		try {
	//			pstmt=con.prepareStatement(UPDATE);
	//			pstmt.setFloat(1, totalAmount);
	//			pstmt.setInt(2,orderId);
	//			return pstmt.executeUpdate();
	//		}
	//
	//		catch(Exception e)
	//		{
	//			e.printStackTrace();
	//			return 0;
	//		}
	//
	//	}
	//	
	//
	//	@Override
	//	public int delete(int orderId) {
	//		try
	//		{
	//			pstmt=con.prepareStatement(DELETE);
	//			pstmt.setInt(1, orderId);
	//			return pstmt.executeUpdate();
	//		}
	//		catch(Exception e)
	//		{
	//			e.printStackTrace();
	//			return 0;
	//		}
	//
	//
	//	}
	//	

}

