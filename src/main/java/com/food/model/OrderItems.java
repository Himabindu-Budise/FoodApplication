package com.food.model;

public class OrderItems 
{
	private int orderItemId;
	private int orderId;
	private int menuId;
	private int quantity;
	private double itemTotal;
	
	
	public int getOrderItemId() {
		return   orderItemId;
	}
	
	

	public void setOrderitemId(int  orderItemId) {
		this. orderItemId =  orderItemId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getItemTotal() {
		return itemTotal;
	}
	public void setItemTotal(int itemTotal) {
		this.itemTotal = itemTotal;
	}
	

	public OrderItems(int orderItemId,int orderId, int menuId, int quantity, double itemTotal) {
		// TODO Auto-generated constructor stub
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotal = itemTotal;
	}

	@Override
	public String toString() {
		return orderItemId + "     " + orderId + "    " + menuId + "     "+ quantity + "      " + itemTotal;
	}
	public OrderItems() {
		super();
	}
}
