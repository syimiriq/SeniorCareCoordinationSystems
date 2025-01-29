<%-- 
    Document   : addGuardian
    Created on : Jan 17, 2025, 2:30:10 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Guardian</title>
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
        <button class="edit-btn" type="button" onclick="window.history.go(-1);">Back</button>
    </form>
        <div class="container">
        <form action="AddGuardianServlet" method="post">
            <div class="header">
                <h1>Add New Guardian</h1>
            </div>
                <div class="info-item">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name">
                </div>
                <div class="info-item">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender">
                        <option value="">--Select--</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>
                <div class="info-item">
                    <label for="phone">Contact</label>
                    <input type="text" id="phone" name="phone">
                </div>
                <div class="info-item">
                    <label for="dateofbirth">Date of Birth</label>
                    <input type="date" id="dateofbirth" name="dateofbirth">
                </div>
                <div>
                    <label for="address">Address</label>
                    <textarea id="address" name="address" rows="2"></textarea>
                </div>
            
            <br>
            <button class="edit-btn" type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
