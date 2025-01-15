import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addSeniorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("seniorName");
        String gender = request.getParameter("seniorGender");
        String dob = request.getParameter("seniorDob");
        int guardianID = Integer.parseInt(request.getParameter("guardianID"));

        try {
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
            String sql = "INSERT INTO SENIORS (name, gender, birth_date, guardianID) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, gender);
            pstmt.setDate(3, java.sql.Date.valueOf(dob));
            pstmt.setInt(4, guardianID);

            pstmt.executeUpdate();
            conn.close();

            response.sendRedirect("addSeniorGuardian.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
