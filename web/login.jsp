<%-- 
    Document   : login
    Created on : Dec 9, 2024, 9:05:36 AM
    Author     : Syamir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
        }
        h2 {
            margin-bottom: 15px;
            color: #333;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            text-align: left;
        }
        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .user-type {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        .login-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            margin-top: 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }
        .login-btn:hover {
            background-color: #45a049;
        }
        .message {
            margin-top: 15px;
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="login-container">
    <form action="LoginServlet" method="post">
        <div class="user-type">
        <label for="admin">Administrator</label>
        <input type="radio" id="admin" name="userType" value="admin" required>
        <label for="caretaker">Caretaker</label>
        <input type="radio" id="caretaker" name="userType" value="caretaker" required><br>
        </div><br>
        <label for="username">Username:</label>
        <input type="text" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>
        <button class="login-btn" type="submit">Login</button>
            <div>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;">Invalid username or password!</p>
        <% }
            else if(request.getParameter("invalidate") != null) { %>
            <p style="color:red;">Your account is not validated. If you had just recently registered wait for an administrator to validate your account!</p>
       <%
           }
       %>
    </div>
    </form>
    <form action="register.jsp" method="get">
        <button class="login-btn"type="submit">Register as a caretaker</button>
    </form>
    </div>

    
    
</body>
</html>