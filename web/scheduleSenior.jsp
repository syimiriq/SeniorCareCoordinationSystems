<%@page import="com.scc.model.Seniors"%>
<%@page import="com.scc.model.Caretakers"%>
<%@page import="java.util.List"%>
<%@page import="com.scc.model.Schedules"%>
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
    // Fetch the list of seniors
    List<Schedules> scheduleList = Schedules.getAllSchedules(seniorid);
    Seniors senior = Seniors.getSeniorById(seniorid);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Schedule</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            margin: 10px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            border: none;
        }
        .button:hover {
            background-color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        td a {
            color: #333;
            font-weight: bold;
            text-decoration: none;
            margin-right: 10px;
        }
        td a:hover {
            color: #555;
        }
    </style>
    </head>
    <body>
        <button type="button" class="button" onclick="location.href='schedule.jsp'">Back</button>
        
        <div class="container">
        <div class="header">
        <h1>Manage Schedules for:</h1>
        </div>
            <a href="addSchedule.jsp?id=<%= senior.getID()%>" class="button">Add New Schedule</a>
        <p><strong>SENIOR ID:</strong> <%= senior.getID() %> </p>
        <p><strong>NAME:</strong> <%= senior.getName() %></p>
        <p><strong>GENDER:</strong> <%= senior.getGender() %></p>
        <p><strong>DATE OF BIRTH:</strong> <%= senior.getDateOfBirth()%></p>

        <table>
            <thead>
                <tr>
                    <th>Activity Name</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Created At</th>
                    <th>Status</th>
                    <th>Person In Charge</th>
                    <th>ACTION</th>
                </tr>
            </thead>
            <tbody>
                <% for (Schedules schedule : scheduleList) { %>
                <tr>
                    <td><%= schedule.activityName(schedule.getActivityid()) %></td>
                    <td><%= schedule.getStart_time() %></td>
                    <td><%= schedule.getEnd_time() %></td>
                    <td><%= schedule.getDate() %></td>
                    <td>
                        <%= schedule.getStatus() == false ? "<span style='color: red;'>In Progress</span>" : "<span style='color: green;'>Done</span>" %>
                    </td>

                    <td><%= schedule.caretakerName(schedule.getCaretakerid())%></td>
                    <td>
                        <% if(schedule.getStatus() == false) { %>
                           <form action="editScheduleServlet" method="POST">
                                <input type="hidden" name="actID" value="<%= schedule.getActivityid() %>">
                                <input type="hidden" name="senID" value="<%= senior.getID() %>">
                                <input type="hidden" name="starttime" value="<%= schedule.getStart_time() %>">
                                <input class="button" type="submit" value="Completed">
                            </form>
                            
                        <% } %>
                        <form action="DeleteScheduleServlet" method="POST">
                            <input type="hidden" name="actID" value="<%=schedule.getActivityid()%>">
                            <input type="hidden" name="senID" value="<%=senior.getID()%>">
                            <input type="hidden" name="starttime" value="<%=schedule.getStart_time()%>">
                            <input class="button" type="submit" value="DELETE">
                        </form>
                    </td>
                
                </tr>
               <% } %>
            </tbody>
        </table>
        </div>
    </body>
</html>
