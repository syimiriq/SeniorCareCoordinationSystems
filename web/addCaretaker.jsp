<%-- 
    Document   : addCaretaker
    Created on : Jan 7, 2025, 10:05:43 PM
    Author     : Ichiro
--%>


<%@page import="com.scc.model.Caretakers"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Caretaker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            font-size: 1.8em;
            color: #333;
        }
        .info-item {
            margin-bottom: 10px;
        }
        .info-item label {
            font-weight: bold;
            display: inline-block;
            width: 120px;
            color: #333;
        }
        .edit-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 1em;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .edit-btn:hover {
            background-color: #45a049;
        }
        </style>
</head>
<body>
    <form>
        <button class="edit-btn" type="button" onclick="window.location.href='caretakers.jsp';">Back</button>
    </form>
    <div class="container">
    <div class="header">
    <h1>Add New Caretaker</h1>
    </div>
    <form action="AddCaretakerServlet" method="post">
        <div class="info-item">
        <label for="name">Name:</label>
        <input type="text" name="name" required><br>
        </div>
        <div class="info-item">
        <label for="email">Email:</label>
        <input type="email" name="email" required><br>
        </div>
        <div class="info-item">
        <label for="phone">Phone:</label>
        <input type="text" name="phone" required><br>
        </div>
        <div class="info-item">
        <label for="role">Role:</label>
        <input type="text" name="role" required><br>
        </div>
        <div class="info-item">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br>
        </div>
        <div class="info-item">
        <label for="password">Password:</label>
        <input type="password" name="password" required><br>
        </div>
        <button class="edit-btn" type="submit">Add</button>
        <button class="edit-btn" type="reset">Reset</button>
    </form>
    </div>
</body>
</html>
