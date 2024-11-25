<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
Welcome to the login page!
<pre>${errorMessage}</pre>
</head>
<body>
<img alt="welcome" src="images/911335.jpg" width="100px", height="100px">
   <form  method="post">
        Name :  <input  type="text"  name="name"> 
          Password :<input type="password" name="password">
          <input type = "submit">
          </form> 
          <script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
		<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>