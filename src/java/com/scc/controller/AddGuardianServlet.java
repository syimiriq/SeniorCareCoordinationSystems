package com.scc.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

public class AddGuardianServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Verify session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Caretaker") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve form parameters
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String dateofbirth = request.getParameter("dateofbirth");
        String address = request.getParameter("address");

        // Validate required fields
        if (name == null || name.isEmpty() || gender == null || gender.isEmpty() || phone == null || phone.isEmpty()) {
            response.getWriter().println("Name, Gender, and Contact are required fields!");
            return;
        }

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc")) {
            String query = "INSERT INTO GUARDIANS (NAME, GENDER, PHONE, DATEOFBIRTH, ADDRESS) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);

            stmt.setString(1, name);
            stmt.setString(2, gender);
            stmt.setString(3, phone);
            stmt.setDate(4, Date.valueOf(dateofbirth));
            stmt.setString(5, address != null && !address.isEmpty() ? address : null);
            stmt.executeUpdate();

            response.sendRedirect("guardian.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while adding the guardian information.");
        }
    }
}
