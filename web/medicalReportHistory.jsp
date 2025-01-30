<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.scc.model.Medicals"%>
<%@page import="com.scc.model.Seniors"%>
<%@page import="com.scc.model.Caretakers"%>
<%@page import="java.util.List"%>

            <%
               
            if(session == null || session.getAttribute("Caretaker")==null) {
                response.sendRedirect("login.jsp");
                return;
            }
            Caretakers caretaker = (Caretakers)session.getAttribute("Caretaker");

            String seniorIdParam = request.getParameter("id");
                if (seniorIdParam == null || !seniorIdParam.matches("\\d+")) {
                    out.println("<p style='color:red;'>Invalid Senior ID.</p>");
                    return;
                }

            int seniorID = Integer.parseInt(seniorIdParam);
            Seniors senior = Seniors.getSeniorById(seniorID);
            List<Medicals> medicalList = Medicals.getAllMedicalHistory(seniorID);
            LocalDate today = LocalDate.now();

 
  
%>

<!DOCTYPE html>
<html>
<head>
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


<button class="button" type="button" onclick="window.location.href='medicalReport.jsp';">Back</button>
<div class="container">
<div class="header">
<h1>Medical Report History:-</h1>
</div>
<p>SENIOR ID: <%= senior.getID() %> </p>
<p>NAME: <%= senior.getName() %></p>
<p>GENDER: <%= senior.getGender() %></p>
<p>DATE OF BIRTH: <%= senior.getDateOfBirth()%></p>
<table>
    <tr>
        <th>ID</th>
        <th>REPORT<br> TAKEN ON</th>
        <th>HEIGHT</th>
        <th>WEIGHT</th>
        <th>BMI Index</th>
        <th>HEART RATE</th>
        <th>BLOOD<br> PRESSURE</th>
        <th>BODY <br>TEMPERATURE</th>
        <th>TAKEN BY</th>
        <th>ACTION</th>
    </tr>
  
     <%
       for (Medicals medical : medicalList) {
    %>
    <tr>
        <td><%= medical.getID() %></td>
        <td><%= medical.getDateTime()%></td>
        <td><%= medical.getHeight() %></td>
        <td><%= medical.getWeight() %></td>
        <td><%= String.format("%.1f", medical.getBmiIndex()) %></td>
        <td><%= medical.getHeartRate()%>
        <% if(medical.getHeartRate()<60 || medical.getHeartRate()>100){ %>
        (WARNING)
        <% } %>
        </td>
        <td><%= medical.getBloodPressure()%>
        <% if(medical.getBloodPressure()>130){ %>
        (WARNING)
        <% } %>
        </td>
        <td><%= medical.getBodyTemperature()%>
        <% if(medical.getBodyTemperature()<32 || medical.getBodyTemperature()>36 ){ %>
        (WARNING)
        <% } %>
        </td>
        <td><%= medical.caretakerName(medical.getCaretakerID())%></td>
       <td> 
           <%  LocalDate medicalDate = medical.getDateTime().toLocalDate();
               if(medicalDate.equals(today)){  %>
                <form action="DeleteMedicalReportServlet" method="POST">
                    <input type="hidden" name="id" value="<%=medical.getID()%>">
                    <input type="submit" value="DELETE">
                </form>
                   
         <%  }else { %>
           N/A           
          <%   } %>
           
       </td>
       
    </tr>
    <%
        }
    %>
</table>
</div>
</body>
</html>
