/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "AddMedicalReportServlet", urlPatterns = {"/AddMedicalReportServlet"})
public class AddMedicalReportServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double height = Double.parseDouble(request.getParameter("height"));
        double weight = Double.parseDouble(request.getParameter("weight")); 
        double bmi = weight/(height/100);
        double hr = Double.parseDouble(request.getParameter("hr"));
        double bt = Double.parseDouble(request.getParameter("bt"));
        double bp = Double.parseDouble(request.getParameter("bp"));
        int seniorID = Integer.parseInt(request.getParameter("seniorID"));
        int caretakerID = Integer.parseInt(request.getParameter("caretakerID"));
        
        // Database connection and insertion
        try (PrintWriter out = response.getWriter()) {
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc");//maybe here
                String query = "INSERT INTO medicals (height,weight,bmi,heart_rate,blood_pressure,body_temperature,seniorID,caretakerID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setDouble(1,height);
                stmt.setDouble(2,weight);
                stmt.setDouble(3, bmi);
                stmt.setDouble(4, hr);
                stmt.setDouble(5, bp);
                stmt.setDouble(6,bt);
                stmt.setInt(7,seniorID);
                stmt.setInt(8,caretakerID);
                stmt.executeUpdate();
                conn.close();
                response.sendRedirect("medicalReport.jsp");
            } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<html><body><h2>Error: " + e.getMessage() + "</h2></body></html>");

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
