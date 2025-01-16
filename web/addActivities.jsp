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
            <label >Activity Name :</label>
            <input type="text" name="name" required><br>
            <label >Type :</label>
            <input type="text" name="type"required><br>
            <label >Description :</label>
            <input type="text"  name="description"required><br>
            <label  >Location :</label>
            <input type="text" name="location" required><br>
            <button type="submit">Add</button>
        </form>
    </body>
</html>
