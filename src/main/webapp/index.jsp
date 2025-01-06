<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TapBites</title>
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;600&display=swap"
	rel="stylesheet">
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
/*nav bar styling*/
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
	letter-spacing: 1px;
	white-space: nowrap;
}

.nav-links {
	display: flex;
	gap: 4rem;
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

/*home page styling*/
.hero-section {
	height: 40vh;
	position: relative;
	overflow: hidden;
}

.hero-image {
	width: calc(100% - 40px);
	height: calc(100% - 40px);
	object-fit: cover;
	margin: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.content-section {
	min-height: calc(40vh - 64px);
	background: linear-gradient(135deg, #f6f6f6 0%, #ffffff 100%);
	padding: 4rem 2rem;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.quote {
	font-family: 'Playfair Display', serif;
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 1.5rem;
	opacity: 1;
	transition: opacity 0.5s ease;
	background: linear-gradient(45deg, #2ecc71, #27ae60);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	max-width: 800px;
	text-align: center;
}

.description {
	font-size: 1.1rem;
	line-height: 1.6;
	margin-bottom: 2rem;
	color: #666;
	max-width: 600px;
}

.cta-button {
	padding: 1rem 2.5rem;
	font-size: 0.8rem;
	background: #2ecc71;
	color: white;
	border: none;
	border-radius: 25px;
	cursor: pointer;
	transition: all 0.3s ease;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 600;
}

.cta-button:hover {
	background: #27ae60;
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(46, 204, 113, 0.2);
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
	padding: 25px;
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
/* Cuisine Section Styles */
.cuisine-section {
	background: #f8f9fa;
	padding: 15px 0;
	border-bottom: 1px #eee;
	overflow-x: auto;
	white-space: nowrap;
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.card {
	background: white;
	border-radius: 12px;
	overflow: hidden;
	transition: transform 0.3s;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	width: 90%;
	backdrop-filter: blur(10px);
}

.restaurant-card {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 300px;
	border: 1px solid #ddd;
	border-radius: 25px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s, box-shadow 0.3s;
	background-color: #fff;
	text-align: center;
}

.restaurant-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.restaurant-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.restaurant-card .content {
	padding: 25px;
}

.restaurant-card h3 {
	font-size: 1.5rem;
	font-weight: bold;
	color: #d9534f;
	margin: 10px 0 5px;
}

.restaurant-card h4:first-of-type {
	font-size: 1.2rem;
	font-weight: 600;
	color: #5bc0de;
	margin: 5px 0;
}

.restaurant-card h4:nth-of-type(2) {
	font-size: 1rem;
	color: #777;
	margin: 5px 0;
}

.restaurant-card .rating {
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 1rem;
	margin-top: 10px;
}

.restaurant-card .rating .star {
	color: #ffc107;
	margin-right: 5px;
}

.cuisine-section {
	background: white;
	padding: 15px 0;
}

/* Search bar container styling */
.search-bar {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
	margin: 20px auto;
	width: 150%;
	max-width: 800px;
	background-color: white;
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.search-bar input {
	width: 100%;
	border: none;
	outline: none;
	padding: 10px 15px;
	font-size: 1rem;
	border-radius: 20px;
	background-color: transparent;
	color: white;
}

.search-bar input::placeholder {
	color: #aaa;
	font-style: italic;
}

.search-bar input:focus {
	background-color: white;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	color: #000;
}

.restaurant-container {
	max-width: 1200px;
	margin: 20px auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	gap: 20px;
	padding: 10px;
}

.restaurant-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: space-between;
}

.restaurant-card {
	flex: 1 1 calc(25% - 20px);
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.3s, box-shadow 0.3s;
	text-align: center;
	margin-bottom: 20px;
}

.restaurant-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
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

/* Cuisine Section Styles */
.cuisine-section {
	background: #f8f9fa;
	padding: 15px 0;
	border-bottom: 1px #eee;
	overflow-x: auto;
	white-space: nowrap;
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.cuisine-section::-webkit-scrollbar {
	display: none;
}

.cuisine-container {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 40px;
	padding: 0 2rem;
}

.cuisine-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	cursor: pointer;
	transition: transform 0.3s;
}

.cuisine-item:hover {
	transform: translateY(-3px);
}

.cuisine-img {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	padding: 2px;
	object-fit: cover;
}

.cuisine-name {
	margin-top: 15px;
	font-size: 0.8rem;
	color: #333;
}

/* Card Container Styles */
.card-container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 6rem;
	padding: 2rem;
	max-width: 1200px;
	margin: 0 auto;
}
/* Footer Section */
.footer {
	background-color: #4C585B;
	color: #ecf0f1;
	padding: 3rem 0 1rem;
	margin-top: 4rem;
	font-size: 14px;
}

.footer-container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 1rem;
}

.footer-content {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 2rem;
}

.footer-section h3 {
	margin-bottom: 1.5rem;
	font-size: 1.2rem;
	color: #f1c40f;
	text-transform: uppercase;
}

.footer-links {
	list-style: none;
	padding: 0;
}

.footer-link {
	margin-bottom: 1rem;
}

.footer-link a {
	color: #bdc3c7;
	text-decoration: none;
	transition: color 0.3s ease;
	display: flex;
	align-items: center;
	gap: 0.5rem;
}

.footer-link a:hover {
	color: #ecf0f1;
}

.app-downloads {
	display: flex;
	flex-direction: column;
	gap: 1rem;
	margin-top: 1rem;
}

.app-downloads img {
	width: 20px;
	cursor: pointer;
	transition: transform 0.3s ease;
}

.app-downloads img:hover {
	transform: scale(1.05);
}

.footer-bottom {
	text-align: center;
	padding-top: 1.5rem;
	border-top: 1px solid #7f8c8d;
	color: #bdc3c7;
	font-size: 13px;
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
		<div class="auth-buttons">

			<a href="Register.jsp" class="auth-button signup">Sign Up</a> <a
				href="Login.jsp" class="auth-button signin">Sign In</a>

		</div>
	</nav>


	<div class="hero-section">
		<img
			src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=100&w=2070"
			alt="Delicious Food" class="hero-image">
	</div>

	<div class="content-section">
		<h1 id="changing-quote" class="quote">Delicious food, delivered
			to your door</h1>
		<p id="quote-description" class="description">Experience the
			finest selection of local and international cuisines, delivered fresh
			to your doorstep. Our carefully curated restaurants ensure quality,
			taste, and timely delivery for the perfect dining experience.</p>
		<button class="cta-button">Order Now</button>
	</div>
	<div class="search-bar">
		<input type="text" placeholder="Search for restaurants or dishes...">
		        
	</div>


	<div class="cuisine-section">
		<div class="cuisine-container">
			<div class="cuisine-item">
				<img
					src="https://tse1.mm.bing.net/th?id=OIP.kaSjOKMkJgOlZ2xhVypcPAHaHa&pid=Api&P=0&h=180"
					class="cuisine-img" alt="Biryani"> <span class="cuisine-name">Biryani</span>
			</div>

			<div class="cuisine-item">
				<img
					src="https://tse3.mm.bing.net/th?id=OIP.QGRpX-jBKWVDCA0LgORcWwHaHa&pid=Api&P=0&h=180"
					class="cuisine-img" alt="Pizza"> <span class="cuisine-name">Pizza</span>
			</div>

			<div class="cuisine-item">
				<img
					src="https://tse4.mm.bing.net/th?id=OIP.3ViJ4L-RegRzf1Ma6TWAUAHaGk&pid=Api&P=0&h=180"
					class="cuisine-img" alt="Burger"> <span class="cuisine-name">Burger</span>
			</div>

			<div class="cuisine-item">
				<img
					src="https://tse2.mm.bing.net/th?id=OIP.MVxUxGbX0As84aoOI7Y0-QHaHa&pid=Api&P=0&h=180"
					class="cuisine-img" alt="Chicken"> <span class="cuisine-name">Chicken</span>
			</div>

			<div class="cuisine-item">
				<img
					src="https://tse1.mm.bing.net/th?id=OIP.HMnNos_6l85BVSnqBZTg0wHaHB&pid=Api&P=0&h=180"
					class="cuisine-img" alt="Thali"> <span class="cuisine-name">Desserts</span>
			</div>

			<div class="cuisine-item">
				<img
					src="https://tse3.mm.bing.net/th?id=OIP.FlS_CbzA1BCyilGNQKtYswHaHa&pid=Api&P=0&h=180"
					class="cuisine-img" alt="Rolls"> <span class="cuisine-name">Rolls</span>
			</div>

			<div class="cuisine-item">
				<img
					src="https://tse3.mm.bing.net/th?id=OIP.IQmScqOGsRybe13rZ5VCfAHaHa&pid=Api&P=0&h=180"
					class="cuisine-img" alt="Fried Rice"> <span
					class="cuisine-name">Fried Rice</span>
			</div>

			<div class="cuisine-item">
				<img
					src="https://tse3.mm.bing.net/th?id=OIP.lCjxsZYURUYWTVGkt6FECAHaHa&pid=Api&P=0&h=180"
					class="cuisine-img" alt="North Indian"> <span
					class="cuisine-name">North Indian</span>
			</div>

			<div class="cuisine-item">
				<img
					src="https://tse1.mm.bing.net/th?id=OIP.Y6EPLtE1odzPfNwNHvW8PQHaE8&pid=Api&P=0&h=180"
					class="cuisine-img" alt="Chaat"> <span class="cuisine-name">Pani
					Puri</span>
			</div>
		</div>
	</div>
	<center>
		<h1>Restaurants near you</h1>
	</center>


	<div class="restaurant-container">
		<!-- Restaurant 1 -->
		<div class="restaurant-card">
			<img src="AppImages/res1.jpeg" alt="Restaurant 1">
			<div class="content">
				<h3>SLV uphara</h3>
				<h4>Bengali</h4>
				<h4>Tinfactory,Banglore</h4>
				<div class="rating">
					<span class="star">⭐</span><span>4.5</span>
				</div>
			</div>
		</div>
		<!-- Restaurant 2 -->
		<div class="restaurant-card">
			<img src="AppImages/res2.png" alt="Restaurant 2">
			<div class="content">
				<h3>ShakesB</h3>
				<h4>North Indian</h4>
				<h4>Yelhanka,Banglore</h4>

				<div class="rating">
					<span class="star">⭐</span><span>4.2</span>
				</div>
			</div>
		</div>
		<!-- Restaurant 3 -->
		<div class="restaurant-card">
			<img src="AppImages/res3.jpeg" alt="Restaurant 3">
			<div class="content">
				<h3>Pasta Street</h3>
				<h4>Biryani</h4>
				<h4>Medahalli,Banglore</h4>
				<div class="rating">
					<span class="star">⭐</span><span>4.7</span>
				</div>
			</div>
		</div>
		<!-- Restaurant 4 -->
		<div class="restaurant-card">
			<img src="AppImages/res4.jpeg" alt="Restaurant 4">
			<div class="content">
				<h3>Spice Up</h3>
				<h4>Chinese</h4>
				<h4>Udipi,Banglore</h4>
				<div class="rating">
					<span class="star">⭐</span><span>4.3</span>
				</div>
			</div>
		</div>
		<!-- Restaurant 5 -->
		<div class="restaurant-card">
			<img src="AppImages/res5.jpeg" alt="Restaurant 5">
			<div class="content">
				<h3>Hippie World</h3>
				<h4>SouthIndian</h4>
				<h4>Hosur,Banglore</h4>
				<div class="rating">
					<span class="star">⭐</span><span>4.6</span>
				</div>
			</div>
		</div>
		<!-- Restaurant 6 -->
		<div class="restaurant-card">
			<img src="AppImages/res8.jpeg" alt="Restaurant 6">
			<div class="content">
				<h3>Rameshwaram Cafe</h3>
				<h4>FastFood</h4>
				<h4>Hoskote,Banglore</h4>
				<div class="rating">
					<span class="star">⭐</span><span>4.8</span>
				</div>
			</div>
		</div>
		<!-- Restaurant 7 -->
		<div class="restaurant-card">
			<img src="AppImages/res7.jpeg" alt="Restaurant 5">
			<div class="content">
				<h3>Pasta Perfection</h3>
				<h4>SouthIndian</h4>
				<h4>BTM,Banglore</h4>
				<div class="rating">
					<span class="star">⭐</span><span>4.5</span>
				</div>
			</div>
		</div>
		<!-- Restaurant 8 -->
		<div class="restaurant-card">
			<img src="AppImages/res6.jpeg" alt="Restaurant 6">
			<div class="content">
				<h3>HavenDine</h3>
				<h4>Desserts</h4>
				<h4>JP Nagar,Banglore</h4>
				<div class="rating">
					<span class="star">⭐</span><span>4.6</span>
				</div>
			</div>
		</div>
	</div>
	</div>




	<script>
        const quotes = [
            {
                text: "Delicious food, delivered to your door",
                description: "Experience the finest selection of local and international cuisines, delivered fresh to your doorstep. Our carefully curated restaurants ensure quality, taste, and timely delivery for the perfect dining experience."
            },
            {
                text: "Discover the best restaurants in your area",
                description: "Explore a world of flavors right in your neighborhood. From hidden gems to popular favorites, find the perfect restaurant that matches your cravings and dietary preferences."
            },
            {
                text: "From our kitchen to your table",
                description: "Enjoy restaurant-quality meals in the comfort of your home. Our partner restaurants maintain the highest standards of food preparation and packaging for an exceptional dining experience."
            },
            {
                text: "Satisfy your cravings, anytime",
                description: "Whether it's breakfast, lunch, dinner, or a midnight snack, we've got you covered. Choose from thousands of dishes available 24/7 through our extensive restaurant network."
            }
        ];

        let currentQuote = 0;
        const quoteElement = document.getElementById('changing-quote');
        const descriptionElement = document.getElementById('quote-description');

        function changeQuote() {
            quoteElement.style.opacity = '0';
            descriptionElement.style.opacity = '0';
            
            setTimeout(() => {
                currentQuote = (currentQuote + 1) % quotes.length;
                quoteElement.textContent = quotes[currentQuote].text;
                descriptionElement.textContent = quotes[currentQuote].description;
                quoteElement.style.opacity = '1';
                descriptionElement.style.opacity = '1';
            }, 500);
        }

        setInterval(changeQuote, 4000);
    </script>

	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<!-- Footer -->
	<footer class="footer">
		<div class="footer-container">
			<div class="footer-content">
				<div class="footer-section">
					<h3>COMPANY</h3>
					<ul class="footer-links">
						<li class="footer-link"><a href="#"><i
								class="bi bi-building"></i>About us</a></li>
						<li class="footer-link"><a href="#"><i
								class="bi bi-people"></i>Team</a></li>
						<li class="footer-link"><a href="#"><i
								class="bi bi-briefcase"></i>Careers</a></li>
						<li class="footer-link"><a href="#"><i
								class="bi bi-newspaper"></i>Blog</a></li>
					</ul>
				</div>
				<div class="footer-section">
					<h3>CONTACT</h3>
					<ul class="footer-links">
						<li class="footer-link"><a href="#"><i
								class="bi bi-headset"></i>Help & Support</a></li>
						<li class="footer-link"><a href="#"><i class="bi bi-shop"></i>Partner
								with us</a></li>
						<li class="footer-link"><a href="#"><i
								class="bi bi-bicycle"></i>Ride with us</a></li>
					</ul>
				</div>
				<div class="footer-section">
					<h3>LEGAL</h3>
					<ul class="footer-links">
						<li class="footer-link"><a href="#"><i
								class="bi bi-file-text"></i>Terms & Conditions</a></li>
						<li class="footer-link"><a href="#"><i
								class="bi bi-shield-check"></i>Privacy Policy</a></li>
						<li class="footer-link"><a href="#"><i
								class="bi bi-cookie"></i>Cookie Policy</a></li>
					</ul>
				</div>
				<div class="footer-section">
					<h3>DOWNLOAD APP</h3>
					<div class="app-downloads">
						<img
							src="https://tse4.mm.bing.net/th?id=OIP.BuHq1dANhV9gWr3FOarBJQHaHa&pid=Api&P=0&h=180"
							alt="Get it on Play Store"> <img
							src="https://tse1.mm.bing.net/th?id=OIP.todzFiCdppVXoPnT0HgwdAHaEK&pid=Api&P=0&h=180"
							alt="Download on App Store">
					</div>
				</div>
			</div>
			<div class="footer-bottom">&copy; 2025 TapBites. All rights
				reserved.</div>
		</div>
	</footer>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>