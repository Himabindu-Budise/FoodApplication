package com.food.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, CartItem> items;

    public Cart() {
        items = new HashMap<>();
    }

    public void addItem(CartItem Item) {
    	int itemId=Item.getItemId();
    	System.out.println(itemId);
        if (items.containsKey(itemId)) {
            CartItem existingItem = items.get(Item.getItemId());
            existingItem.setQuantity(existingItem.getQuantity() + Item.getQuantity());
        } else {
            items.put(Item.getItemId(), Item);
        }
    }

    public void updateItem(int itemId, int quantity) {
        if (items.containsKey(itemId)) {
            CartItem item = items.get(itemId);
            item.setQuantity(quantity);
            if (quantity <= 0) {
                removeItem(itemId);
            }
        }
    }

    public void removeItem(int itemId) {
        items.remove(itemId);
    }

    
    public Map<Integer, CartItem> getAllItems() {
        return items;
    }

    
    public void clearCart() {
        items.clear();
    }

   
    public double calculateTotalAmount() {
        double total = 0.0;
        for (CartItem item : items.values()) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }

    @Override
    public String toString() {
        StringBuilder cartContents = new StringBuilder();
        for (CartItem item : items.values()) {
            cartContents.append(item.toString()).append("\n");
        }
        return cartContents.toString();
    }

	
}