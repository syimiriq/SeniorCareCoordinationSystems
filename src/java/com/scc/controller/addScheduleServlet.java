/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NITRO
 */
public class addScheduleServlet extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    int activityid = Integer.parseInt(request.getParameter("activityID"));
    int seniorid = Integer.parseInt(request.getParameter("seniorID"));
    String startStr = request.getParameter("start");
    String endStr = request.getParameter("end");
    int caretakerid = Integer.parseInt(request.getParameter("caretakerID"));
    boolean status = false;

   // Get the current date (LocalDate)
    LocalDate currentDate = LocalDate.now();  // This will give you the current date (e.g., 2025-01-30)

    // Parse the start and end times (HH:mm) into LocalTime
    LocalTime startTime = LocalTime.parse(startStr);  // Converts "HH:mm" to LocalTime
    LocalTime endTime = LocalTime.parse(endStr);      // Converts "HH:mm" to LocalTime

    // Combine LocalDate and LocalTime into LocalDateTime
    LocalDateTime startDateTime = LocalDateTime.of(currentDate, startTime);
    LocalDateTime endDateTime = LocalDateTime.of(currentDate, endTime);

    // Convert LocalDateTime to Timestamp for database storage
    Timestamp start = Timestamp.valueOf(startDateTime);  // Convert LocalDateTime to Timestamp
    Timestamp end = Timestamp.valueOf(endDateTime); 

    try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc")) {
        String query = "INSERT INTO SCHEDULES (ACTIVITYID, SENIORID, START_TIME, END_TIME, STATUS, CARETAKERID) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, activityid);
        stmt.setInt(2, seniorid);
        stmt.setTimestamp(3, start);
        stmt.setTimestamp(4, end);
        stmt.setBoolean(5, status);
        stmt.setInt(6, caretakerid);
        stmt.executeUpdate();

        response.sendRedirect("scheduleSenior.jsp?id=" + seniorid);
    } catch (SQLException e) {
        e.printStackTrace();
        response.getWriter().println("An error occurred while adding schedule information.");
    }   
    }

}