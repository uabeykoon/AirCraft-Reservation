<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="dao.AircraftDAO" %>
<%@ page import="dao.AirportDAO" %>

<%
	ResultSet resultset = null;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a Flight</title>
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
    width: 85px; 
    color:green;
  }
  select{
  background: transparent url(http://html-generator.weebly.com/files/theme/input-text-8.png) repeat-x; 
    border: 1px solid #999; 
    outline:0; 
    height:28px; 
    width: 275px;
    color:green; 
  }
div {
    padding: 50px;
    border: 2px solid green;
	width: 450px;
    height:580px;
 	
    margin-right: 25px;
    margin-left: 50px;
    
    font-family:verdana;
    font-size:100%;
}
</style>
</head>
<body>
<form method="post" action="AddShedule">
<h2><a href="index.jsp">Back</a></h2>
<div>
<label><b>Airplane RegNumber:</b> </label><br><%
 	try {
 		AircraftDAO aircraftdao = new AircraftDAO();
 		ResultSet rs = aircraftdao.getAircrafts();
 		
 %> <select id="aircraft" name="aID">
							<%
								while (rs.next()) {
							%>
							<option value=<%=rs.getString("regNumber")%>><%=rs.getString("regNumber") %></option>
							<%
								}
							%>
					</select>
					 <%
 	} catch (Exception e) { // TODO Auto-generated catch block
 		e.printStackTrace();
 	}
 %>

<br><br><label style="padding-right: 9px"><b>From:</b> </label><br> <%
 	try {
 		AirportDAO airportdao = new AirportDAO();
 		ResultSet rs2 = airportdao.getAirports();
 %> <select id="fromairport" name="dAirport">
							<%
								while (rs2.next()) {
							%>
							<option value=<%=rs2.getInt("airportID")%>><%=rs2.getString("name")%>(<%=rs2.getString("location")%>)</option>
							<%
								}
							%>
					</select>
					 <%
 	} catch (Exception e) { // TODO Auto-generated catch block
 		e.printStackTrace();
 	}
 %>
	<br><br>
	<label style="padding-right: 9px"><b>To:</b> </label><br><%
 	try {
 		AirportDAO airportdao = new AirportDAO();
 		ResultSet rs3 = airportdao.getAirports();
 %> <select id="toairportList" name="aAirport">
							<%
								while (rs3.next()) {
							%>
							<option value=<%=rs3.getInt("airportID")%>><%=rs3.getString("name")%>(<%=rs3.getString("location")%>)</option>
							<%
								}
							%>
					</select>
					 <%
 	} catch (Exception e) { // TODO Auto-generated catch block
 		e.printStackTrace();
 	}
 %>

<br><br><Label><b>Depart Date: </b><br></label> <input class="textbox" type="date" name="dDate" required><br>
<br><Label><b>Depart Time: </b><br></label> <input class="textbox" type="time" name="dTime" required><br>
<br><Label><b>Arrival Date: </b><br></label> <input class="textbox" type="date" name="aDate" required><br>
<br><Label><b>Arrival Time: </b><br></label> <input class="textbox" type="time" name="aTime" required><br>
<br><Label><b>Price:</b><br></label> <input class="textbox" type="number" name="price" required><br>


<br><br><br><input type = "submit" class="box" value ="Add">


</div>
</form>
</body>
</html>