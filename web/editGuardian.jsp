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
        return;
    }

    int guardianId = Integer.parseInt(guardianIdParam);
    Guardians guardian = Guardians.getGuardianById(guardianId);
    if (guardian == null) {
        out.println("<p style='color:red;'>No guardian found for the provided ID.</p>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Guardian</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            border: none;
            display: inline-block;
            text-align: center;
            cursor: pointer;
        }
        .button:hover {
            background-color: #555;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <button class="button" type="button" onclick="window.location.href='guardian.jsp';">Back</button>
            <h1>Edit Guardian</h1>
        </div>
        <form action="EditGuardianServlet" method="post">
            <input type="hidden" name="ID" value="<%= guardian.getGuardianID() %>">

            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" value="<%= guardian.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select name="gender" id="gender" required>
                    <option value="">--Select--</option>
                    <option value="male" <%= guardian.getGender().equalsIgnoreCase("male") ? "selected" : "" %>>Male</option>
                    <option value="female" <%= guardian.getGender().equalsIgnoreCase("female") ? "selected" : "" %>>Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="phone">Contact:</label>
                <input type="text" name="phone" id="phone" value="<%= guardian.getPhone() %>" required>
            </div>
            <div class="form-group">
                <label for="dateOfBirth">Date of Birth:</label>
                <input type="date" name="dateOfBirth" id="dateOfBirth" value="<%= guardian.getDateOfBirth() %>" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea name="address" id="address" rows="2" required><%= guardian.getAddress() %></textarea>
            </div>
            <button class="button" type="submit">Save Changes</button>
        </form>
    </div>
</body>
</html>