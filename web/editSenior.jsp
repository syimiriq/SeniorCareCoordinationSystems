<%-- 
    Document   : editSenior
    Created on : Jan 18, 2025, 10:40:46 PM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="com.scc.model.Guardians"%>
<%@page import="com.scc.model.Seniors"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    if (session == null || session.getAttribute("Caretaker") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String seniorIdParam = request.getParameter("id");
    if (seniorIdParam == null || !seniorIdParam.matches("\\d+")) {
        out.println("<p style='color:red;'>Invalid senior ID.</p>");
        return;
    }

    int seniorId = Integer.parseInt(seniorIdParam);

    Seniors senior = Seniors.getSeniorById(seniorId);
    if (senior == null) {
        out.println("<p style='color:red;'>No senior found for the provided ID.</p>");
        return;
    }

    List<Guardians> guardiansList = Guardians.getAllGuardians();
    
    String assignedGuardianName = "None"; // Default if no guardian assigned
    int assignedGuardianID = senior.getGuardianID(); // Get the assigned guardian ID

    for (Guardians guardian : guardiansList) {
        if (guardian.getGuardianID() == assignedGuardianID) {
            assignedGuardianName = guardian.getName(); // Set guardian name if found
            break;
        }
    }

%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Senior</title>
</head>
<body>
    <form>
        <button type="button" onclick="window.location.href='senior.jsp';">Back</button>
    </form>

    <h1>Edit Senior</h1>
    <form action="EditSeniorServlet" method="post">
        <input type="hidden" name="id" value="<%= senior.getID() %>">

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="<%= senior.getName() %>" required><br>

        <label for="gender">Gender:</label>
        <select name="gender" id="gender" required>
            <option value="">--Select--</option>
            <option value="male" <%= senior.getGender().equalsIgnoreCase("male") ? "selected" : "" %>>Male</option>
            <option value="female" <%= senior.getGender().equalsIgnoreCase("female") ? "selected" : "" %>>Female</option>
        </select><br>

        <label for="dateofbirth">Date of Birth:</label>
        <input type="date" name="dateofbirth" id="dateofbirth" value="<%= senior.getDateOfBirth() %>" required><br>

        <label for="guardian">Assign Guardian:</label>
        <select name="guardianID" id="guardian">
            <option value=""><%= assignedGuardianName %></option>             
            <% for (Guardians guardian : guardiansList) { %>
                <option value="<%= guardian.getGuardianID() %>" 
                    <%= (senior.getGuardianID() == guardian.getGuardianID()) ? "selected" : "" %>>
                    <%= guardian.getName() %>
                </option>
            <% } %>
        </select><br>
        <button type="submit">Save Changes</button>
    </form>
</body>
</html>

