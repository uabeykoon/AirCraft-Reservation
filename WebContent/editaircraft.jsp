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
div {
    padding: 50px;
    border: 2px solid green;
	width: 450px;
    height:500px;
 	
    margin-right: 25px;
    margin-left: 50px;
    
    font-family:verdana;
    font-size:100%;
}
</style> 
</head>
<body>
<%
if(session.getAttribute("userName")==null){
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
<h2><a href="index.jsp">Back</a></h2>
<div>
<br><b>Aircraft Name:</b><br><input class="textbox"type="text" name = "aircraftName" placeholder = "MAKM123" required><br>
<br><b>Aircraft Number:</b><br><input class="textbox"type="text" name = "regNumber" placeholder = "LAX" required  value=<%=regNumber%>> <br>
<br><b>Seats:</b><br><input class="textbox"type="text" name = "seatCount" placeholder = "00" required  value=<%=seat%>> <br>

<input type="submit" value="UPDATE" class="box">
<a href="adminaircraft.jsp"><input type="button" value="CANCEL" class="box"></a>

</div>
</form>
</body>
</html>

