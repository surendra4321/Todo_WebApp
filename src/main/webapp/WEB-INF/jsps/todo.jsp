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

.container {
	text-align: center;
	background: rgba(255, 255, 255, 0.2);
	padding: 30px 40px;
	border-radius: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}

.container h1 {font-size; 2.5rem;
	margin-bottom: 20px;
	text-transform: capitalize;
	color: #fff;
	tesxt-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<div class="container">
		<h1>Enter Todo Details</h1>
		<form:form action="add-todos" method="post" modelAttribute="todo">
				Description: <form:input type="text" path="discription"
				required="required" />
			<form:input type="hidden" path="id" />
			<form:input type="hidden" path="done" />
            <input type="submit" value="Add" />
		</form:form>

		</ul>
	</div>
</body>
</html>