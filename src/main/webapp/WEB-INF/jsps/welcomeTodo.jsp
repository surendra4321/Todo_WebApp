<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Todos</title>
  <style>
    /* General body styles */
    body {
      margin: 0;
      font-family: 'Arial', sans-serif;
      background: linear-gradient(120deg, #fdfbfb, #ebedee);
      color: #333;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    /* Container styling */
    div {
      width: 90%;
      max-width: 1200px;
      background: #fff;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      border-radius: 10px;
    }

    /* Header styling */
    h1 {
      text-align: center;
      color: #4CAF50;
      font-size: 2rem;
      margin-bottom: 20px;
      text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }

    /* Table styling */
    .table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
      font-size: 1rem;
      text-align: left;
    }

    .table thead {
      background-color: #4CAF50;
      color: white;
    }

    .table th, .table td {
      padding: 12px 15px;
      border: 1px solid #ddd;
    }

    .table tbody tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .table tbody tr:hover {
      background-color: #f1f1f1;
      cursor: pointer;
    }

    .table tbody td {
      color: #555;
    }
  </style>
</head>
<body>
  <div>
    <h1>Your Todos</h1>
    <table class="table">
      <thead>
        <tr>
          <th>Id</th>
          <th>Discription</th>
          <th>Target Date</th>
          <th>Is Done?</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${todos}" var="todo">
          <tr>
            <td>${todo.id}</td>
            <td>${todo.discription}</td>
            <td>${todo.targetDate}</td>
            <td>${todo.done}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</body>
</html>
