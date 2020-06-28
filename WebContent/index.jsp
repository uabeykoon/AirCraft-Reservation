<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Aircraft</title>

</head>
<body>

	<form method = "POST" action="Login">
		<label for="fname">Enter User name:</label> <input type="text" id="username"
			name="username"><br>
		<br> <label for="lname">Password :</label> <input type="text"
			id="password" name="password"><br>
			<input type="radio" name="type" value="admin" checked>
  			<label for="male">Admin</label><br>
  			<input type="radio" name="type" value="customer">
  			<label for="female">Client</label><br>
  			
		<br> <input type="submit" value="Submit">
	</form>
	
	<a href="userregistration.jsp">Register</a>
	

</body>
</html>