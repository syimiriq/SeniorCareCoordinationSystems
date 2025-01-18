/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import com.scc.model.Activities;
/**
 *
 * @author NITRO
 */
public class editActivityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        /*HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("Admin")== null) {
            response.sendRedirect("login.jsp");
            return;
        }*/
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            
            Activities activity = Activities.getActivityById(id);
            if (activity == null) {
                response.getWriter().println("Error: Activity not found.");
                return;
            }
            
            activity.setname(name);
            activity.settype(type);
            activity.setdescription(description);
            activity.setlocation(location);
           
            boolean success = activity.update();
            if (!success) {
                response.getWriter().println("Error: Failed to update activity.");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
            return;
        }

        response.sendRedirect("activity.jsp");
    }
}
