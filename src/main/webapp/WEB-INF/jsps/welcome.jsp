<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome Page</title>
  <style>
    /* General body styles */
    body {
      margin: 0;
      padding: 0;
      font-family: 'Arial', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: linear-gradient(120deg, #84fab0, #8fd3f4);
      color: #fff;
    }

    /* Container styling */
    .container {
      text-align: center;
      background: rgba(255, 255, 255, 0.2);
      padding: 30px 40px;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
    }

    /* Header styling */
    .container h1 {
      font-size: 2.5rem;
      margin-bottom: 20px;
      text-transform: capitalize;
      color: #fff;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }

    /* Link styling */
    .container a {
      display: inline-block;
      margin-top: 15px;
      text-decoration: none;
      font-size: 1.2rem;
      font-weight: bold;
      color: #ffffff;
      padding: 10px 20px;
      border: 2px solid #fff;
      border-radius: 25px;
      transition: all 0.3s ease-in-out;
    }

    /* Link hover effect */
    .container a:hover {
      background-color: #fff;
      color: #8fd3f4;
      border-color: #8fd3f4;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Welcome, ${name}</h1>
    <a href="list-todos">Manage Your Todos</a>
  </div>
</body>
</html>
