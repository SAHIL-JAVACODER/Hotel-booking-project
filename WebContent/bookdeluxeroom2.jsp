<%
	String username1=(String)session.getAttribute("username");
	String email1=(String)session.getAttribute("email");
%>
	<p align="right"><h7><b>Hi <%=username1 %>|<a href="logout.jsp">LogOut</a></b></h7></p>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Deluxe Room</title>
<style>
	table 
	{
		border-collapse: collapse;
		width: 70%;
	}
	th, td 
	{
		padding: 4px;
		border: 2px solid #ddd;
		border-top-color:#D94600;
		border-left-color:#D94600;
		border-right-color:#D94600;
		border-bottom-color:#D94600;
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
		try
		{ 	
			String driver="oracle.jdbc.driver.OracleDriver";
		    Class.forName(driver);
		    String url="jdbc:oracle:thin:@localhost:1521:ORCL";
		    String userid="scott";
		    String password="tiger";
		    conn=DriverManager.getConnection(url,userid,password);
		    
		    int hid=Integer.parseInt(request.getParameter("hidid"));
		    String query="SELECT id,place,name,typeofroom3,podeluxeroom,image FROM ohbhotels WHERE id='"+hid+"' ";
		    
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
							<li><a href="register.jsp">LogIn/Register</a></li>		
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
				<h4><span>Total Amount Payable</span></h4>
			</section>
			
			<section class="main-content">				
				<table style="background-color:#EBEBEB;" align="center">
				<%
					if(rs.next()==true)
					{
						String name=rs.getString("name");
						//out.print(name);
						session.setAttribute("hotelname",name);
				%>
				
				<form action="bookroomdb.jsp" method="post" name="">
				<tr>
					<td align="center" style="width:120px"><strong>Hotel</strong></td>
					<td align="center" style="width:120px">
						<h5><%=name%> in <%=rs.getString("place")%></h5>
							<%
							  	String pathImage=rs.getString("image");
							  	pathImage=pathImage.substring(pathImage.lastIndexOf("\\")+1);
							  	//out.print(pathImage);
							  %>
		  					<img src=<%=pathImage%> width="250" height="250">
		  			</td>
		  		</tr>
		  		<tr>
		  			<td align="center"><strong>Type of room : </strong></td>
		  			<td align="center">
		  				<strong><%=rs.getString("typeofroom3")%></strong>
	     			</td>
	     		</tr>
	     		<tr>
	     			<td align="center"><strong>Price of Rooms : </strong></td>
	     			<td align="center">
	     				<% //double poroom=rs.getDouble("posingleroom");%>
						<strong>Rs. <%=rs.getDouble("podeluxeroom")%> for 1 night</strong>
					</td>
		  		</tr>
		  		<% 
		  			String username=request.getParameter("us");
					String email=request.getParameter("ea");
		  			int noder=Integer.parseInt(request.getParameter("noder1"));
		    		int nog=Integer.parseInt(request.getParameter("nog1"));
		    		String noguest=(String)session.getAttribute("guestname");
		    		//out.print(noguest);
		    		String checkin=request.getParameter("checkin");
		    		String checkout=request.getParameter("checkout");
		    		int non=Integer.parseInt(request.getParameter("non1"));
		    		double poder=rs.getDouble("podeluxeroom");
		    		double totalamt=1;
		    		totalamt=noder*non*poder;
		    	%>
		  		<tr>
					<td align="center"><strong>Your username : </strong></td>
					<td align="center"><input type="text" name="us" value=<%=username %> readonly></td>
				</tr>
				<tr>
					<td align="center"><strong>Your email address : </strong></td>
					<td align="center"><input type="text" name="ea" value=<%=email %> readonly></td>
				</tr>
				
		    	
		    	
				<tr>
					<td align="center"><strong>No.of deluxe rooms : </strong></td>
					<td align="center"><input type="text" name="nosr1" value=<%=noder %> readonly></td>
				</tr>
				<tr>
					<td align="center"><strong>No.of guests : </strong></td>
					<td align="center"><input type="text" name="nog1" value=<%=nog %> readonly></td>
         		</tr>
         		<%
         			//int i=0;
         			//while(i<nog)
         			//{
         		%>
         		<tr>
         			<!--  <td align="center"><strong>Enter the name of guest <%//=i+1 %></strong></td>-->
         			<td align="center"><strong>Name of <%=nog%> guest(s) : <br>(separated by comma)</strong></td>
         			<td align="center"><%out.print(noguest);%></td>
         		</tr>
         		<%
         			//i++;
	         		//}
	         		
         		%>
         		<tr>
         			<td align="center"><strong>Check-In Date : </strong></td>
					<td align="center"><input type="text" id="checkin" name="checkin" value=<%=checkin %> readonly></td>
				</tr>
				<tr>
					<td align="center"><strong>Check-Out Date : </strong></td>
					<td align="center"><input type="text" id="checkout" name="checkout" value=<%=checkout %> readonly></td>
				</tr>
				<tr>
					<td align="center"><strong>No of Nights : </strong></td>
					<td align="center"><input type="text" id="non1" name="non1" value=<%=non %> readonly></td>
				</tr>
				<tr>
					<td align="center"><strong>Total amount payable : </strong></td>
					<td align="center"><input type="text" name="tamt" value=<%=totalamt %> readonly></td>
    			</tr>
				<tr>
					<td align="center">
							<input type="hidden" name="hidid" value=<%=rs.getInt("id")%>>
          					<!-- <input type="hidden" name="name" value=<%//=name%>> -->
							<input type="hidden" name="place" value=<%=rs.getString("place")%>>
							<input type="hidden" name="pathImage" value=<%=rs.getString("image")%>>
							<input type="hidden" name="typeofroom" value=<%=rs.getString("typeofroom3")%>>
							<input type="hidden" name="poroom" value=<%=rs.getDouble("podeluxeroom")%>>
          					<input type="submit" class="button button5" name="proceed" value="Add to cart">
          			</form>
          			</td>
          			<td align="center">
          			<br>
          			<form action="" method="post" name="">
          				<input type="reset"  class="button button5" name="cancel" value="Cancel">
          			</form>
          			</td>
				</tr>
			</table>
				<%
						}
						conn.close();
						}
						catch(Exception e)
						{
							out.print(e);
						}
				%>
				<br><br><br><br>
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