<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="test2.jsp" method="post">
	<fieldset>
	  <legend>test</legend>
			
			Check-In Date:<br>
			<input type="date" id="checkin" name="checkin" required>
			<br><br>
			Check-Out Date:<br>
			<input type="date" id="checkout" name="checkout" required>
			<br><br>
			<input type="submit" value="Submit">
			</fieldset>
	  </form> 

</body>
</html>