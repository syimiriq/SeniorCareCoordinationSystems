<%@page import="com.scc.model.Caretakers"%>
<%@page import="java.util.List"%>

<%
    if (session == null || session.getAttribute("Admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch the list of caretakers
    List<Caretakers> caretakersList = Caretakers.getAllCaretakers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Caretakers</title>
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
 <form>
            <button type="button" class="button" onclick="window.location.href='adminhome.jsp';">Back</button>
        </form>
<div class="container">
    <div class="header">
       
        <h1>Manage Caretakers</h1>
        <a href="addCaretaker.jsp" class="button">Add New Caretaker</a>
        <a href="searchCaretaker.jsp" class="button">Search Caretaker</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
            for (Caretakers caretaker : caretakersList) {
        %>
        <tr>
            <td><%= caretaker.getID() %></td>
            <td><%= caretaker.getName() %></td>
            <td><%= caretaker.getEmail() %></td>
            <td><%= caretaker.getPhone() %></td>
            <td><%= caretaker.getRole() %></td>
            <td><%= caretaker.getStatus() ? "Active" : "Inactive" %></td>
            <td>
                <a href="editCaretaker.jsp?id=<%= caretaker.getID() %>">Edit</a>
                <a href="DeleteCaretakerServlet?id=<%= caretaker.getID() %>" onclick="return confirm('Are you sure you want to delete this caretaker?');">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>

</body>
</html>