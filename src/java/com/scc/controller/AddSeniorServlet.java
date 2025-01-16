package com.scc.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class AddSeniorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Caretaker") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dateofbirth = request.getParameter("dateofbirth");

        if (name == null || gender == null || dateofbirth == null) {
            response.getWriter().println("All fields are required!");
            return;
        }

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc")) {
            String query = "INSERT INTO SENIORS (NAME, GENDER, DATEOFBIRTH) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, gender);
            stmt.setDate(3, Date.valueOf(dateofbirth)); // Convert string to SQL date
            stmt.executeUpdate();

            response.sendRedirect("senior.jsp"); 
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while adding the senior information.");
        }
    }
}
