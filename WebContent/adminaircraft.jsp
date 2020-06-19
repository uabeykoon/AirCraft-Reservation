<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="dao.AircraftDAO"%>
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
</style>
</head>
<body>

<%
if(session.getAttribute("userName")==null){
	response.sendRedirect("index.jsp");
}
%>





	<ul>
		<li><a href="adminhome.jsp">Home</a></li>
		<li><a href="adminaircraft.jsp" class="active">AirCrafts</a></li>
		<li><a href="adminschedule.jsp">Schedule</a></li>
		<li><a href="adminreservations.jsp">Reservations</a></li>
	</ul>

	<div
		style="padding: 20px; margin-top: 30px; background-color: #1abc9c; height: 1500px;">
		
		<a href="addaircraft.jsp"><button type="button">ADD AIRCRAFT</button></a>

		

		<%
			try {
			AircraftDAO aircfraft = new AircraftDAO();
			ResultSet air = aircfraft.getAircrafts();
		%>
		<table>
			<tr>
				<th>Reg Number</th>
				<th>Seat Count</th>
				<th>Edit</th>

			</tr>

			<%
				while (air.next()) {
			%>


			<tr>
				<td>
					<%
						out.println(air.getString("regNumber"));
					%>
				</td>
				<td>
					<%
						out.println(air.getString("seatCount"));
					%>
				</td>
				<td>
					<form action="editaircraft.jsp" method="post">
					<button name="regNumber" value=<%=air.getString("regNumber")%>>EDIT</button>
					</form>
					
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






		<p>Some text some text some text some text..</p>
	</div>

</body>
</html>