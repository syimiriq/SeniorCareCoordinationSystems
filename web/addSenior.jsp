<%-- 
    Document   : addSenior
    Created on : Jan 17, 2025, 1:24:02 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Senior</title>
    </head>
<body>
    <form>
        <button type="button" onclick="window.history.go(-1);">Back</button>
    </form>
    <div class="container">
        <h2>Add New Senior</h2>
        <form action="AddSeniorServlet" method="post">
            <section>
                <div>
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div>
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender">
                        <option value="">--Select--</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>
                <div>
                    <label for="dateofbirth">Date of Birth</label>
                    <input type="date" id="dateofbirth" name="dateofbirth" required>
                </div>
                    <button type="submit">Submit</button>
            </section>
    </div>
</body>
</html>