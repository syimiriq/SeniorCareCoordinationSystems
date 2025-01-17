<%-- 
    Document   : addGuardian
    Created on : Jan 17, 2025, 2:30:10 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Guardian</title>
    </head>
    <body>
    <form>
        <button type="button" onclick="window.history.go(-1);">Back</button>
    </form>
        <form action="AddGuardianServlet" method="post">
            <section>
                <h3>Add New Guardian</h3>
                <div>
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name">
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
                    <label for="phone">Contact</label>
                    <input type="text" id="phone" name="phone">
                </div>
                <div>
                    <label for="dateofbirth">Date of Birth</label>
                    <input type="date" id="dateofbirth" name="dateofbirth">
                </div>
                <div>
                    <label for="address">Address</label>
                    <textarea id="address" name="address" rows="2"></textarea>
                </div>
            </section>
            <br>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
