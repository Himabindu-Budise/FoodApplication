<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.food.model.Cart"%>
<%@ page import="com.food.model.CartItem"%>
<%@ page import="java.util.*"%>
<%@ page import="jakarta.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<style>
/*  styles */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
	min-height: 100vh;
}

.header {
	background: linear-gradient(to right, #2ecc71, #27ae60);
	color: white;
	padding: 1rem 2rem;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0;
	z-index: 1000;
}

.header .navbar {
	display: flex;
	justify-content: center;
	align-items: center;
}

.navbar a {
	color: white;
	font-size: 1.5rem;
	text-decoration: none;
}

.navbar a:hover {
	text-decoration: none;
}
/*card styling*/
.cart-container {
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
}

.cart-item {
	background: white;
	border-radius: 10px;
	padding: 15px;
	margin-bottom: 15px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
	display: flex;
	justify-content: space-between;
	align-items: center;
	transition: transform 0.2s;
}

.cart-item:hover {
	transform: translateX(5px);
	background-color: #f8f9fa;
}

.item-details {
	flex: 1;
}

.item-details h3 {
	font-size: 1.1rem;
	font-weight: 600;
	color: #333;
	margin-bottom: 5px;
}

.item-details p {
	font-size: 0.9rem;
	color: #666;
	margin: 5px 0;
}

.quantity-controls {
	display: flex;
	align-items: center;
	gap: 12px;
	background: #f8f9fa;
	padding: 8px;
	border-radius: 8px;
}

.quantity-btn {
	width: 32px;
	height: 32px;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 1.2rem;
	background: #2ecc71;
	color: white;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.quantity-btn:hover:not(:disabled) {
	background: #27ae60;
	transform: translateY(-2px);
}

.quantity-btn:disabled {
	background: #ccc;
	cursor: not-allowed;
	opacity: 0.7;
}

.quantity {
	font-weight: 600;
	color: #333;
	min-width: 30px;
	text-align: center;
}

.remove-item-btn {
	margin-left: 20px;
}

.cart-summary {
	background: white;
	border-radius: 10px;
	padding: 20px;
	margin-top: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}

.cart-summary h3 {
	color: #333;
	font-size: 1.2rem;
	margin-bottom: 15px;
	padding-bottom: 8px;
	border-bottom: 2px solid #eee;
}

.cart-actions {
	display: flex;
	gap: 15px;
	margin-top: 20px;
}

.cart-actions .btn {
	padding: 12px 24px;
	font-size: 1rem;
}

.btn {
	padding: 8px 16px;
	border-radius: 6px;
	border: none;
	cursor: pointer;
	font-size: 0.9rem;
	display: inline-flex;
	align-items: center;
	gap: 5px;
	transition: all 0.3s ease;
	text-decoration: none;
	font-weight: 600;
}

.btn-primary {
	background: #2ecc71;
	color: white;
}

.btn-secondary {
	background: #6c757d;
	color: white;
}

.btn-danger {
	background: #dc3545;
	color: white;
}

.btn-success {
	background: #2ecc71;
	color: white;
}

.btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.empty-cart {
	text-align: center;
	padding: 40px;
	background: white;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}

.empty-cart p {
	color: #666;
	font-size: 1.1rem;
	margin-bottom: 20px;
}

@media ( max-width : 600px) {
	.cart-container {
		padding: 10px;
	}
	.cart-item {
		flex-direction: column;
		align-items: flex-start;
	}
	.item-actions {
		width: 100%;
		justify-content: space-between;
		margin-top: 10px;
	}
	.cart-actions {
		flex-direction: column;
	}
	.btn {
		width: 100%;
		justify-content: center;
	}
}
</style>
</head>
<body>
	<!-- Navbar -->
	<div class="header">
		<div class="navbar">

			<a href="Cart1.jsp">Cart</a>
		</div>
	</div>

	<div class="cart-container">

		<%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getAllItems().isEmpty()) {
        %>
		<div class="empty-cart">
			<p>Your cart is empty.</p>
			<a href="Menu.jsp" class="btn btn-primary">Browse Menu</a>
		</div>
		<%
        } else {
        int restaurantId = 0;
        if (!cart.getAllItems().isEmpty()) {
            restaurantId = cart.getAllItems().values().iterator().next().getRestaurantId();
        }
        %>
		<div class="cart-items">
			<%
            float totalAmount = 0;
            for (Map.Entry<Integer, CartItem> entry : cart.getAllItems().entrySet()) {
                CartItem item = entry.getValue();
                double itemTotal = item.getPrice() * item.getQuantity();
                totalAmount += itemTotal;
            %>
			<div class="cart-item">
				<div class="item-details">
					<h3><%= item.getName() %></h3>
					<p>
						Price per item: Rs.<%= String.format("%.2f", item.getPrice()) %></p>
					<p>
						Total: Rs.<%= String.format("%.2f", itemTotal) %></p>
				</div>
				<div class="item-actions"
					style="display: flex; justify-content: center; align-items: center;">
					<form action="cart" method="post" class="update-quantity-form"
						style="margin-right: 20px;">
						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="itemId" value="<%= item.getItemId() %>">
						<div class="quantity-controls">
							<button type="submit" name="quantity"
								value="<%= item.getQuantity() - 1 %>" class="quantity-btn"
								<%= item.getQuantity() <= 1 ? "disabled" : "" %>>-</button>
							<span class="quantity"><%= item.getQuantity() %></span>
							<button type="submit" name="quantity"
								value="<%= item.getQuantity() + 1 %>" class="quantity-btn">+</button>
						</div>
					</form>
					<form action="cart" method="post" class="remove-item-form">
						<input type="hidden" name="action" value="remove"> <input
							type="hidden" name="itemId" value="<%= item.getItemId() %>">
						<button type="submit" class="btn btn-danger remove-item-btn">Remove</button>
					</form>
				</div>
			</div>
			<%
            }
            %>
			<% session.setAttribute("restaurantId", restaurantId);%>
			<% session.setAttribute("totalAmount", totalAmount);%>
			<div class="cart-summary">
				<h3>
					Total Amount: Rs.<%= String.format("%.2f", totalAmount) %></h3>
				<div class="cart-actions">
					<a href="menu?restaurantId=<%= restaurantId %>"
						class="btn btn-secondary">Add More</a> <a href="checkout.jsp"
						class="btn btn-success">Proceed to Checkout</a>
				</div>
			</div>
		</div>
		<%
        }
        %>
	</div>
</body>
</html>
