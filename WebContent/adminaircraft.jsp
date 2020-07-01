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

.asd{
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
#111
;


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
	

if(!session.getAttribute("userName").toString().equals("admin@admin.com")){
	response.sendRedirect("index.jsp");
}
%>





	<ul>
		<li><a href="adminhome.jsp">Home</a></li>
		<li><a href="adminaircraft.jsp" class="active">AirCrafts</a></li>
		<li><a href="adminschedule.jsp">Schedule</a></li>
				<form method="GET" action="Logout">
		<input type="submit" value="Logout"  style="float:right;background-color:red" class="asd">	
		</form>
	</ul>

	<div
		style="padding: 20px; margin-top: 30px; background-color: #1abc9c; height: 1500px;">

		<a href="addaircraft.jsp"> <input type="button" value="ADD NEW AIRCRAFT"> </a><br><br>



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
				<th>Delete</th>

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
				<td>
					<form action="Deleteaircraft" method="POST">
						<button name="aircraftID" value=<%=air.getString("regNumber")%>>DELETE</button>
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

	</div>

</body>
</html>