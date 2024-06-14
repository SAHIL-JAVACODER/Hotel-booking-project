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
		<title>Payment Page</title>
		<style>
			table 
			{
			 	border-collapse: collapse;
			 	width: 70%;
			}
			th, td 
			{
			 	padding: 6px;
			 	border: 0px solid #ddd;
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
			    padding: 4px;
			    text-align: center;
			    text-decoration:none;
			    display: inline-block;
			    font-size: 12px;
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
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>
    <%
		Connection conn;
		ResultSet rs;
		try
		{ 	
			int roombookid=Integer.parseInt(request.getParameter("roombookid"));
			String driver="oracle.jdbc.driver.OracleDriver";
		    Class.forName(driver);
		    String url="jdbc:oracle:thin:@localhost:1521:ORCL";
		    String userid="scott";
		    String password="tiger";
		    conn=DriverManager.getConnection(url,userid,password);
		    String query="SELECT nameofhotel,placeofhotel,typeofroom,priceofroom,nosroom,noguest,nameofguest,checkin,checkout,nonight,totalamountpay,username,emailid,idofhotel,roombookid from ohbroombook where roombookid=?";
		    PreparedStatement ps=conn.prepareStatement(query);
		    ps.setInt(1,roombookid);
		    rs=ps.executeQuery();
		    
	%>				
    <div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="Search Hotels">
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
				<h4><span>Payment Page</span></h4>
			</section>			
			<section class="main-content">
			  <div class="row">	
				<h4 align="center">Your Booking Details</h4>
				<form action="sendmail.jsp" method="post" class="form-stacked">
				<table style="background-color:#EBEBEB;" align="center">
					<%
						if(rs.next()==true)
						{
					%>
					<tr>
						<td align="center" width="380px">Name of the Hotel : </td> 
						<td align="center"><%=rs.getString("nameofhotel")%></td>
					</tr>
					<tr>
						<td align="center">Place of the Hotel : </td>
						<td align="center"><%=rs.getString("placeofhotel")%></td>
					</tr>
					<tr>
						<td align="center">Room Type : </td>
						<td align="center"><%=rs.getString("typeofroom")%></td>
					</tr>
					<tr>
						<td align="center">Price of room per night : </td>
						<td align="center"><%=rs.getDouble("priceofroom")%></td>
					</tr>
					<tr>
						<td align="center">No.of rooms booked : </td>
						<td align="center"><%=rs.getInt("nosroom")%></td>
					</tr>
					<tr>
						<td align="center">No.of guests : </td>
						<td align="center"><%=rs.getInt("noguest")%></td>
					</tr>
					<tr>
						<td align="center">Guest Names : </td>
						<td align="center"><%=rs.getString("nameofguest")%></td>
					</tr>
					<tr>
						<td align="center">Check-In Date : </td>
						<td align="center"><%=rs.getString("checkin")%></td>
					</tr>
					<tr>
						<td align="center">Check-Out Date : </td>
						<td align="center"><%=rs.getString("checkout")%></td>
					</tr>
					<tr>
						<td align="center">No.of nights : </td>
						<td align="center"><%=rs.getInt("nonight")%></td>
					</tr>
					<tr>
						<td align="center">Total amount payable : </td>
						<td align="center"><%=rs.getDouble("totalamountpay")%></td>
					</tr>
					<tr>
						<td align="center">Booked By : </td>
						<td align="center">Username : <%=rs.getString("username")%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email Id : <input type="email" name="To" value=<%=rs.getString("emailid")%> readonly></td>
					</tr>
				</table>			
				<br>
                <hr>
                <h4 align="center">Enter your Debit Card / Credit Card Details</h4>
                <h5 align="center">We support all major cards</h5>
				<table style="background-color:#EBEBEB;" align="center">
                <tr>
                	<td align="center" width="405px"><a href="" class="logo pull-right"><img src="themes/images/visa.jpg" class="site_logo" alt=""></a></td>
                	<td align="center"><a href="" class="logo pull-left"><img src="themes/images/mcard.jpg" class="site_logo" alt=""></a></td>
                	<br>
                </tr>
                <tr>
                	<td align="center">Enter Credit Card / Debit Card No : </td>
                	<td align="center"><input type="text" name="ccn" placeholder="Enter your card no" class="input-xlarge" required></td>
                </tr>
                <tr>
                	<td align="center">Name on Card : </td>
                	<td align="center"><input type="text" name="name1" placeholder="Enter your name on card" class="input-xlarge" required></td>
                </tr>
                <tr>
                	<td align="center">Expiry Date : </td>
                	<td align="center"><input type="text" name="ed1" placeholder="Enter expiry date in mm/yyyy format" class="input-xlarge" required></td>
                </tr>
                <tr>
                	<td align="center">Enter CVV : </td>
                	<td align="center"><input type="text" name="cvv1" placeholder="Enter cvv" class="input-xlarge" required></td>
                </tr>
                <tr>
                	<td align="center">
                		<input type="hidden" name="roombookid" value=<%=rs.getInt("roombookid")%>>
						<input tabindex="9" class="btn btn-inverse large" type="submit" value="Pay">
					</td>
				</form>
					<td align="center"><br>
                		<form action="" method="post">
							<input tabindex="9" class="btn btn-inverse large" type="submit" value="Cancel">
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
		</div>
		<br>
		<hr>
		<br>
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
					document.location.href = "checkout.html";
				})
			});
		</script>		
    </body>
</html>