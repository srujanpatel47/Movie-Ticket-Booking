import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
  
// Import Database Connection Class file
import mypack.dbconnect;
  
// Servlet Name
public class loginModal extends HttpServlet {
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        String eid = request.getParameter("eid");
        String pass = request.getParameter("pass");
        int id = 0;
        String newEid = "";
        String newPass = "";
        try {
  
            // Initialize the database
            Connection con = dbconnect.initializeDatabase();

            Statement stmt = con.createStatement();
  
            String sql = "SELECT * FROM login WHERE eid = '"+eid+"' AND pass = '"+pass+"'";
            ResultSet rs = stmt.executeQuery(sql);
            // Close all the connections
            while(rs.next())
            {
                id = rs.getInt("sno");
                newEid = rs.getString("eid");
                newPass = rs.getString("pass");
            }
            if (id > 0)
            {
                if (eid.equals(newEid) && pass.equals(newPass))
                {
                    HttpSession session = request.getSession();
                    session.putValue("userId",eid);
                    response.sendRedirect(request.getContextPath()+"/movie.jsp");
                }
                else
                {
                    out.print("Please Enter a valid Credential......!!");
                }

            }
            else
            {
                out.print("You don't have account please create it......!!");
            }
            con.close();
        }
        catch (Exception e) {
            out.println("Error Occured "+e);
            e.printStackTrace();
        }
    }
}