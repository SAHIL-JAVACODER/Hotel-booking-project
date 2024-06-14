<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<% 
	String checkin=request.getParameter("checkin");
	String checkout=request.getParameter("checkout");
%>
<script type="text/javascript">
	function check() 
	{
	  var date1 = new Date(document.getElementById('checkin').value);
	  var date2 = new Date(document.getElementById('checkout').value);
	  var diff = Math.abs(date2.getTime() - date1.getTime());
	  var noofdays = Math.ceil(diff / (1000 * 3600 * 24));  
	  if(date1  > date2)
	  { 
		 alert("Check-out date must be after check-in date!")
		 
	  }
	  else 
	  {
		document.getElementById("nod").value = noofdays;
	  }
	}		
</script>
</head>
<body>
<form>
	<fieldset>
	  <legend>test</legend>
			
			Check-In Date:<br>
			<input type="text" id="checkin" name="checkin" value=<%=checkin %> readonly>
			<br><br>
			Check-Out Date:<br>
			<input type="text" id="checkout" name="checkout" value=<%=checkout %> readonly>
			<br><br>
			No of Days:<br>
			<input type="text" id="nod" name="nod" readonly>
			
			<script type="text/javascript">
				check(); 
			</script>
		</fieldset>
	  </form> 


</body>
</html>