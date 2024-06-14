<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sending Mail</title>
</head>
<body>
	<%
		Connection conn;
		ResultSet rs;
		try
		{ 
			String fullmsg="";
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
		    
		    if(rs.next()==true)
			{
				String name=rs.getString("nameofhotel");
				String place=rs.getString("placeofhotel");
				String typeofroom=rs.getString("typeofroom");
				double priceofroom=rs.getDouble("priceofroom");
				int noroom=rs.getInt("nosroom");
				int noguest=rs.getInt("noguest");
				String nameofguest=rs.getString("nameofguest");
				String checkin=rs.getString("checkin");
				String checkout=rs.getString("checkout");
				int nonight=rs.getInt("nonight");
				double totalamount=rs.getDouble("totalamountpay");
				String username=rs.getString("username");
				String emailid=rs.getString("emailid");
				String ccn=request.getParameter("ccn");
				String name1=request.getParameter("name1");
				String ed1=request.getParameter("ed1");
				String cvv1=request.getParameter("cvv1");
				
				fullmsg="Name of hotel : " + name + ",\n" +"Place of hotel : " + place + " ,\n " + "Type of room booked : " + typeofroom + " ,\n " + "Price of room/Night : " + priceofroom + " ,\n " + "No.of rooms booked : " + noroom + " ,\n " + "No.of Guests : " + noguest + " ,\n " + "Name of Guest(s) : " + nameofguest + " ,\n " + "Check-In Date : " + checkin + " ,\n " + "Check-Out Date : " + checkout + " ,\n " + "No.of nights booked : " + nonight + " ,\n " + "Total amount paid : " + totalamount + " ,\n " + "Username : " + username + " ,\n " + "Email ID : " + emailid + " ,\n " + "Credit/Debit Card No : " + ccn + " ,\n " + "Name on Credit/Debit card : " + name1 + " ,\n " + "Expiry Date : " + ed1 + " ,\n " + "CVV : " + cvv1 +"";
				//out.print(fullmsg);
			}
		    conn.close();
		    
			
			String to=request.getParameter("To");
			Properties props=new Properties();
	    	props.put("mail.smtp.host","smtp.gmail.com");
	    	props.put("mail.smtp.socketFactory.port","465");
	    	props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	    	props.put("mail.smtp.auth","true");
	    	props.put("mail.smtp.port","465");
	    	Session session1=Session.getInstance(props,new javax.mail.Authenticator()
	    	{
	    		protected PasswordAuthentication getPasswordAuthentication()
	    	{
	    		return new PasswordAuthentication("mscbscmsc@gmail.com","chhatarmatha");
	    	}
	    });
	   		
	    	MimeMessage message=new MimeMessage(session1);
	    	message.setFrom(new InternetAddress("mscbscmsc@gmail.com"));
	    	message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
	    	message.setSubject("Your Room Booking Details from Let's Go");
	    	message.setText(fullmsg);
	    	
	    	Transport.send(message);
	    	response.sendRedirect("paymentsuccess.jsp");
	    }
	    catch(Exception e)
		{
			//out.print(e);
			out.print("Unable to connect to the Internet.Please try again later");
		}
  
    %>

</body>
</html>