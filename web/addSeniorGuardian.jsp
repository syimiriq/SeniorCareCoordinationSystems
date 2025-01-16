<%-- 
    Document   : addSenior
    Created on : Jan 10, 2025, 1:13:11 AM
    Author     : user
--%>


<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Admins"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Senior & Guardian Information</title>
    <style>
/*        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }*/
        h2 {
            text-align: center;
            color: #2c3e50;
        }
/*        form {
            margin-bottom: 20px;
        }
        form section {
            margin-bottom: 30px;
        }
        form div {
            margin: 10px 0;
        }
        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        form input, form select, form textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }*/
/*        button {
            background-color: #5dade2;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }*/
        button:hover {
            background-color: #2874a6;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table th {
            background-color: #f4f6f9;
        }
        .actions button {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Senior & Guardian Information</h2>
        
<form>
  <button type="button" onclick="window.history.go(-1);">Back</button>
</form>
        
        <form action="addSeniorGuardianServlet" method="post">
            <!-- Senior Details -->
            <section>
                <h3>Senior Details</h3>
                <div>
                    <label for="seniorName">Name</label>
                    <input type="text" id="seniorName" name="seniorName" required>
                </div>
                <div>
                    <label for="seniorGender">Gender</label>
                    <select id="seniorGender" name="seniorGender" required>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div>
                    <label for="seniorDob">Date of Birth</label>
                    <input type="date" id="seniorDob" name="seniorDob" required>
                </div>
            </section>

            <!-- Guardian Details (Optional) -->
            <section>
                <h3>Guardian Details (Optional)</h3>
                <div>
                    <label for="guardianName">Name</label>
                    <input type="text" id="guardianName" name="guardianName">
                </div>
                <div>
                    <label for="guardianGender">Gender</label>
                    <select id="guardianGender" name="guardianGender">
                        <option value="">Select</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div>
                    <label for="guardianContact">Contact</label>
                    <input type="text" id="guardianContact" name="guardianContact">
                </div>
                <div>
                    <label for="relationship">Relationship</label>
                    <select id="relationship" name="relationship">
                        <option value="">Select</option>
                        <option value="parent">Parent</option>
                        <option value="child">Child</option>
                        <option value="spouse">Spouse</option>
                        <option value="relative">Relative</option>
                        <option value="friend">Guardian</option>
                    </select>
                </div>
                <div>
                    <label for="guardianDob">Date of Birth</label>
                    <input type="date" id="guardianDob" name="guardianDob">
                </div>
                <div>
                    <label for="guardianAddress">Address</label>
                    <textarea id="guardianAddress" name="guardianAddress" rows="3"></textarea>
                </div>
            </section>
            <br>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
        
        <!-- Table to Display Existing Records -->
        <table border="1">
        <tr>
            <th>Name</th>
            <th>Gender</th>
            <th>Date of Birth</th>
            <th>Guardian Name</th>
            <th>Guardian Phone</th>
            <th>Guardian Address</th>
        </tr>
        
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc");
                String query = "SELECT * FROM SENIORS";//ubah ni nnti
                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();
                
                while (rs.next()) {    
        %>
        
        <tr> 
            <td><%= rs.getString("senior_name") %></td>
            <td><%= rs.getString("senior_gender") %></td>
            <td><%= rs.getDate("senior_dob") %></td>
            <td><%= rs.getString("guardian_name") %></td>
            <td><%= rs.getString("guardian_phone") %></td>
            <td><%= rs.getString("guardian_address") %></td>
            <td>
                <a href="editSeniorGuardian.jsp?id=<%= rs.getInt("ID") %>">Edit</a>
                <a href="DeleteSeniorGuardianServlet?id=<%= rs.getInt("ID") %>" onclick="return confirm('Are you sure you want to delete this caretaker?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                out.println("Error retrieving caretaker records: " + e.getMessage());
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
    
    </div>
</body>
</html>


