<%@page import="com.scc.model.Seniors"%>
<%@page import="com.scc.model.Caretakers"%>
<%@page import="java.util.List"%>
<%@page import="com.scc.model.Schedules"%>
<%
    if (session == null || session.getAttribute("Caretaker") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
      Caretakers caretaker = (Caretakers)session.getAttribute("Caretaker");

    // Fetch the list of seniors
    List<Seniors> seniorList = Seniors.getAllSeniors();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Schedule</title>
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
            .schedule-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: space-around; /* Adjust for better distribution */
                margin-top: 20px;
            }
            .schedule-card {
                width: 100%;
                max-width: 300px; /* Ensure a reasonable max width */
                border: 1px solid #ddd;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                transition: transform 0.3s ease;
                box-sizing: border-box; /* Prevents overflow from padding */
            }
            .schedule-card:hover {
                transform: translateY(-10px);
            }
            .schedule-card h3 {
                margin: 0;
                font-size: 18px;
                color: #333;
            }
            .schedule-card p {
                margin: 8px 0;
                color: #555;
            }
            .schedule-card .status {
                font-weight: bold;
                color: green;
            }
            .schedule-card .status.inactive {
                color: red;
            }
            .schedule-card a {
                text-decoration: none;
                color: #007BFF;
                margin-top: 10px;
                display: inline-block;
            }
            /* Media Query for smaller devices */
            @media (max-width: 768px) {
                .schedule-container {
                    justify-content: center;
                }
                .schedule-card {
                    max-width: 95%; /* Make cards fit better on smaller screens */
                }
            }
            /* Media Query for very small devices (mobile phones) */
            @media (max-width: 480px) {
                .button {
                    padding: 8px 16px;
                    font-size: 14px;
                }
                .schedule-card {
                    max-width: 100%;
                    padding: 10px;
                }
                
            }
        </style>
    </head>
    <body>
        <button type="button" class="button" onclick="location.href='home.jsp'">Back</button>
        <div class="container">
        <h1>Senior's Schedules</h1>
        
        <div class="schedule-container">
            <% 
                for (Seniors senior : seniorList){
            %>
                <div class="schedule-card">
                    <h3>Senior ID: <%= senior.getID() %></h3>
                    <p><strong>Name:</strong> <%= senior.getName() %></p>
                    <p><strong>Gender:</strong> <%= senior.getGender() %></p>
                    <p><strong>Date Of Birth:</strong> <%= senior.getDateOfBirth() %></p>
                    <a href="scheduleSenior.jsp?id=<%= senior.getID() %>">View More</a>
                </div>
            <% 
                }
            %>
        </div>
        </div>
    </body>
</html>
