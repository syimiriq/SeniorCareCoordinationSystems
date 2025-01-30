<%-- 
    Document   : register
    Created on : Dec 11, 2024, 12:03:36 PM
    Author     : Syamir
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #555;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input {
            width: 97%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<form action="login.jsp" method="get">
        <button type="submit" class="button">Back to Login</button>
    </form>
    <% String errorMessage = (String) request.getAttribute("errorMessage");
       if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>
    <div class="container">
    <div class="header">
    <h1>Caretaker Registration </h1>
    </div>
    <form action="RegistrationServlet" method="post">
        <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" name="name" required>
        </div>
        <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" name="email" required>
        </div>
        <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="phone" name="phone" required>
        </div>
        <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" name="username" required>
        </div>
        <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" name="password" required>
        </div>
        <div class="form-group">
        <label for="role">Role:</label>
        <input type="text" name="role" required>
        </div>
        <button type="submit" class="button">Register</button>
    </form>
    
    </div>
    
</body>
</html>
