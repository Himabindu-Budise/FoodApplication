<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thank You</title>
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

.container {
	width: 40%;
	margin: 50px auto;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

h2 {
	color: #2ecc71;
	font-size: 1.8em;
	margin-bottom: 20px;
}

p {
	font-size: 1.1em;
	margin: 10px 0;
	color: #555;
}

.icon {
	font-size: 4rem;
	color: #2ecc71;
	margin-bottom: 15px;
}

.back-link {
	display: inline-block;
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #2ecc71;
	color: #ffffff;
	text-decoration: none;
	font-size: 1em;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.back-link:hover {
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
	<div class="container">
		<div class="icon">✅</div>
		<h2>Thank You for Reaching Out!</h2>
		<p>We have received your message and will review your issue as
			soon as possible.</p>
		<p>Our team will get back to you promptly to ensure your query is
			resolved.</p>
		<p>Meanwhile, feel free to browse our website or contact us for
			further assistance.</p>
		<a href="home.jsp" class="back-link">Back</a>
	</div>
	<footer>Thank you for choosing TapBites!</footer>
</body>
</html>
