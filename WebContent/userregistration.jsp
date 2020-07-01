<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>




<style>
input[type=text], select ,input[type=number],input[type=password]{
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





<form method="post" action ="Register">
<div>
<h1>Register</h1>
<br><b>Name:</b><br><input type="text" name = "name" placeholder = "name" required><br>
<br><b>Email:</b><br><input type="text" name = "email" placeholder = "enter email" required> <br>
<br><b>Phone Number:</b><br><input type="number" name = "phoneNumber" placeholder = "phone number" required> <br>
<br><b>Password:</b><br><input type="password" name = "password" placeholder = "password" required> <br>

<input type="submit" value="REGISTER">
<a href="index.jsp"><input type="button" value="CANCEL" class="box"></a>

</div>
</form>

</body>
</html>