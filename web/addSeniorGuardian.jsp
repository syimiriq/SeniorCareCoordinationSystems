<%-- 
    Document   : addSenior
    Created on : Jan 10, 2025, 1:13:11 AM
    Author     : user
--%>

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


        <!-- Form to Create or Update Senior & Guardian Info -->
        <form action="addSeniorGuardianServlet" method="post">
            <input type="hidden" name="action" value="create"> <!-- "create" for new entries -->

            <!-- Senior Details -->
            <section>
                <h3>Senior Details</h3>
                <div>
                    <label for="seniorName">Name</label>
                    <input type="text" id="seniorName" name="seniorName" required>
                </div>
                <div>
                    <label for="seniorAge">Age</label>
                    <input type="number" id="seniorAge" name="seniorAge" required>
                </div>
                <div>
                    <label for="seniorDob">Date of Birth</label>
                    <input type="date" id="seniorDob" name="seniorDob" required>
                </div>
                <div>
                    <label for="seniorGender">Gender</label>
                    <select id="seniorGender" name="seniorGender" required>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
            </section>

            <!-- Guardian Details -->
            <section>
                <h3>Guardian Details</h3>
                <div>
                    <label for="guardianName">Name</label>
                    <input type="text" id="guardianName" name="guardianName" required>
                </div>
                <div>
                    <label for="guardianGender">Gender</label>
                    <select id="guardianGender" name="guardianGender" required>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div>
                    <label for="guardianContact">Contact</label>
                    <input type="text" id="guardianContact" name="guardianContact" required>
                </div>
                <div>
                <label for="relationship">Relationship</label>
                <select id="relationship" name="relationship" required>
                    <option value="parent">Parent</option>
                    <option value="child">Child</option>
                    <option value="spouse">Spouse</option>
                    <option value="relative">Relative</option>
                    <option value="friend">Guardian</option>
                </select>
                </div>
                <div>
                    <label for="guardianDob">Date of Birth</label>
                    <input type="date" id="guardianDob" name="guardianDob" required>
                </div>
                <div>
                    <label for="guardianAddress">Address</label>
                    <textarea id="guardianAddress" name="guardianAddress" rows="3" required></textarea>
                </div>
            </section>

            <button type="submit">Submit</button>
        </form>

        <!-- Table to Display Existing Records -->
        <table>
            <thead>
                <tr>
                    <th>Senior Name</th>
                    <th>Senior Age</th>
                    <th>Senior Birth date</th>
                    <th>Senior Gender</th>
                    <th>Guardian Name</th>
                    <th>Guardian Gender</th>
                    <th>Guardian Contact</th>
                    <th>Guardian Relationship</th>
                    <th>Guardian Birth date</th>
                    <th>Guardian Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- Example hardcoded rows, replace with dynamic rows from a database --%>
                <tr>
                    <td>John Doe</td>
                    <td>80</td>
                    <td>1943-01-15</td>
                    <td>Male</td>
                    <td>Jane Doe</td>
                    <td>Female</td>
                    <td>123-456-7890</td>
                    <td>nothhin</td>
                    <td>1970-05-20</td>
                    <td>123 Elm St, Springfield</td>
                    <td class="actions">
                        <form action="SeniorGuardianServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" value="1"> <!-- Example ID -->
                            <button type="submit">Edit</button>
                        </form>
                        <form action="SeniorGuardianServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="1"> <!-- Example ID -->
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <%-- End hardcoded rows --%>
            </tbody>
        </table>
    </div>
</body>
</html>


