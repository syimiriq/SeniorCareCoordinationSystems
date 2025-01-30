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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Senior</title>
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
        .form-group input, .form-group select {
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
            <button class="button" type="button" onclick="window.location.href='senior.jsp';">Back</button>
            <h1>Edit Senior</h1>
        </div>
        <form action="EditSeniorServlet" method="post">
            <input type="hidden" name="id" value="<%= senior.getID() %>">

            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" value="<%= senior.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select name="gender" id="gender" required>
                    <option value="">--Select--</option>
                    <option value="male" <%= senior.getGender().equalsIgnoreCase("male") ? "selected" : "" %>>Male</option>
                    <option value="female" <%= senior.getGender().equalsIgnoreCase("female") ? "selected" : "" %>>Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="dateofbirth">Date of Birth:</label>
                <input type="date" name="dateofbirth" id="dateofbirth" value="<%= senior.getDateOfBirth() %>" required>
            </div>
            <div class="form-group">
                <label for="guardian">Assign Guardian:</label>
                <select name="guardianID" id="guardian">
                    <option value=""><%= assignedGuardianName %></option>             
                    <% for (Guardians guardian : guardiansList) { %>
                        <option value="<%= guardian.getGuardianID() %>" 
                            <%= (senior.getGuardianID() == guardian.getGuardianID()) ? "selected" : "" %>>
                            <%= guardian.getName() %>
                        </option>
                    <% } %>
                </select>
            </div>
            <button class="button" type="submit">Save Changes</button>
        </form>
    </div>
</body>
</html>
