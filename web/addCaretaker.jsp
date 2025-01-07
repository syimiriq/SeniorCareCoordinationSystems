<%-- 
    Document   : addCaretaker
    Created on : Jan 7, 2025, 10:05:43 PM
    Author     : user
--%>

<form action="AddCaretakerServlet" method="POST">
    <label>Name:</label>
    <input type="text" name="caretakerName" required>
    <label>Email:</label>
    <input type="email" name="caretakerEmail" required>
    <label>Phone:</label>
    <input type="text" name="caretakerPhone">
    <label>Username:</label>
    <input type="text" name="caretakerUsername" required>
    <label>Password:</label>
    <input type="password" name="caretakerPassword" required>
    <button type="submit">Add Caretaker</button>
</form>
