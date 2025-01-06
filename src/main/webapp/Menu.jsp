<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.food.model.Menu"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
	min-height: 100vh;
}

/*header*/
.header {
	background: linear-gradient(to right, #2ecc71, #27ae60);
	color: white;
	padding: 1rem 2rem;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0;
	z-index: 1000;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header h1 {
	font-size: 1.5rem;
	margin: 0;
}

.cart-icon {
	position: relative;
	cursor: pointer;
}

.cart-count {
	position: absolute;
	top: -8px;
	right: -8px;
	background: white;
	color: #2ecc71;
	border-radius: 50%;
	width: 20px;
	height: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 0.8rem;
	font-weight: bold;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.menu-category {
	margin-bottom: 20px;
	background: white;
	border-radius: 10px;
	padding: 15px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}

.category-title {
	color: #2ecc71;
	font-size: 1.2rem;
	margin-bottom: 15px;
	padding-bottom: 8px;
	border-bottom: 2px solid #eee;
}

/*menu*/
.menu-item {
	display: flex;
	align-items: center;
	padding: 15px;
	border-bottom: 1px solid #eee;
	transition: transform 0.2s;
}

.menu-item:last-child {
	border-bottom: none;
}

.menu-item:hover {
	transform: translateX(5px);
	background-color: #f8f9fa;
}

.item-image {
	width: 80px;
	height: 80px;
	border-radius: 8px;
	object-fit: cover;
	margin-right: 15px;
}

.item-details {
	flex: 1;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.item-info {
	flex: 1;
}

.item-title {
	font-size: 1.1rem;
	font-weight: 600;
	color: #333;
	margin-bottom: 5px;
	display: flex;
	align-items: center;
}

.item-description {
	font-size: 0.9rem;
	color: #666;
	margin-bottom: 8px;
	line-height: 1.4;
}

.item-meta {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 12px;
}

.item-price {
	font-weight: 600;
	color: #2ecc71;
	font-size: 1.1rem;
	margin-bottom: 0;
}

.availability-status {
	display: flex;
	align-items: center;
	gap: 5px;
	padding: 4px 8px;
	border-radius: 4px;
	font-size: 0.85rem;
	font-weight: 500;
}

.status-available {
	background-color: #e8f5e9;
	color: #2ecc71;
}

.status-unavailable {
	background-color: #ffebee;
	color: #dc3545;
}

.add-to-cart {
	background: #2ecc71;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 6px;
	cursor: pointer;
	font-size: 0.9rem;
	display: flex;
	align-items: center;
	gap: 5px;
	transition: all 0.3s ease;
}

.add-to-cart:hover {
	background: #27ae60;
	transform: translateY(-2px);
}

.veg-badge {
	width: 15px;
	height: 15px;
	border: 1px solid #2ecc71;
	border-radius: 3px;
	margin-right: 8px;
	position: relative;
}

.veg-badge::after {
	content: '';
	width: 7px;
	height: 7px;
	background-color: #2ecc71;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

@media ( max-width : 600px) {
	.container {
		padding: 10px;
	}
	.menu-item {
		padding: 10px;
		flex-direction: column;
		align-items: flex-start;
	}
	.item-image {
		width: 100%;
		height: 200px;
		margin-bottom: 10px;
		margin-right: 0;
	}
	.item-details {
		width: 100%;
	}
	.item-meta {
		flex-direction: column;
		align-items: flex-start;
		gap: 8px;
	}
}
</style>
</head>
<body>
	<div class="header">
		<h1>
			<i class="fas fa-utensils"></i> Restaurant Menu
		</h1>
		<div class="cart-icon">
			<i class="fas fa-shopping-cart"></i> <span class="cart-count"></span>
		</div>
	</div>

	<div class="container">
		<div class="menu-category">
			<h2 class="category-title">Popular Items</h2>
			<% 
            ArrayList<Menu> menuList = (ArrayList<Menu>) request.getAttribute("menuList");
            if (menuList != null && !menuList.isEmpty()) {
                for (Menu m : menuList) {
            %>
			<div class="menu-item">
				<img src="<%= m.getImagePath() %>" alt="<%= m.getName() %>"
					class="item-image">
				<div class="item-details">
					<div class="item-info">
						<div class="item-title">
							<div class="veg-badge"></div>
							<%= m.getName() %>
						</div>
						<div class="item-description"><%= m.getDescription() %></div>
						<div class="item-meta">
							<div class="item-price">
								₹<%= m.getPrice() %></div>
							<div
								class="availability-status <%= m.getIsAvailable() ? "status-available" : "status-unavailable" %>">
								<i
									class="fas <%= m.getIsAvailable() ? "fa-circle-check" : "fa-circle-xmark" %>"></i>
								<%= m.getIsAvailable() ? "Available" : "Not Available" %>
							</div>
						</div>

						<form action="cart" method="post">
							<input type="hidden" name="action" value="add"> <input
								type="hidden" name="itemId" value="<%= m.getMenuId() %>">
							<button type="submit" class="add-to-cart">
								<i class="fas fa-cart-plus"></i> Add to Cart
							</button>
						</form>

					</div>
				</div>
			</div>
			<% 
                }
            } else {
            %>
			<div style="text-align: center; padding: 20px; color: #666;">
				<i class="fas fa-empty-plate"
					style="font-size: 2rem; margin-bottom: 10px;"></i>
				<p>No menu items available at the moment</p>
			</div>
			<% 
            }
            %>
		</div>
	</div>
</body>
</html>