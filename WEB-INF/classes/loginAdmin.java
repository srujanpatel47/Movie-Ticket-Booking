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

public class loginAdmin extends HttpServlet {
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        String eid = request.getParameter("eid");
        String pass = request.getParameter("pass");
        if (eid.equals("admin") && pass.equals("admin"))
        {
            response.sendRedirect(request.getContextPath()+"/admin.jsp");
        }
        else
        {
            out.print("Please Enter a valid Credential......!!");
        }

    }
}