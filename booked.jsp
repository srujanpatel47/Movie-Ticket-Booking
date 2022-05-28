<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, java.io.*, javax.naming.*, mypack.dbconnect" %>
<%
Integer id = 0; 
Integer seat = 0;
int seatNumber = 0;
if (session == null)
{
    // Not created yet. Now do so yourself.
    response.sendRedirect("bookMovie.html");
}
else
{
  id = (Integer)session.getAttribute("movieId");
  seat = (Integer)session.getAttribute("seatNum");
} 
try
{
	Connection con = dbconnect.initializeDatabase();
	Statement stmt = con.createStatement();
	String sql = "SELECT seatNum FROM bookmovie WHERE sno = '"+id+"'";
	ResultSet rs = stmt.executeQuery(sql);
	// Close all the connections
	while(rs.next())
	{
		seatNumber = rs.getInt("seatNum");
	}

	Statement stmt2 = con.createStatement();
	String sql2 = "UPDATE bookmovie SET seatNum = seatNum - "+seatNumber+" WHERE BookID='"+id+"'";
	ResultSet rs1 = stmt.executeQuery(sql2);
	out.println("Booked");

	con.close();
}

	catch (SQLException se)
	{
		out.println(se.getMessage());
	}

%>

