<%-- 
    Document   : editCaretaker
    Created on : Jan 15, 2025, 10:41:34 PM
    Author     : Ichiro
--%>

<%@page import="com.scc.model.Caretakers"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    if (session == null || session.getAttribute("Admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String caretakerIdParam = request.getParameter("id");
    if (caretakerIdParam == null || !caretakerIdParam.matches("\\d+")) {
        out.println("<p style='color:red;'>Invalid caretaker ID.</p>");
        return;
    }

    int caretakerId = Integer.parseInt(caretakerIdParam);
    Caretakers caretaker = Caretakers.getCaretakerById(caretakerId);

    if (caretaker == null) {
        out.println("<p style='color:red;'>No caretaker found for the provided ID.</p>");
        return;
    }
%>


<html>
<head>
    <title>Edit Caretaker</title>
</head>
<body>
    <form>
        <button type="button" onclick="window.location.href='caretakers.jsp';">Back</button>
    </form>

    <h1>Edit Caretaker</h1>
    <form action="EditCaretakerServlet" method="post">
        <input type="hidden" name="id" value="<%= caretaker.getID() %>">

        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= caretaker.getName() %>" required><br>

        <label for="email">Email:</label>
        <input type="email" name="email" value="<%= caretaker.getEmail() %>" required><br>

        <label for="username">Username:</label>
        <input type="text" name="username" value="<%= caretaker.getUsername() %>" required><br>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" value="<%= caretaker.getPhone() %>" required><br>

        <label for="role">Role:</label>
        <input type="text" name="role" value="<%= caretaker.getRole() %>" required><br>

        <label for="status">Status:</label>
        <select name="status">
            <option value="true" <%= caretaker.getStatus() ? "selected" : "" %>>Active</option>
            <option value="false" <%= !caretaker.getStatus() ? "selected" : "" %>>Inactive</option>
        </select><br>

        <label for="password">New Password:</label>
        <input type="password" name="password" placeholder="Enter new password"><br>

        <button type="submit">Save Changes</button>
    </form>
</body>
</html>

