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

<%
if(session.getAttribute("userName")==null){
	response.sendRedirect("index.jsp");
}
%>



<%

String dAirport = request.getParameter("dAirport");
String aAirport = request.getParameter("aAirport");
String date = request.getParameter("date");


			try {
			SheduleDAO shedule = new SheduleDAO();
			ResultSet shd = shedule.searchShedule(dAirport,aAirport,date);
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
				<th>Edit</th>

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
				<td>
					<form action="Addres" method="POST">
					<button name="sheduleID" value=<%=shd.getString("sheduleID")%>>ADD RESERVATION</button>
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
</head>
<body>

</body>
</html>