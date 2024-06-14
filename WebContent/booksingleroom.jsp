<%
	String username=(String)session.getAttribute("username");
	String email=(String)session.getAttribute("email");
	
	if(email==null)
	{
		out.print("<h3 style='color:#f00; font-family:Times New Roman; align=center;'>Please login or register to continue booking</h3>");
		response.sendRedirect("register.jsp"); 
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Single Room</title>
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
		    //String username=(String)session.getAttribute("username");
			//String email=(String)session.getAttribute("email");
		    
			int hid=Integer.parseInt(request.getParameter("hidid"));
		    String query="SELECT id,place,name,typeofroom1,posingleroom,image FROM ohbhotels WHERE id='"+hid+"' ";
		    
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
				<h4><span>Enter your details</span></h4>
			</section>
			
			<section class="main-content">				
				<!--  <div class="row">						
					<div class="span9">
						<div class="row">-->
				<table style="background-color:#EBEBEB;" align="center">
				<%
					if(rs.next()==true)
					{
				%>
				<h5 style="color:red;" align="center">A maximum of three people is allowed per room including children. For more than three people book another room.</h5>
				<form action="booksingleroom1.jsp" method="post" name="">
				<tr>
					<td align="center" style="width:120px"><strong>Hotel</strong></td>
					<td align="center" style="width:120px">
						<h5><%=rs.getString("name")%> in <%=rs.getString("place")%></h5>
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
	     				<strong><%=rs.getString("typeofroom1")%></strong>
	     			</td>
	     		</tr>
	     		<tr>
	     			<td align="center"><strong>Price of Rooms : </strong></td>
	     			<td align="center">
							<strong>Rs. <%=rs.getDouble("posingleroom")%> for 1 night</strong>
					</td>
		  		</tr>
				<tr>
					<td align="center"><strong>Your username : </strong></td>
					<td align="center"><input type="text" name="us" value="<%=username %>" readonly></td>
				</tr>
				<tr>
					<td align="center"><strong>Your email address : </strong></td>
					<td align="center"><input type="text" name="ea" value="<%=email %>" readonly></td>
				</tr>
				<tr>
					<td align="center"><strong>Select the no.of single rooms : </strong></td>
					<td align="center"><select size="1" name="nosr">
    										<option value="1">1</option>
									        <option value="2">2</option>
									        <option value="3">3</option>
									        <option value="4">4</option>
									        <option value="5">5</option>
         								</select>
         			</td>
				</tr>
				<tr>
					<td align="center"><strong>Select the no.of guests : </strong></td>
					<td align="center"><select size="1" name="nog">
    											<option value="1">1</option>
									            <option value="2">2</option>
									            <option value="3">3</option>
									            <option value="4">4</option>
									            <option value="5">5</option>
									            <option value="6">6</option>
									            <option value="7">7</option>
									            <option value="8">8</option>
									            <option value="9">9</option>
									            <option value="10">10</option>
         								</select>
         			</td>
				</tr>
				<tr>
         			<!--  <td align="center"><strong>Enter the name of guest <%//=i+1 %></strong></td>-->
         			<td align="center"><strong>&nbsp;&nbsp;&nbsp;Enter name of guest(s) : <br>(separated by comma)</strong></td>
         			<td align="center"><input type="text" name="noguest"></td>
         		</tr>
				<tr>
					<td align="center"><strong>Check-In Date : </strong></td>
					<td align="center"><input type="date" id="checkin" name="checkin" required></td>
				</tr>
				<tr>
					<td align="center"><strong>Check-Out Date : </strong></td>
					<td align="center"><input type="date" id="checkout" name="checkout" required></td>
				</tr>
				<tr>
					<td align="center">
						
         					<input type="hidden" name="hidid" value=<%=rs.getInt("id")%>>
          					<input type="submit" class="button button5" name="proceed" value="Proceed">
          			</td>
          			</form>
          			<td align="center">
          			<form action="" method="post" name="">
          				<br><input type="reset"  class="button button5" name="cancel" value="Cancel">
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
							<li><a href="index.jsp">Homepage</a></li>  
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