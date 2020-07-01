<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Aircraft</title>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
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
	<div>
	
	<h1>LOGIN</h1>
	<form method = "POST" action="Login">
		<label for="fname">Enter User name:</label> <input type="text" id="username"
			name="username"><br>
		<br> <label for="lname">Password :</label> <input type="password"
			id="password" name="password"><br>
			<input type="radio" name="type" value="admin" checked>
  			<label for="male">Admin</label><br>
  			<input type="radio" name="type" value="customer">
  			<label for="female">Client</label><br>
  			
		<br> <input type="submit" value="Login">
	</form>
	
	<a href="userregistration.jsp"><input type="button" value="Register"></a>
	
	</div>
	
	

</body>
</html>