package com.scc.controller;

import org.mindrot.jbcrypt.BCrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class addGuardianServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("guardianName");
        String gender = request.getParameter("guardianGender");
        String phone = request.getParameter("guardianContact");
        String dob = request.getParameter("guardianDob");
        String address = request.getParameter("guardianAddress");

        try (PrintWriter out = response.getWriter()) {
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
            String sql = "INSERT INTO GUARDIANS (NAME, PHONE, GENDER, DATEOFBIRTH, ADDRESS) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, gender);
            stmt.setDate(4, java.sql.Date.valueOf(dob));
            stmt.setString(5, address);

            stmt.executeUpdate();
            conn.close();

            response.sendRedirect("addSeniorGuardian.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
