<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*, mypack.dbconnect" %>
<%  
String name = ""; 
if (session == null)
{
    // Not created yet. Now do so yourself.
    response.sendRedirect("index.jsp");
}
else
{
  name =(String)session.getAttribute("userId");
} 
  
%>
<!doctype html>
<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<title>Movie Ticket</title>
	</head>
	<body>
		
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">MSA</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="#browseMovie">Browse Movies</a>
						</li>
					</ul>
					<form class="d-flex">
						<h4 style="
						padding-top: 10px;
						margin-top: 10px;
						padding-right: 10px;
						color : white;
						">Hii <%= name %></h4>
					</form>
					<a href="index.jsp" class="btn btn-outline-success ml-2" style="margin-top: 13px">Logout</a>
				</div>
			</div>
		</nav>
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" style="height: 800px;">
					<img src="https://wallpapercave.com/wp/wp8807385.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" style="height: 800px;">
					<img src="https://swall.teahub.io/photos/small/339-3395380_annabelle-and-the-nun.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" style="height: 800px;">
					<img src="https://wallpapercave.com/wp/wp7845494.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
			</button>
		</div>
		<div class="container my-3" id="browseMovie">
			<h2 class="text-center my-3">Browse Movie</h2>
			<div class="row">
						<%
						try
						{
						Connection con = dbconnect.initializeDatabase();
						Statement stmt = con.createStatement();
						String sql = "SELECT * FROM browsemovie";
						ResultSet rs = stmt.executeQuery(sql);
						// Close all the connections
						while(rs.next())
						{
						out.println("<div class='col-md-4 my-2'>");
						out.println("<div class='card' style='width: 18rem; height: 20rem;'>");
						out.println("<img src = "+ rs.getString("imgLink") +" class='card-img-top' alt='...' style = 'height : 13rem;'>");
						out.println("<div class='card-body'>");
						out.println("<h5 class='card-title'><a href='movieBook.html?catid="+rs.getInt("sno")+"'>"+rs.getString("movieName")+"</a></h5>");	
						out.println("<a href='bookMovie.html' class='btn btn-primary'>Book Ticket</a>");	
						out.println("</div>");
						out.println("</div>");
						out.println("</div>");
						}
						}
						catch (SQLException se)
						{
						out.println(se.getMessage());
						}
						// HttpSession session = request.getSession();
      //               	session.putValue("userId",eid);
      //               	response.sendRedirect(request.getContextPath()+"/movie.jsp");
						%>
			</div>
		</div>
		<!-- Optional JavaScript; choose one of the two! -->
		<!-- Option 1: Bootstrap Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<!-- Option 2: Separate Popper and Bootstrap JS -->
		<!--
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
		-->
	</body>
</html>