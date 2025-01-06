<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<style>
/* Global styles */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

/* Navbar styles */
.navbar {
	background-color: #2ecc71; 
	color: white;
	padding: 14px 20px;
	text-align: center;
	position: sticky;
	top: 0;
	z-index: 1000;
}

.navbar h1 {
	margin: 0;
	font-size: 1.8rem;
	font-weight: bold;
}

/* Checkout container styles */
.container {
	max-width: 500px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	margin-bottom: 30px; 
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input, .form-group select, .form-group textarea {
	width: 90%;
	padding: 10px;
	border: 1px solid green;
	border-radius: 4px;
}

.form-group textarea {
	resize: vertical;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	background-color: green;
	border: none;
	border-radius: 4px;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	cursor: pointer;
	margin-top: 20px;
}

.btn:hover {
	background-color: #218838;
}

/* Responsive styles */
@media ( max-width : 600px) {
	.container {
		width: 90%;
	}
}
</style>
</head>
<body>
	<!-- Navbar -->
	<div class="navbar">
		<h1>Checkout</h1>
	</div>
	<div class="container">

		<form action="checkout" method="post">
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					id="username" name="username" required
					placeholder="Enter your username">
			</div>
			<div class="form-group">
				<label for="phoneNumber">Phone Number:</label> <input type="text"
					id="phoneNumber" name="phoneNumber" required
					placeholder="Enter your phone number">
			</div>

			<div class="form-group">
				<label for="street">Street Address:</label> <input type="text"
					id="street" name="street" required
					placeholder="Enter your street address">
			</div>

			<div class="form-group">
				<label for="pincode">Pincode:</label> <input type="text"
					id="pincode" name="pincode" required
					placeholder="Enter your pincode">
			</div>
			<div class="form-group">
				<label for="id">Order ID:</label> <input type="text" id="id"
					name="id" required placeholder="Enter your OrderId">
			</div>
			<div class="form-group">
				<label for="paymentMode">Payment Mode</label> <select
					id="paymentMode" name="paymentMode" required>
					<option value="">-- Select Payment Mode --</option>
					<option value="creditCard">Credit Card</option>
					<option value="debitCard">Debit Card</option>
					<option value="netBanking">Net Banking</option>
					<option value="upi">UPI</option>
					<option value="cashOnDelivery">Cash on Delivery</option>
				</select>
			</div>
			<button type="submit" class="btn">Place Order</button>
		</form>
	</div>
</body>
</html>
