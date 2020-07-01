<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="dao.AircraftDAO" %>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add an Airplane</title>
<style> 
.textbox { 
    background: transparent url(http://html-generator.weebly.com/files/theme/input-text-8.png) repeat-x; 
    border: 1px solid #999; 
    outline:0; 
    height:25px; 
    width: 275px;
    color:green; 
  } 
   
  .box{
    background: transparent url(http://html-generator.weebly.com/files/theme/input-text-8.png) repeat-x;
    border: 1px solid #999; 
    outline:0; 
    height:25px; 
    width: 75px; 
    color:green;
  }
input[type=text], select ,input[type=number],input[type=password]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button] {
  width: 100%;
  background-color: #980000;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  width:25%;
  margin:auto;
  margin-top:100px;
}
</style> 
</head>
<body>
	<%
	

if(!session.getAttribute("userName").toString().equals("admin@admin.com")){
	response.sendRedirect("index.jsp");
}
%>

<%
String regNumber = request.getParameter("regNumber");
int seat = 0;
try{
	AircraftDAO aircraftdao = new AircraftDAO();
	ResultSet rs = aircraftdao.getAircraft(regNumber);
	rs.next();
	seat = rs.getInt("seatCount");
}catch(Exception e){
	out.print(e);
}
%>

<form method="post" action ="Updateaircraft">
<div>

<br><b>Aircraft Registration Number:</b><br><input type="text" name = "regNumber" placeholder = "registration number" required  value=<%=regNumber%>> <br>
<br><b>Seats:</b><br><input type="text" name = "seatCount" placeholder = "Seats count" required  value=<%=seat%>> <br>

<input type="submit" value="UPDATE">
<a href="adminaircraft.jsp"><input type="button" value="CANCEL"></a>

</div>
</form>
</body>
</html>

