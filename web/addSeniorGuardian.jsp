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
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            font-size: 1.8em;
            color: #333;
        }
        .info-section {
            margin-bottom: 20px;
        }
        .info-section h3{
            font-size: 1.4em;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
        }
        .info-item {
            margin-bottom: 10px;
        }
        .info-item label {
            font-weight: bold;
            display: inline-block;
            width: 120px;
            color: #333;
        }
        .edit-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 1em;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .edit-btn:hover {
            background-color: #45a049;
        }
        table {
               width: 100%;
               border-collapse: collapse;
           }
           table, th, td {
               border: 1px solid black;
           }
           th, td {
               padding: 8px;
               text-align: center;
           }
        </style>
</head>
<body>
    <form>
  <button class="edit-btn" type="button" onclick="window.history.go(-1);">Back</button>
</form>
    <div class="container">
        <div class="header">
        <h1>Senior & Guardian Information</h1>
        </div>

        
        <form action="addSeniorGuardianServlet" method="post">
            <!-- Senior Details -->
                <div class="info-section">
                <h3>Senior Details</h3>
                <br>
                <div class="info-item">
                    <label for="seniorName">Name</label>
                    <input type="text" id="seniorName" name="seniorName" required>
                </div>
                <div class="info-item">
                    <label for="seniorGender">Gender</label>
                    <select id="seniorGender" name="seniorGender" required>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div class="info-item">
                    <label for="seniorDob">Date of Birth</label>
                    <input type="date" id="seniorDob" name="seniorDob" required>
                </div>
                <br>
                </div>

            <!-- Guardian Details (Optional) -->
                <div class="info-section">
                <h3>Guardian Details (Optional)</h3>
                <br>
                <div class="info-item">
                    <label for="guardianName">Name</label>
                    <input type="text" id="guardianName" name="guardianName">
                </div>
                <div class="info-item">
                    <label for="guardianGender">Gender</label>
                    <select id="guardianGender" name="guardianGender">
                        <option value="">Select</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div class="info-item">
                    <label for="guardianContact">Contact</label>
                    <input type="text" id="guardianContact" name="guardianContact">
                </div>
                <div class="info-item">
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
                <div class="info-item">
                    <label for="guardianDob">Date of Birth</label>
                    <input type="date" id="guardianDob" name="guardianDob">
                </div>
                <div class="info-item">
                    <label for="guardianAddress">Address</label>
                    <textarea id="guardianAddress" name="guardianAddress" rows="3"></textarea>
                </div>
                </div>
            
            <br>
            <button class="edit-btn" type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
<br>
        
        <!-- Table to Display Existing Records -->
        <table >
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


