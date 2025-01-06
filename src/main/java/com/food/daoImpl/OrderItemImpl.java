
package com.food.daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.food.dao.OrderItemDao;
import com.food.model.OrderItems;

public class OrderItemImpl implements OrderItemDao {

	private static Connection connection = null;

	// SQL Queries
	static final String INSERT_QUERY = "INSERT INTO `orderitems`( `orderitemId`,`orderId`, `menuId`, `quantity`,`itemTotal`)VALUES(?,?,?,?,?)";
//	static final String SELECT_QUERY = "SELECT * FROM `orderitems` WHERE `orderItemId`=?";
//	static final String SELECT_BY_ORDERID_QUERY = "SELECT * FROM `orderitems` WHERE `orderId`=?";
//	static final String SELECT_ALL_QUERY = "SELECT * FROM `orderitems`";
//	static final String UPDATE_QUERY = "UPDATE `orderitems` set `menuId`=?,  `quantity`=?,`itemTotal`=? WHERE `orderItemId`=?";
//	static final String DELETE_QUERY = "DELETE FROM `orderitems` WHERE `orderItemId`=?";
//	static final String SELECT_ALL_QUERY_BY_USERID = "SELECT * FROM `orderitems` Where `menuId`=?";

	public OrderItemImpl() {
		// when we call constructor or create object these things will happen
		String url = "jdbc:mysql://localhost:3306/foodapp";
		String username = "root";
		String password = "root";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(OrderItems orderItem) {
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(INSERT_QUERY);

			prepareStatement.setInt(1, orderItem.getOrderItemId());
			prepareStatement.setInt(2, orderItem.getOrderId());
			prepareStatement.setInt(3, orderItem.getMenuId());
			prepareStatement.setInt(4, orderItem.getQuantity());
			prepareStatement.setDouble(5, orderItem.getItemTotal());
			
			return prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;

	}
}

//	@Override
//	public OrderItems getOrderItem(int orderItemId) {
//		PreparedStatement prepareStatement = null;
//		ResultSet res = null;
//		OrderItems orderItem = null;
//
//		try {
//			prepareStatement = connection.prepareStatement(SELECT_QUERY);
//			prepareStatement.setInt(1, orderItemId);
//
//			res = prepareStatement.executeQuery();
//
//			if (res.next()) {
//				int orderitemId = res.getInt("userId");
//				int orderId = res.getInt("restaurantId");
//				int menuId = res.getInt("menuId");
//				int quantity = res.getInt("quantity");
//				double itemTotal = res.getDouble("totalAmount");
//				orderItem = new OrderItems(orderitemId, orderId, menuId, quantity);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (prepareStatement != null)
//				try {
//					prepareStatement.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//		}
//
//		return orderItem;
//	}
//}

//	@Override
//	public List<OrderItem> getAllByOrderId(int orderId) {
//		 PreparedStatement prepareStatement = null;
//		ResultSet res = null;
//		OrderItem orderItem = null;
//		ArrayList<OrderItem> OrderItemsList = new ArrayList<OrderItem>();
//		
//		try {
//			prepareStatement = connection.prepareStatement(SELECT_BY_ORDERID_QUERY);
//			prepareStatement.setInt(1, orderId);
//			
//			res = prepareStatement.executeQuery();
//			while (res.next()) {
//				int orderItemId = res.getInt("orderItemId");
//				int userId = res.getInt("userId");
//				int restaurantId = res.getInt("restaurantId");
//				int menuId = res.getInt("menuId");
//				String itemName = res.getString("itemName");
//				int quantity = res.getInt("quantity");
//				double price = res.getDouble("price");
//				double totalAmount = res.getDouble("totalAmount");
//				
//				orderItem = new OrderItem(orderItemId, userId, restaurantId, menuId, itemName, quantity, price,
//						totalAmount);
//				OrderItemsList.add(orderItem);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} 
//		return OrderItemsList;
//	}
//	@Override
//	public List<OrderItem> getAll() {
//		Statement createStatement = null;
//		ResultSet res = null;
//		OrderItem orderItem = null;
//		ArrayList<OrderItem> OrderItemsList = new ArrayList<OrderItem>();
//
//		try {
//			createStatement = connection.createStatement();
//
//			res = createStatement.executeQuery(SELECT_ALL_QUERY);
//			while (res.next()) {
//				int orderItemId = res.getInt("orderItemId");
//				int userId = res.getInt("userId");
//				int restaurantId = res.getInt("restaurantId");
//				int menuId = res.getInt("menuId");
//				String itemName = res.getString("itemName");
//				int quantity = res.getInt("quantity");
//				double price = res.getDouble("price");
//				double totalAmount = res.getDouble("totalAmount");
//
//				orderItem = new OrderItem(orderItemId, userId, restaurantId, menuId, itemName, quantity, price,
//						totalAmount);
//				OrderItemsList.add(orderItem);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (createStatement != null)
//				try {
//					createStatement.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//		}
//		return OrderItemsList;
//	}
//
//	@Override
//	public void UpdateOrderItem(OrderItem orderItem) {
//		PreparedStatement prepareStatement = null;
//		try {
//			prepareStatement = connection.prepareStatement(UPDATE_QUERY);
//
//			prepareStatement.setInt(1, orderItem.getUserId());
//			prepareStatement.setInt(2, orderItem.getRestaurantId());
//			prepareStatement.setInt(3, orderItem.getMenuId());
//			prepareStatement.setString(4, orderItem.getItemName());
// 
//			prepareStatement.setInt(5, orderItem.getQuantity());
//			prepareStatement.setDouble(6, orderItem.getPrice());
//			prepareStatement.setDouble(7, orderItem.getTotalAmount());
//
//			prepareStatement.setInt(8, orderItem.getOrderItemId());
//
//			prepareStatement.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (prepareStatement != null)
//				try {
//					prepareStatement.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//		}
//
//	}
//
//	@Override
//	public void deleteOrderItem(int orderItemId) {
//		PreparedStatement prepareStatement = null;
//		try {
//			prepareStatement = connection.prepareStatement(DELETE_QUERY);
//			prepareStatement.setInt(1, orderItemId);
//
//			prepareStatement.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (prepareStatement != null)
//				try {
//					prepareStatement.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//		}
//
//	}
//
//	@Override
//	public List<OrderItem> getAllOrderItemsByUserId(int userid) {
//		PreparedStatement prepareStatement = null;
//		ResultSet res = null;
//		OrderItem orderItem = null;
//		ArrayList<OrderItem> OrderItemsList = new ArrayList<OrderItem>();
//
//		try {
//			prepareStatement = connection.prepareStatement(SELECT_ALL_QUERY_BY_USERID);
//			prepareStatement.setInt(1, userid);
//
//			res = prepareStatement.executeQuery();
//
//			while (res.next()) {
//				int orderItemId = res.getInt("orderItemId");
//				int userId = res.getInt("userId");
//				int restaurantId = res.getInt("restaurantId");
//				int menuId = res.getInt("menuId");
//				String itemName = res.getString("itemName");
//				int quantity = res.getInt("quantity");
//				double price = res.getDouble("price");
//				double totalAmount = res.getDouble("totalAmount");
//
//				orderItem = new OrderItem(orderItemId, userId, restaurantId, menuId, itemName, quantity, price,
//						totalAmount);
//				OrderItemsList.add(orderItem);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (prepareStatement != null)
//				try {
//					prepareStatement.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//		}
//
//		return OrderItemsList;
//	}


