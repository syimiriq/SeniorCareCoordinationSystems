/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class AddCaretakerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Caretaker caretaker = new Caretaker();
        caretaker.setCaretakerName(request.getParameter("caretakerName"));
        caretaker.setCaretakerEmail(request.getParameter("caretakerEmail"));
        // Set other fields...

        CaretakerDAO dao = new CaretakerDAO();
        dao.addCaretaker(caretaker);

        response.sendRedirect("listCaretakers.jsp");
    }
}



