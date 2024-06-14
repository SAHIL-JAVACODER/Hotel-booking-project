<%
	String username=(String)session.getAttribute("username");
	String email=(String)session.getAttribute("email");
	if(email==null)
	{
		response.sendRedirect("register.jsp");
	}
	//String name=(String)session.getAttribute("hotelname");
	else
	{
%>
	<p align="right"><h7><b>Hi <%=username %>|<a href="logout.jsp">LogOut</a></b></h7></p>
<%
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Cart</title>
	<style>
		table 
		{
			 border-collapse: collapse;
			 width: 100%;
			 
		}
		th, td 
		{
			 padding: 6px;
			 border: 2px solid #ddd;
			 border-top-color:#D94600;
			 border-top-width:medium;
		}
		tr:hover 
		{
			 background-color:#EFEFEF;
		}
		hr 
		{
    		border: 2px solid #f1f1f1;
    		margin-bottom: 25px;
		}
		.button 
		{
			background-color:#D94600;
			border: none;
			color: white;
			padding: 5px;
			text-align: center;
			text-decoration:none;
			display: inline-block;
			font-size: 14px;
			margin: 4px 2px;
			cursor: pointer;
		}
		.button5 
		{
			border-radius: 4px;
		}
	</style>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">		
		<link href="themes/css/bootstrappage.css" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="themes/css/flexslider.css" rel="stylesheet"/>
		<link href="themes/css/main.css" rel="stylesheet"/>

		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="themes/js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>
    <%
		Connection conn;
		ResultSet rs;
		try
		{ 	
			String driver="oracle.jdbc.driver.OracleDriver";
		    Class.forName(driver);
		    String url="jdbc:oracle:thin:@localhost:1521:ORCL";
		    String userid="scott";
		    String password="tiger";
		    conn=DriverManager.getConnection(url,userid,password);
		    String query="SELECT imageofhotel,nameofhotel,placeofhotel,typeofroom,priceofroom,nosroom,noguest,nameofguest,checkin,checkout,nonight,totalamountpay,username,emailid,idofhotel,roombookid from ohbroombook where emailid=?";
		    PreparedStatement ps=conn.prepareStatement(query);
		    ps.setString(1,email);
		    rs=ps.executeQuery();
		    
	%>		
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="Search Your Hotel">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="cart1.jsp">Your Cart</a></li>
										
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index.html" class="logo pull-left"><img src="themes/images/logo1.jpg" class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="index.jsp">Home</a></li>					
							<li><a href="hotels.jsp">Hotel</a></li>			
							<li><a href="./products.html">Resorts</a></li>
							<li><a href="blog.jsp">Blog</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="aboutus.jsp">About Us</a></li>
						</ul>
					</nav>
				</div>
			</section>				
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.jpg" alt="New products" >
				<h4><span>Booked Hotels</span></h4>
			</section>
			<section class="main-content">				
				
									
						<h4 class="title" align="center"><span class="text"><strong>Your</strong> Cart</span></h4>
						
							<table style="background-color:#EBEBEB;" align="center">
								<tr>
									<th align="center">Image</th>
									<th>Name</th>
									<th>Room Type</th>
									<th>Price/Night<br>(in Rs)</th>
									<th>No.of Room(s)</th>
									<th>No.of Guest(s)</th>
									<th>Guest Names</th>
									<th>Check-In Date</th>
									<th>Check-Out Date</th>
									<th>No.of Night(s)</th>
									<th>Total</th>
									<th>Booked By</th>
									<th></th>
								</tr>
							
							<%
							   while(rs.next()==true)
							   {
							%>
							
								<tr>
									<td width="130px"><%
		  									String pathImage=rs.getString("imageofhotel");
		  									pathImage=pathImage.substring(pathImage.lastIndexOf("\\")+1);
		  									//out.print(pathImage);
		  								%>
		  								<img src=<%=pathImage%> width="1000" height="1000">
		  							</td>
									<td width="120px"><%=rs.getString("nameofhotel")%> in <%=rs.getString("placeofhotel")%></td>
									<td width="60px" align="center"><%=rs.getString("typeofroom")%></td>
									<td width="10px" align="center"><%=rs.getDouble("priceofroom")%></td>
									<td width="50px" align="center"><%=rs.getInt("nosroom")%></td>
									<td width="40px" align="center"><%=rs.getInt("noguest")%></td>
									<td width="80px" align="center"><%=rs.getString("nameofguest")%></td>
									<td width="120px"><%=rs.getString("checkin")%></td>
									<td width="120px"><%=rs.getString("checkout")%></td>
									<td width="40px" align="center"><%=rs.getInt("nonight")%></td>
									<td width="40px" align="center"><%=rs.getDouble("totalamountpay")%></td>
									<td width="40px" align="center"><%=rs.getString("username")%><br><%=rs.getString("emailid")%></td>
									<td width="40px" align="center">
										<form action="paymentpage.jsp" method="post" name="">
											<input type="hidden" name="roombookid" value=<%=rs.getInt("roombookid")%>>
											<input type="submit" class="button button5" name="pay" value="Pay"><br><br>
										</form>
										<form action="delbookdhotel.jsp" method="post" name="">
											<input type="hidden" name="roombookid" value=<%=rs.getInt("roombookid")%>>
											<input type="submit" class="button button5" name="remove" value="Remove"><br>
										</form>
									</td>
								</tr>
								<%
									}
									conn.close();
									}
									catch(Exception e)
									{
										out.print(e);
									}
								%>
						</table>
					  <hr>
					
				
				<br><br><br>
			</section>			
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="index.jsp">Home</a></li>  
							<li><a href="aboutus.jsp">About Us</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="cart1.jsp">Your Cart</a></li>
							<li><a href="register.jsp">LogIn/Register</a></li>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="#">My Account</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Wish List</a></li>
							<li><a href="#">Newsletter</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src="themes/images/logo1.jpg" class="site_logo" alt=""></p>
						<p></p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="themes/js/common.js"></script>
		<script>
			$(document).ready(function() {
				$('#checkout').click(function (e) {
					document.location.href = "checkout.jsp";
				})
			});
		</script>		
    </body>
</html>