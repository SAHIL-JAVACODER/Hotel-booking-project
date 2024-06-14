<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Hotel</title>
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
<% 
	String contentType=request.getContentType();
	String saveFile="";
	String imagePath="";
	if((contentType!= null) && (contentType.indexOf("multipart/form-data")>=0))
	{
		DataInputStream in=new DataInputStream(request.getInputStream());
		int formDataLength=request.getContentLength();
		byte dataBytes[]=new byte[formDataLength];
		int byteRead=0;
		int totalBytesRead=0;
		while(totalBytesRead<formDataLength)
		{
			byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
			totalBytesRead+=byteRead;
		}
		String file=new String(dataBytes);
		saveFile=file.substring(file.indexOf("filename=\"")+10);
		saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
		saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
		int lastIndex=contentType.lastIndexOf("=");
		String boundary=contentType.substring(lastIndex+1,contentType.length());
		int pos;
		pos=file.indexOf("filename=\"");
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		int boundaryLocation=file.indexOf(boundary,pos)-4;
		int startPos=((file.substring(0,pos)).getBytes()).length;
		int endPos=((file.substring(0,boundaryLocation)).getBytes()).length;
		ServletContext context=pageContext.getServletContext();
		String filePath=context.getInitParameter("file-upload");
		File f=new File(filePath+"\\"+saveFile);
		//File f=new File(saveFile);
		FileOutputStream fileOut=new FileOutputStream(f);
		fileOut.write(dataBytes,startPos,(endPos-startPos));
		fileOut.flush();
		fileOut.close();
		
		imagePath=filePath+"\\"+saveFile;
	}
	
%>
<br>
<table border="2">
<tr>
	<td><b>You have successfully uploaded the file.</b>
	<% out.println(imagePath); %>
	</td>
</tr>
</table>

<table bgcolor="#CCCCCC" align="center">
<tr>
	<th bgcolor="#eeeeee" align="center" colspan="2">Enter all details of the new Hotel</th>
</tr>
<form action="addhotel1db.jsp" method="post">
<input type="hidden" name="imagePath" value=<%=imagePath %>>
<tr>
	<td>ID of the Hotel : </td>
    <td><input type="text" size-"4" name="id" required></td>
</tr>
<tr>
	<td>Domestic/International Hotel : </td>
    <td><select size="1" name="region">
    		<option>Domestic</option>
            <option>International</option>
    	</select>
	</td>
</tr>
<tr>
    <td>Place of Hotel : </td>
    <td><select size="1" name="place">
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
	<td>Name of the Hotel : </td>
    <td><input type="text" size-"50" name="name" required></td>
</tr>
<tr>
	<td>About the Hotel : </td>
    <td><textarea rows="5" cols="50" name="about" required ></textarea></td>
</tr>
<tr>
	<td>Type of Hotel : </td>
    <td><select size="1" name="type">
    		<option>One Star</option>
            <option>Two Star</option>
            <option>Three Star</option>
            <option>Four Star</option>
            <option>Five Star</option>
         </select>
    </td>
</tr>
<tr>
	<td>Total no of rooms in the Hotel : </td>
    <td><input type="text" name="noofrooms" required ></td>
</tr>
<tr>
	<td>Type of rooms in the Hotel : </td>
    <td><input type="checkbox" name="id1" value="Single">Single <br>
    	<input type="checkbox" name="id2" value="Double">Double <br>
        <input type="checkbox" name="id3" value="Deluxe">Deluxe</td>
</tr>
<tr>
	<td>Enter the number of Single rooms : </td>
    <td><input type="text" name="nosinglerm" required></td>
</tr>
<tr>
	<td>Enter the number of Double rooms : </td>
    <td><input type="text" name="nodoublerm" required></td>
</tr>
<tr>
	<td>Enter the number of Deluxe rooms : </td>
    <td><input type="text" name="nodeluxerm" required></td>
</tr>
<tr>
	<td>Price(in Rupees)of each Single room : </td>
    <td><input type="text" name="posinglerm" required></td>
</tr> 
<tr>
	<td>Price(in Rupees)of each Double room : </td>
    <td><input type="text" name="podoublerm" required></td>
</tr>
<tr>
	<td>Price(in Rupees)of each Deluxe room : </td>
    <td><input type="text" name="podeluxerm" required></td>
</tr> 
<tr>
	<td align="center"><input type="submit" value="Submit"></td>
	<td align="center"><input type="reset" value="Cancel"></td>
</tr>
</table> 
</form>

</body>
</html>