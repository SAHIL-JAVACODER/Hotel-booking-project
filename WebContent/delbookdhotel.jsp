<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Booked Hotel from Cart</title>
</head>
<body>
<% 
	Connection conn;
    try
    { 	
		int roombookid=Integer.parseInt(request.getParameter("roombookid"));
		
		String driver="oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        String url="jdbc:oracle:thin:@localhost:1521:ORCL";
        String userid="scott";
        String password="tiger";
        conn=DriverManager.getConnection(url,userid,password);
        
        String query="DELETE FROM ohbroombook WHERE roombookid='"+roombookid+"'";
		
		PreparedStatement ps=conn.prepareStatement(query);
		
		//ps.setInt(1,idofhotel);
		
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