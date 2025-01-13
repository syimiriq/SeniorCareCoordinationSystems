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
    </head>
    <body>
         <h1>Create New Activities</h1>
        <form action ="addActivityServlet" method ="post">
            <label for="name">Activity Name :</label>
            <input type="text" required><br>
            <label for="name">Type :</label>
            <input type="text" required><br>
            <label for="name">Description :</label>
            <input type="text" required><br>
            <label for="name">Location :</label>
            <input type="text" required><br>
            <button type="submit">Add</button>
        </form>
    </body>
</html>
