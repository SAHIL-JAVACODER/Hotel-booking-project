<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Resort</title>
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
	<th bgcolor="#eeeeee">Enter all details of the new Resort</th>
</tr>
<form>
<tr>
	<td>Domestic/International Resort : </td>
    <td><select size="1">
    		<option>Domestic</option>
            <option>International</option>
    	</select>
	</td>
</tr>
<tr>
    <td>Place of Resort : </td>
    <td><select size="1">
    		<option>Mumbai</option>
            <option>Delhi</option>
            <option>Maharashtra</option>
            <option>Kolkata</option>
            <option>Bengaluru</option>
            <option>Chennai</option>
            <option>Kerala</option>
            <option>Kochi</option>
            <option>Chandigarh</option>
            <option>Pondicherry</option>
            <option>Bhopal</option>
            <option>Norway</option>
            <option>Denmark</option>
            <option>Dubai</option>
            <option>Malaysia</option>
            <option>Singapore</option>
            <option>London</option>
    	</select>
      </td>
</tr>
<tr>  
	<td>Name of the Resort : </td>
    <td><input type="text" size-"50"></td>
</tr>
<tr>
	<td>Photos of the Resort : </td>
    <td><input type="file"></td>
</tr>
<tr>
	<td>About the Resort : </td>
    <td><textarea rows="5" cols="50"></textarea></td>
</tr>
<tr>
	<td>Type of Resort : </td>
    <td><select size="1">
    		<option>One Star</option>
            <option>Two Star</option>
            <option>Three Star</option>
            <option>Four Star</option>
            <option>Five Star</option>
         </select>
    </td>
</tr>
<tr>
	<td>Total no of rooms in the Resort : </td>
    <td><input type="number"></td>
</tr>
<tr>
	<td>Type of rooms in the Resort : </td>
    <td><input type="checkbox">Single <br>
    	<input type="checkbox">Double <br>
        <input type="checkbox">Deluxe</td>
</tr>
<tr>
	<td>Enter the number of Single rooms : </td>
    <td><input type="number"></td>
</tr>
<tr>
	<td>Enter the number of Double rooms : </td>
    <td><input type="number"></td>
</tr>
<tr>
	<td>Enter the number of Deluxe rooms : </td>
    <td><input type="number"></td>
</tr>
<tr>
	<td>Price(in Rupees)of each Single room : </td>
    <td><input type="text"></td>
</tr> 
<tr>
	<td>Price(in Rupees)of each Double room : </td>
    <td><input type="text"></td>
</tr>
<tr>
	<td>Price(in Rupees)of each Deluxe room : </td>
    <td><input type="text"></td>
</tr> 
<tr>
	<td align="center"><input type="submit" value="Submit"></td>
	<td align="center"><input type="reset" value="Cancel"></td>
</tr>
</table> 
</form>
</body>
</html>