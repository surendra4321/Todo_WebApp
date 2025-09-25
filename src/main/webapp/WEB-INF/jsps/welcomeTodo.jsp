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
	min-height: 100vh;
}

/* Header styling */
header {
	background: #4CAF50;
	color: white;
	padding: 15px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

header .nav-links a {
	color: white;
	text-decoration: none;
	margin: 0 10px;
	font-size: 1rem;
	transition: color 0.3s ease;
}

header .nav-links a:hover {
	color: #ffeb3b;
}

/* Container styling */
.container {
	width: 90%;
	max-width: 1200px;
	background: #fff;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	border-radius: 10px;
	margin: 30px auto;
}
header {
    background: #4CAF50;
    color: white;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    font-family: 'Arial', sans-serif;
}

/* Branding text styling */
header div {
    font-size: 1.5rem;
    font-weight: bold;
}

/* Navigation container */
header .navbar-collapse {
    display: flex;
    align-items: center;
}

/* Navigation list styling */
header .navbar-nav {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    gap: 20px;
}

/* Navigation links styling */
header .nav-link {
    color: white;
    text-decoration: none;
    font-size: 1rem;
    transition: color 0.3s ease, text-shadow 0.3s ease;
}

header .nav-link:hover {
    color: #ffeb3b;
    text-shadow: 0px 1px 2px rgba(0, 0, 0, 0.5);
}

/* Responsive behavior */
@media (max-width: 768px) {
    header {
        flex-direction: column;
        align-items: flex-start;
    }

    header .navbar-collapse {
        flex-direction: column;
        gap: 10px;
    }

    header .navbar-nav {
        flex-direction: column;
        gap: 10px;
    }
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

/* Button styling */
.btn {
	text-decoration: none;
	padding: 8px 12px;
	color: #fff;
	border-radius: 5px;
	font-size: 0.9rem;
	transition: background 0.3s ease;
}

.btn-warning {
	background-color: #ff9800;
}

.btn-warning:hover {
	background-color: #e68a00;
}

.btn-success {
	background-color: #4CAF50;
}

.btn-success:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<header>
		<div>Todo Application</div>
		 
	<div class="collapse navbar-collapse">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="/welcomeTodo">Todos</a></li>
		</ul>
	</div>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
	</ul>	
</nav>
	</header>

	<div class="container">
		<h1>Your Todos</h1>
		<h3 style="color: red;">${msg}</h3>
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>Description</th>
					<th>Target Date</th>
					<th>Is Done?</th>
					<th>Delete Todo</th>
					<th>Update Todo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${todos}" var="todo">
					<tr>
						<td>${todo.id}</td>
						<td>${todo.discription}</td>
						<td>${todo.targetDate}</td>
						<td>${todo.done}</td>
						<td><a href="delete-todo?id=${todo.id}"
							class="btn btn-warning">Delete</a></td>
						<td><a href="update-todo?id=${todo.id}"
							class="btn btn-success">Update</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="add-todo" class="btn btn-success">Add Todo</a>
	</div>

</body>
</html>
