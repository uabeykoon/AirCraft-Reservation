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

input[type=text], select ,input[type=number],input[type=password],input[type=date],input[type=time]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit],input[type=button] {
  width: 100%;
  background-color: #4CAF50;
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
<form method="post" action="AddShedule">
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