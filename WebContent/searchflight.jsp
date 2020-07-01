<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.AirportDAO" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	margin: 0;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
	position: fixed;
	top: 0;
	width: 100%;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.asd{
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: #111;
}

.active {
	background-color: #4CAF50;
}



input[type=text], select ,input[type=number],input[type=password],input[type=date],input[type=time]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.stl{
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
<body style="background-color: #1abc9c">
<%

response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("userName")==null){
	response.sendRedirect("index.jsp");
}
%>
	


	
	
	
	
	<ul>
		<li><a href="searchflight.jsp" class="active">Search Flight</a></li>
		<li><a href="myreservation.jsp">My Reservations</a></li>
				<form method="GET" action="Logout">
		<input type="submit" value="Logout"  style="float:right;background-color:red" class="asd">	
		</form>
	</ul>




		
		<h3>Search Schedule</h3>
		<form method="POST"
			action="searchflightresult.jsp">
			
			<div>

					<h3>Choose Departure :</h3>
					
						<%
							try {
							AirportDAO airportdao = new AirportDAO();
							ResultSet rs2 = airportdao.getAirports();
						%> <select id="fromairport" name="dAirport">
							<%
								while (rs2.next()) {
							%>
							<option value=<%=rs2.getInt("airportID")%>><%=rs2.getString("name")%>(<%=rs2.getString("location")%>)
							</option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) { // TODO Auto-generated catch block
 	e.printStackTrace();
 }
 %>
					


			<h3>Choose Arrival:</h3><br>
					<%
							try {
							AirportDAO airportdao = new AirportDAO();
							ResultSet rs2 = airportdao.getAirports();
						%> <select id="fromairport" name="aAirport">
							<%
								while (rs2.next()) {
							%>
							<option value=<%=rs2.getInt("airportID")%>><%=rs2.getString("name")%>(<%=rs2.getString("location")%>)
							</option>
							<%
								}
							%>
					</select> <%
 	} catch (Exception e) { // TODO Auto-generated catch block
 	e.printStackTrace();
 }
 %>


					<h3>Date :</h3>
					<input type="date" name="date" required/><br><br>
					<input type="submit" value="Search" class="stl" />
					</div>

		</form>
			


		<br />
		<br />


	
	
	
	
	
	
</body>
</html>