package com.food.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionUtil {
	
	static Connection con;
	public static Connection connect() {
		String url = "jdbc:mysql://localhost:3306/foodapp";
		String dbUn="root";
		String dbPwd="root";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return con = DriverManager.getConnection(url,dbUn,dbPwd);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;

	}

}
