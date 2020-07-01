<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

.asd{
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
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
		<li><a href="adminaircraft.jsp">AirCrafts</a></li>
		<li><a href="adminschedule.jsp">Schedule</a></li>
				<form method="GET" action="Logout">
		<input type="submit" value="Logout"  style="float:right;background-color:red" class="asd">	
		</form>
	</ul>

	<div
		style="padding: 20px; margin-top: 30px; background-color: #1abc9c; height: 1500px;">


		<p>Some text some text some text some text..</p>

	</div>

</body>
</html>