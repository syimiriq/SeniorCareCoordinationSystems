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
        
        <button  class="edit-btn" type="button" onclick="location.href='activities.jsp'">Back</button>
         <div class="container">
             <div class="header">
             <h1>Add New Activities</h1>
             </div>
        <form action ="addActivityServlet" method ="post">
            <div class="info-item">
            <label >Activity Name :</label>
            <input type="text" name="name" required><br>
            </div>
            <div class="info-item">
            <label >Type :</label>
            <input type="text" name="type"required><br>
            </div>
            <div class="info-item">
            <label >Description :</label>
            <input type="text"  name="description"required><br>
            </div>
            <div class="info-item">
            <label  >Location :</label>
            <input type="text" name="location" required><br>
            </div>
            <button class="edit-btn" type="submit">Add</button>
        </form>
        
         </div>
    </body>
</html>
