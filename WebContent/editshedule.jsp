<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>

<%@ page import="dao.SheduleDAO" %>
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

<%
int sheduleID = Integer.parseInt(request.getParameter("sheduleID"));

String dDate="";
String dTime="" ;
int dAirport=0;
String dAirportName="";
String aDate="";
String aTime="";
int aAirport=0;
String aAirportName="";
String aID=""; 
int price=0;
try{
	SheduleDAO shedule = new SheduleDAO();
	ResultSet rs = shedule.getOneShedule(sheduleID);
	rs.next();
	dDate=rs.getString("departureDate");
	dTime=rs.getString("departureTime");
	dAirport=rs.getInt("departureAirport");
    dAirportName=rs.getString("a1Name");
	aDate=rs.getString("arrivalDate");
	aTime=rs.getString("arrivalTime");
	aAirport=rs.getInt("arivalAirport");
	aAirportName=rs.getString("a2Name");
	aID=rs.getString("aircraftID"); 
	price=rs.getInt("pricePerHead");
	
	
	
}catch(Exception e){
	out.print(e);
}
%>

<form method="post" action="Shedule">
<h2><a href="index.jsp">Back</a></h2>
<div>
<input type="hidden" name="sheduleID" value="<%=sheduleID%>" />
<label><b>Airplane RegNumber:</b> </label><br><%
 	try {
 		AircraftDAO aircraftdao = new AircraftDAO();
 		ResultSet rs = aircraftdao.getAircrafts();
 		
 %> <select id="aircraft" name="aID">
 							<option value=<%=aID%>><%=aID %></option>
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
 							<option value=<%=dAirport%>><%=dAirportName%></option>
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
							<option value=<%=aAirport%>><%=aAirportName%></option>
							<%
								}
							%>
					</select>
					 <%
 	} catch (Exception e) { // TODO Auto-generated catch block
 		e.printStackTrace();
 	}
 %>

<br><br><Label><b>Depart Date: </b><br></label> <input class="textbox" type="date" name="dDate" required value=<%=dDate %>><br>
<br><Label><b>Depart Time: </b><br></label> <input class="textbox" type="time" name="dTime" required value=<%=dTime %>><br>
<br><Label><b>Arrival Date: </b><br></label> <input class="textbox" type="date" name="aDate" required value=<%=aDate %>><br>
<br><Label><b>Arrival Time: </b><br></label> <input class="textbox" type="time" name="aTime" required value=<%=aTime %>><br>
<br><Label><b>Price:</b><br></label> <input class="textbox" type="number" name="price" required value=<%=price %>><br>


<br><br><br><input type = "submit" class="box" value ="Add">
<a href="adminschedule.jsp"><input type="button" value="CANCEL" class="box"></a>


</div>
</form>
</body>
</html>