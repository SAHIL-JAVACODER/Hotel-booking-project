<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book room db</title>
</head>
<body>
<%
		Connection conn;
		ResultSet rs;
		try
		{ 	
			int hid=Integer.parseInt(request.getParameter("hidid"));
			//String name=request.getParameter("name");
			String name=(String)session.getAttribute("hotelname");
			//out.print(name);
			String place=request.getParameter("place");
			String pathImage=request.getParameter("pathImage");
			String typeofroom=request.getParameter("typeofroom");
			double poroom=Double.valueOf(request.getParameter("poroom"));
			String username1=request.getParameter("us");
			String email1=request.getParameter("ea");
			int nor=Integer.parseInt(request.getParameter("nosr1"));
			int nog=Integer.parseInt(request.getParameter("nog1"));
			String nameofguest=(String)session.getAttribute("guestname");
			String checkin=request.getParameter("checkin");
			String checkout=request.getParameter("checkout");
			int non=Integer.parseInt(request.getParameter("non1"));
			double totalamt=Double.valueOf(request.getParameter("tamt"));
			
			String driver="oracle.jdbc.driver.OracleDriver";
		    Class.forName(driver);
		    String url="jdbc:oracle:thin:@localhost:1521:ORCL";
		    String userid="scott";
		    String password="tiger";
		    conn=DriverManager.getConnection(url,userid,password);
		    /* 
		    Statement stmt=conn.createStatement();
		    int ohbroombook=stmt.executeUpdate("SELECT OHBROOMBOOK_SEQ.NEXTVAL FROM DUAL");
		    out.print(ohbroombook);
		    */
		    
		    String query="INSERT INTO ohbroombook(idofhotel,nameofhotel,placeofhotel,imageofhotel,typeofroom,priceofroom,username,emailid,nosroom,noguest,nameofguest,checkin,checkout,nonight,totalamountpay,ROOMBOOKID) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,OHBROOMBOOK_SEQ.NEXTVAL)";
		    PreparedStatement ps=conn.prepareStatement(query);
		 	ps.setInt(1,hid);
			ps.setString(2,name);
			ps.setString(3,place);
			ps.setString(4,pathImage);
			ps.setString(5,typeofroom);
			ps.setDouble(6,poroom);
			ps.setString(7,username1);
			ps.setString(8,email1);
			ps.setInt(9,nor);
			ps.setInt(10,nog);
			ps.setString(11,nameofguest);
			ps.setString(12,checkin);
			ps.setString(13,checkout);
			ps.setInt(14,non);
			ps.setDouble(15,totalamt);
		    //ps.setInt(14,ohbroombook);
			int rn=ps.executeUpdate();
			
			if(rn>0)
				response.sendRedirect("cart1.jsp");
	        conn.close();
	     }
		 catch(Exception e)
		 {
			 out.print(e);
		 }
	%>

</body>
</html>