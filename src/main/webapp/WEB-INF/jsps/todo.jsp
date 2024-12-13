<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Todo Page</title>
<style>
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

header {
    background: linear-gradient(120deg, #4CAF50, #3b8d40);
    color: white;
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
}

/* Branding text styling */
header div {
    font-size: 1.8rem;
    font-weight: bold;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

/* Navigation list styling */
header .navbar-nav {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    gap: 15px;
}

/* Navigation links styling */
header .nav-link {
    color: white;
    text-decoration: none;
    font-size: 1rem;
    padding: 8px 15px;
    border-radius: 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

header .nav-link:hover {
    background-color: rgba(255, 255, 255, 0.2);
    color: #ffeb3b;
}

/* Responsive behavior */
@media (max-width: 768px) {
    header {
        flex-direction: column;
        align-items: flex-start;
        padding: 10px;
    }

    header .navbar-nav {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }

    header div {
        margin-bottom: 10px;
    }
}

.container {
	text-align: center;
	background: rgba(255, 255, 255, 0.3);
	padding: 20px 30px;
	border-radius: 10px;
	box-shadow: 0 6px 25px rgba(0, 0, 0, 0.4);
	margin-top: 100px;
	width: 90%;
	max-width: 500px;
}

.container h1 {
	font-size: 1.8rem;
	margin-bottom: 15px;
	text-transform: capitalize;
	color: #fff;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
}

input[type="text"], input[type="submit"] {
	width: calc(100% - 20px);
	padding: 8px;
	margin: 8px 0;
	border-radius: 8px;
	border: none;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
	font-size: 0.9rem;
}

input[type="submit"] {
	background: #4CAF50;
	color: white;
	cursor: pointer;
	transition: all 0.3s ease;
}

input[type="submit"]:hover {
	background: #45a049;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
}

fieldset {
	margin: 10px 0;
	border: none;
	padding: 0;
}

form label {
	display: block;
	margin-bottom: 5px;
	color: #fff;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
	font-weight: bold;
}

form .text-warning {
	color: #ffcc00;
	font-size: 0.8rem;
}

footer {
	margin-top: 20px;
	text-align: center;
	font-size: 0.8rem;
	color: rgba(255, 255, 255, 0.8);
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
	</header>
	<div class="container">
		<h1>Enter Todo Details</h1>
		<ul>
			<form:form action="add-todos" method="post" modelAttribute="todo">
				Description: <form:input type="text" path="discription"
					required="required" />
				<form:input type="hidden" path="id" />
				<form:input type="hidden" path="done" />
				<input type="submit" value="Add" />
			</form:form>
		</ul>
	</div>
	<h2>Current Todos</h2>
	<div class="container">

		<h1>Enter Todo Details</h1>

		<form:form action="update" method="post" modelAttribute="todo">
			<fieldset class="mb-3">
				<form:label path="discription">Description</form:label>
				<form:input type="text" path="discription" required="required" />
				<form:errors path="discription" cssClass="text-warning" />
			</fieldset>
			<fieldset class="mb-3">
				<form:label path="targetDate">Target Date</form:label>
				<form:input type="text" path="targetDate" required="required" />
				<form:errors path="targetDate" cssClass="text-warning" />
			</fieldset>
			<form:input type="hidden" path="id" />
			<form:input type="hidden" path="done" />
			<input type="hidden" name="_method" value="PUT" />
			<input type="submit" class="btn btn-success" />

		</form:form>

	</div>
	<script type="text/javascript">
		$('#targetDate').datepicker({
			format : 'yyyy-mm-dd'
		});
	</script>
</body>
</html>
