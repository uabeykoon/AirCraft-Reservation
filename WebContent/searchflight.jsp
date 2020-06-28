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
</head>
<body>
<%
if(session.getAttribute("userName")==null){
	response.sendRedirect("index.jsp");
}
%>
	<div class="container">
		<h3>Search Schedule</h3>
		<form method="POST"
			action="searchflightresult.jsp">
			<table border="0">
				<tr>
					<td>Choose Departure :</td>
					<td>
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
					</td>


					<td>Choose Arrival:</td>
					<td><%
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
 %></td>


					<td>Date :</td>
					<td><input type="date" name="date" required/></td>

				</tr>

				<td colspan="2"><input type="submit" value="Search" /></td>
				</tr>
			</table>
		</form>

		<br />
		<br />

	</div>
</body>
</html>