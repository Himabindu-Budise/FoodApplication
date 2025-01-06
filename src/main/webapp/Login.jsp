<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
		url('https://images.pexels.com/photos/1640774/pexels-photo-1640774.jpeg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

/*container styling*/
.container {
	background-color: rgba(255, 255, 255, 0.95);
	padding: 1.8rem;
	border-radius: 15px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 320px;
	margin: 15px;
}

.logo-container {
	text-align: center;
	margin: 20px 0;
}

.logo-icon {
	width: 60px;
	height: auto;
	display: block;
	margin: 0 auto;
}

.logo-container h1 {
	font-size: 1.8rem;
	color: #2ecc71;
	margin-top: 10px;
	font-weight: bold;
	font-family: Arial, sans-serif;
}

h1 {
	color: #2ecc71;
	text-align: center;
	margin-bottom: 1.2rem;
	font-size: 1.5rem;
	font-weight: 600;
}

.form-group {
	margin-bottom: 1rem;
	position: relative;
}

.form-group i {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: green;
	font-size: 0.9rem;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px 10px 10px 30px;
	border: 1px solid green;
	border-radius: 6px;
	font-size: 0.9rem;
	transition: all 0.3s ease;
	box-sizing: border-box;
}

input[type="text"]:focus, input[type="password"]:focus {
	border-color: green;
	outline: none;
	box-shadow: 0 0 0 2px rgba(46, 204, 113, 0.1);
}

input[type="submit"] {
	width: 100%;
	background: linear-gradient(to right, #2ecc71, #27ae60);
	color: white;
	border: none;
	padding: 10px;
	border-radius: 6px;
	cursor: pointer;
	font-size: 0.9rem;
	font-weight: 500;
	transition: all 0.3s ease;
	margin-top: 0.5rem;
}

input[type="submit"]:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 8px rgba(46, 204, 113, 0.2);
}

.divider {
	text-align: center;
	margin: 1.2rem 0;
	position: relative;
	color: green;
	font-size: 0.9rem;
}

.divider::before, .divider::after {
	content: "";
	position: absolute;
	top: 50%;
	width: 45%;
	height: 1px;
	background-color: green;
}

.divider::before {
	left: 0;
}

.divider::after {
	right: 0;
}

p {
	text-align: center;
	margin-top: 1.2rem;
	color: #666;
	font-size: 0.9rem;
}

a {
	color: green;
	text-decoration: none;
	font-weight: 500;
	transition: color 0.3s ease;
}

a:hover {
	color: #27ae60;
}

@media ( max-width : 480px) {
	.container {
		padding: 1.5rem;
		margin: 1rem;
		max-width: 300px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="logo-container">
			<img src="AppImages/logoWhite.png" alt="TapBites Logo"
				class="logo-icon">
			<h1>Welcome to TapBites</h1>
		</div>



		<form action="Login" method="post">
			<div class="form-group">
				<i class="bi bi-envelope"></i> <input type="text" name="email"
					placeholder="Email" required>
			</div>
			<div class="form-group">
				<i class="bi bi-lock"></i> <input type="password" name="password"
					placeholder="Password" required>
			</div>
			<input type="submit" value="Login">
		</form>

		<div class="divider">or</div>

		<p>
			New to TapBites? <a href="Register.jsp">Create Account</a>
		</p>
	</div>
</body>
</html>