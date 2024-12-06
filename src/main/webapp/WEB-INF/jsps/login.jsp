<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp') no-repeat center center fixed;
      background-size: cover;
    }

    .login-container {
      background: rgba(255, 255, 255, 0.8);
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      max-width: 400px;
      width: 100%;
      text-align: center;
    }

    .login-container h1 {
      margin-bottom: 20px;
      font-size: 24px;
      color: #333;
    }

    .login-container input[type="text"],
    .login-container input[type="password"] {
      width: calc(100% - 20px);
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    .login-container input[type="submit"] {
      background-color: #007BFF;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .login-container input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h1>Welcome to the Login Page</h1>
    <form action="log" method="post">
      <input type="text" name="name" placeholder="Name">
      <input type="password" name="password" placeholder="Password">
      <input type="submit" value="Login">
    </form>
  </div>
</body>
</html>
