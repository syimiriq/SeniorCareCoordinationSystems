<%-- 
    Document   : addSchedule
    Created on : Jan 12, 2025, 1:59:49 AM
    Author     : NITRO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Schedule</title>
    </head>
   <body>
         <h1>Create New Schedule</h1>
        <form action ="addScheduleServlet" method ="post" >
            
            <label >Senior ID:</label>
            <input type="text" required>
            <label >Activity ID:</label>
            <input type="text" required>
            <label for="start">Start Time:</label>
            <input type="text" required>
            <label for="end">End Time:</label>
            <input type="text" required>
            <label for="date">Date:</label>
            <input type="text" required>
            <label for="status">Status :</label>
            <input type="text" required>
            <label >Caretaker ID:</label>
            <input type="text" required>
            <button type="submit">Add</button>
            
        </form>
    </body>
</html>
