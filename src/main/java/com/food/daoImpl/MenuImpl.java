package com.food.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import com.food.dao.MenuDAO;
import com.food.model.Menu;
import com.food.util.DBConnectionUtil;


public  class MenuImpl implements MenuDAO {


	 private static final String FETCHMENU="select * from menu where restaurantId=?";
   
	static Connection con;

	static 
	{
		con=DBConnectionUtil.connect();
	}

	private PreparedStatement pstmt;
	private ResultSet resultset;
	
	@Override
	public ArrayList fetchMenuByRestaurant(int restaurantId) {
		 ArrayList<Menu> menuList=new ArrayList<>();
		try
		{
			pstmt=con.prepareStatement(FETCHMENU);
			pstmt.setInt(1, restaurantId);
			
			 resultset=pstmt.executeQuery();			
			menuList=extractMenuListFromResultSet(resultset);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return menuList;
		}
	
	private ArrayList<Menu> extractMenuListFromResultSet(ResultSet resultSet)
	{
		ArrayList<Menu> menuList=new ArrayList<>();
		try 
		{	
			while(resultSet.next())
			{ 
				menuList.add(
						new Menu(
								resultSet.getInt("menuId"),
								resultSet.getInt("restaurantId"),
								resultSet.getString("name"),
								resultSet.getString("description"),
								resultSet.getInt("price"),  
								resultSet.getBoolean("isAvailable"), 
								resultSet.getString("imagePath") 
							 
								)
						);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return menuList;
	}
	
	public Menu getMenu(int menuId) {
	    String query = "SELECT * FROM menu WHERE menuId = ?";
	    PreparedStatement statement;
		try {
			statement = con.prepareStatement(query);
			statement.setInt(1, menuId);
		    ResultSet resultSet = statement.executeQuery();
		
	    if (resultSet.next()) {
	        return new Menu(
	            resultSet.getInt("menuId"),
	            resultSet.getInt("restaurantId"),
	            resultSet.getString("name"),
	            resultSet.getInt("price")
	        );
	    }
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return null; 
	}


	}
	



