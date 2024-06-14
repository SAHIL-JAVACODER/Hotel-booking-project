<%String username=(String)session.getAttribute("username");
if(username==null)
{
%>
	<p align="right"><h7><b><a href="register.jsp">LogIn/Register</a></b></h7></p>	
<% 	
}
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
		<title>Blog</title>
		<style>
		table 
		{
			 border-collapse: collapse;
			 width: 99%;
			 
		}
		th, td 
		{
			 padding: 6px;
			 border: 0px solid #ddd;
			 border-top-color:;
			 border-top-width:;
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
		    padding: 8px;
		    text-align: center;
		    text-decoration:none;
		    display: inline-block;
		    font-size: 13px;
		    margin: 4px 2px;
		    cursor: pointer;
		}
		.button5 
		{
			border-radius: 50%;
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
			<script src="js/respond.min.js"></script>
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
		    String query="SELECT name,emailid,message from ohbblog";
		    PreparedStatement ps=conn.prepareStatement(query);
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
					<a href="index.jsp" class="logo pull-left"><img src="themes/images/logo1.jpg" class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="index.jsp">Home</a></li>						
							<li><a href="hotels.jsp">Hotels</a></li>			
							<li><a href="./products.jsp">Resorts</a></li>
							<li><a href="blog.jsp">Blog</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="aboutus.jsp">About Us</a></li>
						</ul>
					</nav>
				</div>
			</section>							
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.jpg" alt="New products" >
				<h4><span>Blog Entries</span></h4>
			</section>
			<section class="main-content">
			  				
				<strong><h5>Our Blog Comprises of new services and facilities provided by our hotels.You can write about all your travelling experiences over here whether good or bad and let other people gain knowledge from it. Though the review section for each individual hotel is also present you can still write your experience over here regarding your booking of hotels and whether this website helped you in getting your desired hotel. We will keep updating you of the special events and discounts and the best reviews by users. Do follow our general travel tips for a great journey. Have a good day!</h5></strong>	
		  		<br>	
		  		<h3 style="color:#D94600;">COMMENTS</h3>
		  		    <table bgcolor="#CCCCCC">
	     				<%
	   						while(rs.next()==true)
	   						{
						%>
						<tr>
							<td><h5 style="color:#D94600;"><%=rs.getString("name")%> (<%=rs.getString("emailid")%>) says : </h5>
							
							<h5><%=rs.getString("message")%></h5><hr></td>
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
			
			<br><br>
			<h3 style="color:#D94600;">LEAVE A REPLY</h3>
			<table bgcolor="#CCCCCC">
	 				<form action="blogdb.jsp" method="post">
		  			<tr>
		  				<td>Full Name : </td>
		  			</tr>
		  			<tr>
		  				<td><input type="text" name="name" required></td>
		  			</tr>
		  			<tr>
		  				<td>Email address : </td>
		  			</tr>
		  			<tr>
		  				<td><input type="email" name="email" required></td>
		  			</tr>
		  			<tr>
		  				<td>Your Message : </td>
		  			</tr>
		  			<tr>
		  				<td><textarea name="message" rows="5" cols="60"></textarea></td>
		  			</tr>
		  			<tr>
		  				<td>
		  					
		  					<input type="submit" class="button button5" name="submit" value="Submit" >
		  					</form>
		  				
		  					<form action="" method="post">
		  					<input type="reset" class="button button5" name="cancel" value="Cancel" >
		  					</form>
		  				</td>
	     			</tr>	
          		</table>
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
    </body>
</html>