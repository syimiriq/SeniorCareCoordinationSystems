<%-- 
    Document   : addCaretaker
    Created on : Jan 7, 2025, 10:05:43 PM
    Author     : Ichiro
--%>


<%@page import="com.scc.model.Caretakers"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Caretaker</title>
</head>
<body>
    <form>
        <button type="button" onclick="window.location.href='caretakers.jsp';">Back</button>
    </form>

    <h1>Add New Caretaker</h1>
    <form action="AddCaretakerServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" required><br>

        <label for="role">Role:</label>
        <input type="text" name="role" required><br>

        <label for="username">Username:</label>
        <input type="text" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br>

        <button type="submit">Add</button>
        <button type="reset">Reset</button>
    </form>
</body>
</html>
