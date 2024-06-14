<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
	try
	{ 
		System.out.println("1");
		Connection conn;
		Statement stmt;
		ResultSet rs;
		String driver="oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);
		String url="jdbc:oracle:thin:@localhost:1521:ORCL";
		String userid="scott";
    	String password="tiger";
    	conn=DriverManager.getConnection(url,userid,password);
    	stmt=conn.createStatement();
	
		String email1=request.getParameter("email");
		String password1=request.getParameter("password");
		
		String query="SELECT USERNAME,EMAILID FROM OHBUSERS WHERE EMAILID='"+email1+"' AND PASSWORD='"+password1+"'";
		rs=stmt.executeQuery(query);
		if(rs.next())
		{
			System.out.println("2");
			String username=rs.getString("USERNAME");
			String email=rs.getString("EMAILID");
			session.setAttribute("username",username);
			session.setAttribute("email",email);
			response.sendRedirect("success.jsp");
		}
		else
		{
			System.out.println("3");
			response.sendRedirect("error.jsp");
		}
		conn.close();
	}
catch(Exception e)
{
	System.out.println("4");
	out.print(e.toString());
}
%>
</body>
</html>