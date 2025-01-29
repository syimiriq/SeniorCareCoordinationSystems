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
        <button type="button" onclick="location.href='schedule.jsp'">Back</button>
        <h1>Create New Schedule</h1>
        <form action ="addScheduleServlet" method ="post" >
            
            <label >Senior ID:</label>
            <input type="text" required><br>
            <label >Activity ID:</label>
            <input type="text" required><br>
            <label for="start">Start Time:</label>
            <input type="text" required><br>
            <label for="end">End Time:</label>
            <input type="text" required><br>
            <label for="date">Date:</label>
            <input type="text" required><br>
            <label for="status">Status :</label>
            <input type="text" required><br>
            <label >Caretaker ID:</label>
            <input type="text" required><br>
            <button type="submit">Add</button>
            
        </form>
    </body>
</html>
