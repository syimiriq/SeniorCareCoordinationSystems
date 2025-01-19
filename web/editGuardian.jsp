<%-- 
    Document   : editGuardian
    Created on : Jan 18, 2025, 2:30:36 AM
    Author     : user
--%>

<%@page import="com.scc.model.Guardians"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    if (session == null || session.getAttribute("Caretaker") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String guardianIdParam = request.getParameter("id");
    if (guardianIdParam == null) {
        out.println("<p style='color:red;'>Invalid guardian ID.</p>");
        
    }

    int guardianId = Integer.parseInt(guardianIdParam);

    Guardians guardian = Guardians.getGuardianById(guardianId);
    if (guardian == null) {
        out.println(guardian);
        out.println("<p style='color:red;'>No guardian found for the provided ID.</p>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Guardian</title>
</head>
<body>
    <form>
        <button type="button" onclick="window.location.href='guardian.jsp';">Back</button>
    </form>

    <h1>Edit Guardian</h1>
    <form action="EditGuardianServlet" method="post">
        <!-- Hidden field to pass guardian ID -->
        <input type="hidden" name="ID" value="<%= guardian.getGuardianID() %>">

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="<%= guardian.getName() %>" required><br>

        <label for="gender">Gender:</label>
        <select name="gender" id="gender" required>
            <option value="">--Select--</option>
            <option value="male" <%= guardian.getGender().equalsIgnoreCase("male") ? "selected" : "" %>>Male</option>
            <option value="female" <%= guardian.getGender().equalsIgnoreCase("female") ? "selected" : "" %>>Female</option>
        </select><br>

        <label for="phone">Contact:</label>
        <input type="text" name="phone" id="phone" value="<%= guardian.getPhone() %>" required><br>

        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" name="dateOfBirth" id="dateOfBirth" value="<%= guardian.getDateOfBirth() %>" required><br>

        <label for="address">Address:</label>
        <textarea name="address" id="address" rows="2" required><%= guardian.getAddress() %></textarea><br>

        <button type="submit">Save Changes</button>
    </form>
</body>
</html>



