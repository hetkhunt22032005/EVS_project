package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        PrintWriter out = resp.getWriter();
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/EVS", "postgres", "admin");

            PreparedStatement ps = con.prepareStatement("select * from users where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	HttpSession session = req.getSession();
            	session.setAttribute("userID", rs.getString("id"));
             	session.setAttribute("f_name", rs.getString("f_name"));
            	session.setAttribute("m_name", rs.getString("m_name"));
            	session.setAttribute("l_name", rs.getString("l_name"));
            	session.setAttribute("ph_no", rs.getString("ph_no"));
            	session.setAttribute("birthdate", rs.getString("birthdate"));
            	session.setAttribute("email", rs.getString("email"));
            	session.setAttribute("address", rs.getString("address"));
            	session.setAttribute("score",rs.getString("score"));
                RequestDispatcher rd=req.getRequestDispatcher("/profile.jsp");
                rd.include(req, resp);
            } else {
                resp.setContentType("text/html");
                out.println("<div style='color:red;'>Invalid username or password...!!</div>");

                RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
                rd.include(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();

            resp.setContentType("text/html");
            out.print(e.getLocalizedMessage());

            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
            rd.include(req, resp);
        }

    }
}
