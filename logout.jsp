<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<% 
	session.removeAttribute("userId");
	session.invalidate();
	response.sendRedirect("login.jsp");

%>