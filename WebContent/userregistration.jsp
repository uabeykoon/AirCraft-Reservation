<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style> 
.textbox { 
    background: transparent url(http://html-generator.weebly.com/files/theme/input-text-8.png) repeat-x; 
    border: 1px solid #999; 
    outline:0; 
    height:25px; 
    width: 275px;
    color:green; 
  } 
   
  .box{
    background: transparent url(http://html-generator.weebly.com/files/theme/input-text-8.png) repeat-x;
    border: 1px solid #999; 
    outline:0; 
    height:25px; 
    width: 75px; 
    color:green;
  }
div {
    padding: 50px;
    border: 2px solid green;
	width: 450px;
    height:500px;
 	
    margin-right: 25px;
    margin-left: 50px;
    
    font-family:verdana;
    font-size:100%;
}
</style> 
</head>
<body>


<form method="post" action ="Register">
<h2><a href="index.jsp">Back</a></h2>
<div>
<br><b>Name:</b><br><input class="textbox"type="text" name = "name" placeholder = "name" required><br>
<br><b>Email:</b><br><input class="textbox"type="text" name = "email" placeholder = "enter email" required> <br>
<br><b>Phone Number:</b><br><input class="textbox"type="number" name = "phoneNumber" placeholder = "phone number" required> <br>
<br><b>Password:</b><br><input class="textbox"type="text" name = "password" placeholder = "password" required> <br>

<input type="submit" value="REGISTER" class="box">
<a href="index.jsp"><input type="button" value="CANCEL" class="box"></a>

</div>
</form>

</body>
</html>