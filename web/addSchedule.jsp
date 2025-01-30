<%@page import="java.util.List"%>
<%@page import="com.scc.model.Activities"%>
<%@page import="com.scc.model.Caretakers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session == null || session.getAttribute("Caretaker") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Caretakers caretaker = (Caretakers)session.getAttribute("Caretaker");
    String seniorIdParam = request.getParameter("id");
    if (seniorIdParam == null) {
        out.println("<p style='color:red;'>Invalid senior ID.</p>");
        return;
    }
    int seniorid = Integer.parseInt(seniorIdParam);
    
    List<Activities> activityList = Activities.getAllActivities();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Schedule</title>
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
    <body onload="setTimestamp()">
        <button class="edit-btn" type="button" onclick="location.href='scheduleSenior.jsp?id=<%=seniorid%>'">Back</button>
        
        <div class="container">
        <div class="header">
        <h1>Create New Schedule</h1>
        </div>
        <form action="addScheduleServlet" method="post">
            <input type="hidden" name="seniorID" value="<%=seniorid%>" required><br>

            <div class="info-item">
                <label>Activity ID:</label>
                <select name='activityID'>
                    <% for (Activities activity : activityList) { %>
                    <option value='<%=activity.getId()%>'><%=activity.getName()%></option>
                    <% } %>
                </select>
            </div>

            <div class="info-item">
                <label for="start">Start Time:</label>
                <input type="time" name="start" required><br>
            </div>

            <div class="info-item">
                <label for="end">End Time:</label>
                <input type="time" name="end" required><br>
            </div>

            <input type="hidden" name="caretakerID" value="<%= caretaker.getID() %>" required><br>

            <button class="edit-btn" type="submit">Add</button>
        </form>
        </div>
    </body>
</html>
