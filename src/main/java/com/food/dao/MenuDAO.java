package com.food.dao;




import java.util.ArrayList;

import com.food.model.Menu;

public interface MenuDAO {
	
	ArrayList<Menu> fetchMenuByRestaurant(int restaurantId);

	Menu getMenu(int menuId);

	

}
