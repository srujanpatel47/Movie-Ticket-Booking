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

public class bookMovie extends HttpServlet {
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	PrintWriter out = response.getWriter();

    	try
		{
			String name = request.getParameter("movieName");
        	String seatNum = request.getParameter("seatNum");
			Connection con = dbconnect.initializeDatabase();
			Statement stmt = con.createStatement();
			String sql = "SELECT sno FROM browsemovie WHERE movieName = '"+name+"'";
			ResultSet rs = stmt.executeQuery(sql);
			int mid = 0;
			// Close all the connections
			while(rs.next())
			{
				mid = rs.getInt("sno");
			}
	        HttpSession session = request.getSession();
	        session.putValue("movieId",mid);
	        session.putValue("seatNum",seatNum);
	        response.sendRedirect(request.getContextPath()+"/booked.jsp");
		}
		catch (Exception e) {
            out.println("Error Occured "+e);
            e.printStackTrace();
        }
}
}