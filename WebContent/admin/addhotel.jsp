<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Photo of Hotel</title>
<style>
table 
{
    border-collapse: collapse;
    width: 54%;
}

th, td 
{
    padding: 8px;
    border-bottom: 2px solid #ddd;
    border-left: 2px solid #ddd;
}
tr:hover 
{
	background-color:#f5f5f5;
}
</style>
</head>
<body background="addhotelbg.jpg">
<table bgcolor="#CCCCCC" align="center">
<tr>
	<th bgcolor="#eeeeee" align="center" colspan="2">Enter the photo of the new Hotel</th>
</tr>
<form action="addhotel1.jsp" method="post" enctype="multipart/form-data">
<tr>
	<td>Photos of the Hotel : </td>
    <td><input type="file" name="file" size="50"></td>
</tr>
<tr>
	<td align="center"><input type="submit" value="Upload file"></td>
	<td align="center"><input type="reset" value="Cancel"></td>
</tr>
</table> 
</form>
</body>
</html>