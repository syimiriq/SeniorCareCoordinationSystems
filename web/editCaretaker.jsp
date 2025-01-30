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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Caretaker</title>
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
            <button class="button" type="button" onclick="window.location.href='caretakers.jsp';">Back</button>
            <h1>Edit Caretaker</h1>
        </div>
        <form action="EditCaretakerServlet" method="post">
            <input type="hidden" name="id" value="<%= caretaker.getID() %>">

            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" name="name" value="<%= caretaker.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" value="<%= caretaker.getEmail() %>" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" value="<%= caretaker.getUsername() %>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" name="phone" value="<%= caretaker.getPhone() %>" required>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <input type="text" name="role" value="<%= caretaker.getRole() %>" required>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select name="status">
                    <option value="true" <%= caretaker.getStatus() ? "selected" : "" %>>Active</option>
                    <option value="false" <%= !caretaker.getStatus() ? "selected" : "" %>>Inactive</option>
                </select>
            </div>
            <div class="form-group">
                <label for="password">New Password:</label>
                <input type="password" name="password" placeholder="Enter new password">
            </div>
            <button class="button" type="submit">Save Changes</button>
        </form>
    </div>
</body>
</html>
