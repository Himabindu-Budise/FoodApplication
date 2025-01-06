<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #f0f7ff 0%, #e6ffe6 100%);
            padding: 1rem;
        }

        .container {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        .check-circle {
            width: 100px;
            height: 100px;
            background: #ecfdf5;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            transform: scale(0);
            animation: scaleIn 0.5s ease-out forwards;
        }

        .check-circle svg {
            width: 50px;
            height: 50px;
            color: #22c55e;
            opacity: 0;
            animation: fadeInCheck 0.3s ease-out forwards 0.5s;
        }

        h1 {
            color: #1f2937;
            font-size: 1.75rem;
            margin-bottom: 1rem;
            opacity: 0;
            transform: translateY(20px);
            animation: slideUp 0.5s ease-out forwards 0.7s;
        }

        .message {
            opacity: 0;
            transform: translateY(20px);
            animation: slideUp 0.5s ease-out forwards 0.9s;
        }

        p {
            color: #4b5563;
            margin-bottom: 0.75rem;
            line-height: 1.5;
        }

        .home-button {
            display: inline-block;
            background: #22c55e;
            color: white;
            text-decoration: none;
            padding: 0.875rem 2rem;
            border-radius: 0.5rem;
            font-weight: 500;
            margin-top: 1.5rem;
            transition: all 0.2s;
            opacity: 0;
            transform: translateY(20px);
            animation: slideUp 0.5s ease-out forwards 1.1s;
        }

        .home-button:hover {
            background: #16a34a;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 197, 94, 0.25);
        }

        @keyframes scaleIn {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }

        @keyframes fadeInCheck {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="check-circle">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M20 6L9 17l-5-5" />
            </svg>
        </div>

        <h1>Order Confirmed!</h1>

        <div class="message">
            <p>Thank you for your order! Your delicious food is being prepared.</p>
            <p style="font-size: 0.875rem; color: #6b7280;">
                Estimated delivery time: 30-45 minutes
            </p>
            <a href="home.jsp" class="home-button">Return to Home</a>
        </div>
    </div>
</body>
</html>