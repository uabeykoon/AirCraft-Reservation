<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="dao.SheduleDAO" %>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.sql.ResultSet"%>
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
}.asd{
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
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

input[type=button] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}



</style>
</head>
<body>

<%


response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("userName")==null){
	response.sendRedirect("index.jsp");
}
%>
<ul>
		<li><a href="searchflight.jsp">Search Flight</a></li>
		<li><a href="myreservation.jsp" class="active">My Reservations</a></li>
				<form method="GET" action="Logout">
		<input type="submit" value="Logout"  style="float:right;background-color:red" class="asd">	
		</form>
	</ul>

	<div
		style="padding: 20px; margin-top: 30px; background-color: #1abc9c; height: 1500px;">



	
		
		<%
			try {
			SheduleDAO shedule = new SheduleDAO();
			ResultSet shd = shedule.getShedulesByuser(session.getAttribute("userName").toString());
		%>
		<table>
			<tr>
				<th>Departure Date</th>
				<th>Departure Time</th>
				<th>Departure Airport</th>
				<th>Arrival Date</th>
				<th>Arrival Time</th>
				<th>Arrival Airport</th>
				<th>Aircraft Reg Number</th>
				<th>Price Per Head</th>

			</tr>

			<%
				while (shd.next()) {
			%>


			<tr>
				<td>
					<%
						out.println(shd.getString("departureDate"));
					%>
				</td>
				<td>
					<%
						out.println(shd.getString("departureTime"));
					%>
				</td>
				<td>
					<%
						out.println(shd.getString("a1Name"));
					%>
				</td>
				<td>
					<%
						out.println(shd.getString("arrivalDate"));
					%>
				</td>
				<td>
					<%
						out.println(shd.getString("arrivalTime"));
					%>
				</td>
				<td>
					<%
						out.println(shd.getString("a2Name"));
					%>
				</td>
				<td>
					<%
						out.println(shd.getString("aircraftID"));
					%>
				</td>
				<td>
					<%
						out.println(shd.getString("pricePerHead"));
					%>
				</td>
				
				




				<%
					}
				%>
			</tr>
		</table>

		<%
			} catch (Exception e) {
			e.printStackTrace();
		}
		%>
		
		

	</div>

</body>
</html>