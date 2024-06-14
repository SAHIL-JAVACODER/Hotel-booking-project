<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blogdb</title>
</head>
<body>
<%
		Connection conn;
		try
		{ 	
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String message=request.getParameter("message");
		
			String driver="oracle.jdbc.driver.OracleDriver";
		    Class.forName(driver);
		    String url="jdbc:oracle:thin:@localhost:1521:ORCL";
		    String userid="scott";
		    String password="tiger";
		    conn=DriverManager.getConnection(url,userid,password);
		    
		    String query="INSERT INTO ohbblog(name,emailid,message) VALUES(?,?,?)";
		    
		    PreparedStatement ps=conn.prepareStatement(query);
		    ps.setString(1,name);
		    ps.setString(2,email);
		    ps.setString(3,message);
		    
		    int rn=ps.executeUpdate();
			
			if(rn>0)
				response.sendRedirect("blog.jsp");
	        conn.close();
		  }
		 catch(Exception e)
		 {
			 out.print(e);
		 }
		    
	%>		

</body>
</html>