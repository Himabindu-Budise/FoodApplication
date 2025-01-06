package com.food.dao;

import java.util.ArrayList;

import com.food.model.User;

public interface UserDao {

	int insert(User u);
	ArrayList<User> fetchAll();
	User fetchOne(int i);
	int update(int userid,String password);
	int delete(int userid);


}
