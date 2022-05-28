import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
// Import Database Connection Class file
import mypack.dbconnect;
  
// Servlet Name
public class deleteMovie extends HttpServlet {
  
    protected void doPost(HttpServletRequest request, 
HttpServletResponse response)
        throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        String name = request.getParameter("movieName");
        try {
  
            // Initialize the database
            Connection con = dbconnect.initializeDatabase();

            Statement stmt = con.createStatement();
  
            String sql = "DELETE FROM browsemovie WHERE movieName = '"+name+"'";
            stmt.executeUpdate(sql); 
  
            // Close all the connections
            stmt.close();
            con.close();
  
            // Get a writer pointer 
            // to display the successful result
            // out.println("<html><body><b>Successfully Inserted"
            //             + "</b></body></html>");
            response.sendRedirect(request.getContextPath()+"/movie.jsp");
        }
        catch (Exception e) {
            out.println("Error Occured "+e);
            e.printStackTrace();
        }
    }
}