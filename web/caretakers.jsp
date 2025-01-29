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
<html>
<head>
    <title>Manage Caretakers</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>

<form>
    <button type="button" onclick="window.location.href='adminhome.jsp';">Back</button>
</form> 

<h1>Manage Caretakers</h1>

<a href="addCaretaker.jsp">Add New Caretaker</a>
<a href="searchCaretaker.jsp">Search Caretaker</a>
<%= caretakersList %>
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

</body>
</html>
