<%-- 
    Document   : schedule
    Created on : Jan 12, 2025, 1:58:57 AM
    Author     : NITRO
--%>

<%@page import="java.util.List"%>
<%@page import="com.scc.model.Schedules"%>
<%
    /*if (session == null || session.getAttribute("Admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }*/

    // Fetch the list of schedules
    List<Schedules> schedulesList = Schedules.getAllSchedules();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Schedule</title>
        <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
    </head>
    <body>
        <button type="button" onclick="location.href='adminhome.jsp'">Back</button>
        <h1>Manage Schedules</h1>
        <button type="button" onclick="location.href='addSchedules.jsp'">Add New Schedules</button>
        <button type="button" onclick="location.href='searchSchedules.jsp'">Search Schedules</button>
        <br>
        <tr>
            <th>Activities ID</th>
            <th>Senior ID</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Date</th>
            <th>Status</th>
            <th>Caretaker ID</th>
        </tr>
        <% 
            for (Schedules schedule : schedulesList){

        %>
        <tr>
        <td><%= schedule.getActivityid() %></td>
        <td><%= schedule.getSeniorid() %></td>
        <td><%= schedule.getStart_time() %></td>
        <td><%= schedule.getEnd_time() %></td>
        <td><%= schedule.getDate() %></td>
        <td><%= schedule.getStatus()? "Active" : "Inactive" %></td>
        <td><%= schedule.getCaretakerid() %></td>
        <td>
                <a href="editSchedules.jsp?id=<%= schedule.getActivityid() %>">Edit</a>
                <a href="deleteActivityServlet?id=<%= schedule.getActivityid() %>" onclick="return confirm('Are you sure you want to delete this caretaker?');">Delete</a>
            </td>
        </tr>
        <%
              }
        %>
        </table>
    </body>
</html>
