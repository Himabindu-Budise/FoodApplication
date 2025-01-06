<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.food.model.Restaurant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Popular Restaurants</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	min-height: 100vh;
}
/*navbar*/
.navbar {
	background-color: #2ecc71;
	padding: 1rem 1rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.logo-container {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 10px 20px; 
}

.logo-container img {
	width: 40px; 
	height: 40px; 
	margin-right: 10px; 
}

.logo-container span {
	font-size: 24px; 
	font-weight: bold;
	color: white; 
	letter-spacing: 1px;
}

.navbar-brand span {
	font-size: 20px;
	font-weight: bold;
	color: white;
	letter-spacing: 2px;
	white-space: nowrap;
}

.nav-links {
	display: flex;
	gap: 5rem;
	justify-content: center; 
	margin: 0 auto;
	padding: 0;
}

.nav-links a {
	color: white;
	text-decoration: none;
	font-weight: 600;
	transition: color 0.3s ease;
}

.nav-links a:hover {
	color: #eee;
}

.auth-buttons {
	display: flex;
	gap: 2rem;
}

.auth-button {
	padding: 0.5rem 1.5rem;
	border-radius: 25px;
	font-weight: 600;
	text-decoration: none;
	transition: all 0.3s ease;
}

.signin {
	background: transparent;
	border: 2px solid white;
	color: white;
}

.signup {
	background: white;
	color: #2ecc71;
}

.signin:hover {
	background: rgba(255, 255, 255, 0.1);
}

.signup:hover {
	background: #f8f8f8;
}

.hero-section {
	height: 40vh;
	position: relative;
	overflow: hidden;
}
/* Navbar styling */
.navbar {
    display: flex;
    justify-content: flex-end;
    padding: 10px 20px;
    align-items: center;
    position: relative;
}

/* Profile section styling */
.profile-section {
    position: relative;
   
    align-items: center;
    justify-content: flex-end;
}

.profile-section .dropdown {
    position: relative;
}

.profile-section .dropdown .d-flex {
    display: flex;
    align-items: center;
    cursor: pointer;
}

.profile-section .dropdown .d-flex span {
    color: white;
    margin-right: 10px;
    font-weight: bold;
    font-size: 16px;
}

.profile-section .dropdown .d-flex i {
    font-size: 2.2rem;
    color: white;
}

/* Dropdown menu styling */
.profile-section .dropdown-menu {
    
    border-radius: 8px;
    min-width: 200px;
    padding: 10px 0;
    position: absolute;
    right: 0; 
    top: 100%; 
    z-index: 1000;
    display: none; 
}

.profile-section .dropdown:hover .dropdown-menu {
    display: block;
}

/* Dropdown item styling */
.profile-section .dropdown-item {
    display: flex;
    align-items: center;
    padding: 10px 20px;
    color: #333;
    font-size: 16px;
    text-decoration: none;
    transition: background-color 0.3s;
}

.profile-section .dropdown-item:hover {
    background-color: #f0f0f0;
    color: #007bff; 
}

.profile-section .dropdown-item i {
    font-size: 18px;
    margin-right: 10px;
}

.profile-section .dropdown-item.text-danger {
    color: #dc3545; 
}

.profile-section .dropdown-item.text-danger:hover {
    background-color: #f8d7da;
}

.profile-section .dropdown-divider {
    margin: 5px 0;
    border-top: 1px solid #e0e0e0;
}


/* Card Styles */
.card {
	background: white;
	border-radius: 15px;
	overflow: hidden;
	transition: transform 0.3s;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	width: 100%;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-image-link {
	display: block;
	position: relative;
	padding-top: 75%;
}

.card-image-link img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.card-body {
	padding: 15px;
}

.card-title {
	font-size: 1.1rem;
	font-weight: 600;
	color: #333;
	margin-bottom: 8px;
}

.card-text {
	font-size: 0.9rem;
	color: #666;
	margin: 6px 0;
	display: flex;
	align-items: center;
	gap: 8px;
}

.card-rating {
	color: #2ecc71;
	font-weight: 500;
	font-size: 0.9rem;
	display: flex;
	align-items: center;
	gap: 5px;
}

.status-active {
	color: #2ecc71;
	font-size: 0.85rem;
}

.status-inactive {
	color: #e74c3c;
	font-size: 0.85rem;
}

/* Update card styles for better contrast */
.card {
	background: white;
	border-radius: 12px;
	overflow: hidden;
	transition: transform 0.3s;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	width: 100%;
	backdrop-filter: blur(10px);
}

/*restaurant cards */
.restaurant-container {
	max-width: 1200px;
	margin: 20px auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	gap: 20px;
	padding: 10px;
}

.restaurant-card {
	flex: 1 1 calc(33% - 20px); 
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.3s, box-shadow 0.3s;
	text-align: center;
}

.restaurant-card:hover {
	transform: scale(1.05);
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
}

.restaurant-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.restaurant-card .content {
	padding: 15px;
}

.restaurant-card h3 {
	font-size: 1.2em;
	margin: 10px 0;
	color: #333;
}

.restaurant-card .rating {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
}

.restaurant-card .rating span {
	margin-left: 5px;
	font-size: 1em;
	color: #555;
}

.restaurant-card .rating .star {
	color: #f1c40f;
}

.card-container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 6rem;
	padding: 2rem;
	max-width: 1200px;
	margin: 0 auto;
}

/* Responsive Design */
@media ( max-width : 1200px) {
	.card-container {
		padding: 1.5rem;
		gap: 1.5rem;
	}
}

@media ( max-width : 992px) {
	.card-container {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 576px) {
	.card-container {
		grid-template-columns: 1fr;
		padding: 1rem;
		gap: 1rem;
	}
	.navbar {
		padding: 0.8rem 1rem;
	}
	.cuisine-container {
		padding: 0 1rem;
	}
}

@media ( max-width : 768px) {
	.nav-links {
		display: none;
	}
	.navbar {
		padding: 1rem;
	}
	.auth-buttons {
		gap: 0.5rem;
	}
	.auth-button {
		padding: 0.5rem 1rem;
	}
	.quote {
		font-size: 2rem;
		padding: 0 1rem;
	}
	.description {
		font-size: 1rem;
		padding: 0 1rem;
	}
	.hero-section {
		height: 40vh;
	}
	.content-section {
		padding: 2rem 1rem;
	}
}

/* Responsive Design: Mobile view */
@media screen and (max-width: 768px) {
	.navbar {
		flex-direction: column;
		align-items: center;
		padding: 10px;
	}
	.nav-links {
		flex-direction: column;
		margin-bottom: 10px;
	}
	.auth-buttons {
		margin-top: 10px;
		gap: 10px;
	}
	.overlay {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0.5);
		z-index: 1;
	}
	.header {
		display: flex;
		justify-content: flex-end;
		align-items: center;
		padding: 20px;
		z-index: 2;
		position: relative;
	}
	.header button {
		background-color: green;
		color: white;
		border: none;
		padding: 10px 20px;
		margin-left: 10px;
		cursor: pointer;
		font-size: 16px;
		border-radius: 5px;
	}
	.header button:hover {
		background-color: green;
	}
	.quote-box {
		position: absolute;
		top: 70%;
		left: 60%;
		transform: translate(-50%, -50%);
		text-align: right;
		z-index: 2;
	}
	.quote {
		font-size: 60px;
		margin-bottom: 20px;
		animation: fade 6s infinite;
	}
}

@
keyframes fade { 0%, 100% {
	opacity: 0;
}
50
%
{
opacity
:
4;
}
}
}
</style>
</head>
<body>

	<nav class="navbar">
		<div class="logo-container">
			<img src="AppImages/logofood.png" alt="TapBites Logo"> <span>TapBites</span>
		</div>


		<div class="nav-links">
			<a href="index.jsp">Home</a> <a href="home.jsp">Restaurants</a> <a
				href="Cart1.jsp">Orders</a> <a href="help.jsp">Help</a>
		</div>
		<div class="navbar">
    <div class="profile-section">
        <div class="dropdown">
            <div class="d-flex align-items-center" data-bs-toggle="dropdown">
              
                <i class="fas fa-user-circle text-white" style="font-size: 2.2rem; cursor: pointer;"></i>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>My Profile</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-history me-2"></i>Orders</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-heart me-2"></i>Favorites</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-address-book me-2"></i>Addresses</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="Login.jsp"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
		
	</nav>

	<!-- Restaurant Cards Container -->
	<div class="card-container">
		<% 
        ArrayList<Restaurant> rList = (ArrayList<Restaurant>) session.getAttribute("restaurantList");
        if (rList != null && !rList.isEmpty()) { 
            for (Restaurant restaurant : rList) { 
        %>
		<div class="card">
			<a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>"
				class="card-image-link"> <img
				src="<%= restaurant.getImagePath() %>"
				alt="<%= restaurant.getName() %>">
			</a>
			<div class="card-body">
				<div
					style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">

					<h2 class="card-title"><%= restaurant.getName() %></h2>
					<span class="card-rating"> <i class="fas fa-star"></i> <%= restaurant.getRatings() %>
					</span>
				</div>
				<p class="card-text">
					<i class="fas fa-utensils"></i>
					<%= restaurant.getCuisineType() %>
				</p>
				<p class="card-text">
					<i class="fas fa-clock"></i>
					<%= restaurant.getDeliveryTime() %>
					mins
				</p>
				<p class="card-text">
					<i class="fas fa-map-marker-alt"></i>
					<%= restaurant.getAddress() %>
				</p>
				<p
					class="card-text <%= restaurant.getIsActive() ? "status-active" : "status-inactive" %>">
					<i class="fas fa-circle"></i>
					<%= restaurant.getIsActive() ? "Open Now" : "Closed" %>
				</p>

			</div>
		</div>
		<% 
            }
        } else { 
        %>
		<div style="text-align: center; grid-column: 1/-1; padding: 2rem;">

		</div>
		<% } %>
	</div>

</body>
</html>