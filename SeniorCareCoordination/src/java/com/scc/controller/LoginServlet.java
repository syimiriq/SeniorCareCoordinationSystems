/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;

/**
 *
 * @author User
 */
import com.scc.model.Caretaker;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Example logic
        Caretaker caretaker = new Caretaker();
        caretaker.setUsername(username);
        caretaker.setPassword(password);

        // For now, simply forward to a success page
        request.setAttribute("caretaker", caretaker);
        RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
        dispatcher.forward(request, response);
    }
}
