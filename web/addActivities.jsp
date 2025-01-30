<%-- 
    Document   : addActivities
    Created on : Jan 12, 2025, 1:31:53 AM
    Author     : NITRO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
 
        <title>Create New Activities</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 350px;
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
            width: 96%;
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
        <div class="container">
        <button  class="button" type="button" onclick="location.href='activities.jsp'">Back</button>
         
             <div class="header">
             <h1>Add New Activities</h1>
             </div>
        <form action ="addActivityServlet" method ="post">
            <div class="form-group">
            <label >Activity Name :</label>
            <input type="text" name="name" required><br>
            </div>
            <div class="form-group">
            <label >Type :</label>
            <input type="text" name="type"required><br>
            </div>
            <div class="form-group">
            <label >Description :</label>
            <input type="text"  name="description"required><br>
            </div>
            <div class="form-group">
            <label  >Location :</label>
            <input type="text" name="location" required><br>
            </div>
            <button class="button" type="submit">Add</button>
        </form>
        
         </div>
    </body>
</html>
