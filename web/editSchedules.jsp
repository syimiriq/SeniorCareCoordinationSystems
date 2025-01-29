<%-- 
    Document   : editSchedule
    Created on : Jan 21, 2025, 6:39:32 AM
    Author     : NITRO
--%>

<%@page import="com.scc.model.Schedules"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    if (session == null || session.getAttribute("Admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String activityIdParam = request.getParameter("activityid");
    String seniorIdParam = request.getParameter("seniorid");
    String caretakerIdParam = request.getParameter("caretakerid");
    if (activityIdParam == null || seniorIdParam == null || caretakerIdParam == null) {
        out.println("<p style='color:red;'>Invalid activity ID.</p>");
        return;
    }

    
    int activityid = Integer.parseInt(activityIdParam);
    int seniorid = Integer.parseInt(seniorIdParam);
    int caretakerid = Integer.parseInt(caretakerIdParam);
    Schedules schedule = Schedules.getScheduleById(activityid, seniorid, caretakerid);
    

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
        <input type="hidden" name="activityid" value="<%= schedule.getActivityid() %>">
        <input type="hidden" name="seniorid" value="<%= schedule.getSeniorid() %>">

        <label for="start_time">Start:</label>
        <input type="text" name="start_time" value="<%= schedule.getStart_time() %>" required><br>

        <label for="end_time">End:</label>
        <input type="email" name="end_time" value="<%= schedule.getEnd_time() %>" required><br>

        <label for="date">Date:</label>
        <input type="date" name="date" value="<%= schedule.getDate() %>" required><br>

        <label for="phone">Status:</label>
        <select name="status">
            <option value="true" <%= schedule.getStatus() ? "selected" : "" %>>Active</option>
            <option value="false" <%= !schedule.getStatus() ? "selected" : "" %>>Inactive</option>
        </select><br>

        <button type="submit">Save Changes</button>
    </form>
    </body>
</html>
