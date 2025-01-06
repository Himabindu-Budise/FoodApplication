<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.food.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Help & Support</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f3f6fb;
	color: #333;
	margin: 0;
	padding: 0;
}

header {
	background-color: #2ecc71;
	color: #ffffff;
	padding: 15px;
	text-align: center;
	font-size: 1.8em;
}

.navbar {
	background-color: #2ecc71;
	padding: 10px;
	text-align: center;
}

.navbar a {
	color: #ffffff;
	text-decoration: none;
	padding: 10px 20px;
	display: inline-block;
	font-size: 1em;
}

.navbar a:hover {
	background-color: #27ae60;
	border-radius: 5px;
}

.container {
	width: 80%;
	margin: 20px auto;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: black;
	text-align: center;
	margin-bottom: 15px;
	font-size: 1.5em;
}

.submit-link {
	display: inline-block;
	background-color: #2ecc71;
	color: #ffffff;
	padding: 10px 15px;
	text-decoration: none;
	border-radius: 5px;
	font-size: 1em;
	font-weight: bold;
	text-align: center;
	transition: background-color 0.3s ease;
	cursor: pointer;
}

.submit-link:hover {
	background-color: #27ae60;
}

.contact-info {
	margin: 15px 0;
	padding: 15px;
	background-color: #eafaf1;
	border-radius: 8px;
	font-size: 1em;
}

.contact-info p {
	margin: 10px 0;
}

.contact-form {
	margin-top: 20px;
	padding: 15px;
	background-color: #f9f9f9;
	border-radius: 8px;
}

.contact-form label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
	color: #333;
}

.contact-form input, .contact-form textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 1em;
}

.contact-form textarea {
	resize: none;
	height: 80px;
}

.contact-form button {
	background-color: #2ecc71;
	color: #ffffff;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1em;
}

.contact-form button:hover {
	background-color: #27ae60;
}

footer {
	text-align: center;
	padding: 10px;
	background-color: #2ecc71;
	color: #ffffff;
	font-size: 0.9em;
}
</style>
</head>
<body>

	<header>Help & Support</header>



	<div class="container">
		<h2>We're Here to Help!</h2>

		<div class="contact-info">
			<p>
				<strong>Phone:</strong> +91 6745789091
			</p>
			<p>
				<strong>Email:</strong> support@tapbites.com
			</p>
			<p>
				<strong>Address:</strong> BTM 1st stage, Watertank Street,
				Bangalore, Karnataka, India
			</p>
			<p>
				<strong>Hours:</strong> 8:00 AM - 10:00 PM IST
			</p>
		</div>

		<div class="contact-form">
			<h2>Contact Us</h2>
			<form action="" method="post">
				<label for="name">Your Name:</label> <input type="name" name="name"
					placeholder="Enter your name" required> <label for="email">Your
					Email:</label> <input type="email" name="email"
					placeholder="Enter your email" required> <label
					for="message">Your Message:</label>
				<textarea id="message" name="message"
					placeholder="Write your message here" required></textarea>

				<a href="feedback.jsp" class="submit-link">Submit</a>

			</form>
		</div>
	</div>

	<footer>Need more assistance? Feel free to reach out to us!</footer>

</body>
</html>
