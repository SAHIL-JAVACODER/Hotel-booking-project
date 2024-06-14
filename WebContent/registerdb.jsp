<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registerdb</title>
</head>
<body>
<% 
	Connection conn;
    try
    { 	
		String username1=request.getParameter("username");
		String email=request.getParameter("email");
		String password1=request.getParameter("password");
		
        String driver="oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        
        String url="jdbc:oracle:thin:@localhost:1521:ORCL";
        String userid="scott";
        String password="tiger";
        
        conn=DriverManager.getConnection(url,userid,password);
        
        String query="INSERT INTO ohbusers(username,emailid,password) VALUES(?,?,?)";
		
		PreparedStatement ps=conn.prepareStatement(query);
		
		ps.setString(1,username1);
		ps.setString(2,email);
		ps.setString(3,password1);
		
		int rn=ps.executeUpdate();
		
		if(rn>0)
		{
	%>
			<h5 style="color:red;" "text-align:center;">Successfully registered. Welcome to Let's Go.</h5>
			<%@ include file="index.jsp" %>
	<% 
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