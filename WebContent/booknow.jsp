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
		<title>Book Rooms</title>
		<style>
				table 
				{
					 border-collapse: collapse;
					 width: 95%;
					 
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
					 background-color:#FFF;
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
		<link href="themes/css/main.css" rel="stylesheet"/>
		<link href="themes/css/jquery.fancybox.css" rel="stylesheet"/>
				
		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<script src="themes/js/jquery.fancybox.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>		
    <%
		Connection conn;
		ResultSet rs;
		 String t1="",t2="",t3="";
		try
		{ 	
			String driver="oracle.jdbc.driver.OracleDriver";
		    Class.forName(driver);
		    String url="jdbc:oracle:thin:@localhost:1521:ORCL";
		    String userid="scott";
		    String password="tiger";
		    conn=DriverManager.getConnection(url,userid,password);
		    int hid=Integer.parseInt(request.getParameter("hidid"));
		    String query="SELECT id,place,name,typeofroom1,typeofroom2,typeofroom3,posingleroom,podoubleroom,podeluxeroom,image FROM ohbhotels WHERE id='"+hid+"'";
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
					<a href="index.html" class="logo pull-left"><img src="themes/images/logo1.jpg" class="site_logo" alt=""></a>
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
				<h4><span>Book Room(s)</span></h4>
			</section>
			
			<section class="main-content">				
						<table style="background-color:#EBEBEB;" align="center">
								<%
								   if(rs.next()==true)
								   {
								%>
							<tr>
								<th><h5>Hotel </h5></th>
								<th style="width:200px"><h5>Rooms Available </h5></th>
								<th style="width:200px"><h5>Price of Rooms </h5></th>
								<th style="width:200px"><h5>Click to book room(s) </h5></th>
							</tr>
							<tr>
							<td align="center">
								<h4><%=rs.getString("name")%> in <%=rs.getString("place")%></h4>
							  	<%
							  		String pathImage=rs.getString("image");
							  		pathImage=pathImage.substring(pathImage.lastIndexOf("\\")+1);
							  		//out.print(pathImage);
							  	%>
		  						<img src=<%=pathImage%> width="350" height="300">
		  					</td>
	     					<td align="center">
	     						<%
	     						  
	     						   t1=rs.getString("typeofroom1");
	     						   t2=rs.getString("typeofroom2");
	     						   t3=rs.getString("typeofroom3");
	     						   /*if(t1.equals("null"))
	     						   {
	     							  t1="Single room is not available" ;
	     						   }
	     						  if(t2.equals("null"))
	     						   {
	     							  t2="Double room is not available" ;
	     						   }
	     						 if(t3.equals("null"))
	     						   {
	     							  t3="Delux room is not available" ;
	     						   }*/
	     						%>
	     						 
	     						<%= t1 %><br><br><br>
	     						<%= t2 %><br><br><br>
	     						<%= t3 %>
	     					</td>
	     					<td align="center">
								
								Rs. <%=rs.getDouble("posingleroom")%> for 1 night<br><br><br><br>
								Rs. <%=rs.getDouble("podoubleroom")%> for 1 night<br><br><br><br>
								Rs. <%=rs.getDouble("podeluxeroom")%> for 1 night
							</td>
	     					
          					<td align="center">
          						<br>
          						<form action="booksingleroom.jsp" method="post" name="">
          						<input type="hidden" name="hidid" value=<%=rs.getInt("id")%>>
          						<input type="submit" class="button button5" name="booksinglerm" value="Book Single Room(s)" ><br><br>
          						</form>	
          						
          						<form action="bookdoubleroom.jsp" method="post" name="">
          						<input type="hidden" name="hidid" value=<%=rs.getInt("id")%>>
          						<input type="submit" class="button button5" name="bookdoublerm" value="Book Double Room(s)" ><br><br>
          						</form>	
          						
          						<form action="bookdeluxeroom.jsp" method="post" name="">
          						<input type="hidden" name="hidid" value=<%=rs.getInt("id")%>>
          						<input type="submit" class="button button5" name="bookdeluxerm" value="Book Deluxe Room(s)" ><br>
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
							<h5 style="color:#F00" align="center">Hurry Up ! Book before prices go up !</h5>
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
			$(function () {
				$('#myTab a:first').tab('show');
				$('#myTab a').click(function (e) {
					e.preventDefault();
					$(this).tab('show');
				})
			})
			$(document).ready(function() {
				$('.thumbnail').fancybox({
					openEffect  : 'none',
					closeEffect : 'none'
				});
				
				$('#myCarousel-2').carousel({
                    interval: 2500
                });								
			});
		</script>
    </body>
</html>