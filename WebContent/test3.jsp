<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
		    int roombookid=104;
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
				
				String fullmsg="Name of hotel : " + name + "<br>" +"Place of hotel : " + place + " <br> " + "Type of room booked : " + typeofroom + "<br>" + "Price of room/Night : " + priceofroom + " <br> " + "No.of rooms booked : " + noroom + "<br>" + "No.of Guests : " + noguest + "<br>" + "Name of Guest(s) : " + nameofguest + "<br>" + "Check-In Date : " + checkin + "<br>" + "Check-Out Date : " + checkout + "<br>" + "No.of nights booked : " + nonight + "<br>" + "Total amount paid : " + totalamount + "<br>" + "Username : " + username + "<br>" + "Email ID : " + emailid + "<br>";
				out.print(fullmsg);
				
			}
			conn.close();
			
		}
			catch(Exception e)
			{
				out.print(e);
			}
			
			
		%>
			

</body>
</html>