package com.food.daoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.food.dao.RestaurantDao;
import com.food.model.Restaurant;
import com.food.util.DBConnectionUtil;

public class RestaurantDaoImpl implements RestaurantDao {
	static ArrayList<Restaurant> restaurantList=new ArrayList<Restaurant>();
	private static final  String FETCHALL = "select * from Restaurant";

	static Connection con;

	static {
		con=DBConnectionUtil.connect();
	}

	private Statement stmt;
	private ResultSet resultSet;
	
	@Override
	public ArrayList<Restaurant> fetchAll() {
		try {
			stmt = con.createStatement();
			resultSet = stmt.executeQuery(FETCHALL);
			restaurantList = extractRestaurantListFromResultSet(resultSet);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return restaurantList;

	}
	ArrayList<Restaurant> extractRestaurantListFromResultSet(ResultSet resultSet) {

		try {
			while(resultSet.next()) {

				restaurantList.add(new Restaurant(
						resultSet.getInt("restaurantId"),
						resultSet.getString("name"),
						resultSet.getString("CuisineType"),
						resultSet.getInt("deliveryTime"),
						resultSet.getString("address"),
						resultSet.getFloat("ratings"),
						resultSet.getBoolean("isActive"),
						resultSet.getString("imagePath")));
			}

		}
		catch(Exception e) {
			e.printStackTrace();

		}
		return restaurantList;
	}
	


}