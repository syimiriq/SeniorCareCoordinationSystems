<%-- 
    Document   : editSchedule
    Created on : Jan 21, 2025, 6:39:32 AM
    Author     : NITRO
--%>

<%@page import="com.scc.model.Schedules"%>
<%@page import="com.scc.model.Activities"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    if (session == null || session.getAttribute("Admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String activityIdParam = request.getParameter("id");
    if (activityIdParam == null) {
        out.println("<p style='color:red;'>Invalid activity ID.</p>");
        return;
    }

    
    int activityid = Integer.parseInt(activityIdParam);
    Schedules schedule = Schedules.getScheduleById(activityid);
    

    if (schedule == null) {
        out.println(schedule);
        out.println("<p style='color:red;'>No schedule found for the provided ID.</p>");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Edit Schedule</title>
    </head>
    <body>
        <button type="button" onclick="location.href='schedule.jsp'">Back</button>
       <h1>Edit Schedule</h1>
    <form action="editScheduleServlet" method="post">
        <input type="hidden" name="id" value="<%= activity.getid() %>">
        <input type="hidden" name="id" value="<%= schedule.getSeniorid() %>">

        <label for="name">Start:</label>
        <input type="text" name="name" value="<%= schedule.getStart_time() %>" required><br>

        <label for="email">End:</label>
        <input type="email" name="email" value="<%= schedule.getEnd_time() %>" required><br>

        <label for="username">Date:</label>
        <input type="date" name="username" value="<%= schedule.getDate() %>" required><br>

        <label for="phone">Status:</label>
        <select name="status">
            <option value="true" <%= schedule.getStatus() ? "selected" : "" %>>Active</option>
            <option value="false" <%= !schedule.getStatus() ? "selected" : "" %>>Inactive</option>
        </select><br>

        <button type="submit">Save Changes</button>
    </form>
    </body>
</html>
