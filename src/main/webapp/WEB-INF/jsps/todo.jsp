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
		<ul>
		<form:form action="add-todos" method="post" modelAttribute="todo">
				Description: <form:input type="text" path="discription"
				required="required" />
			<form:input type="hidden" path="id"/>
			<form:input type="hidden" path="done"/>
            <input type="submit" value="Add" />
		</form:form>
		</ul>
	</div>
	  <h2>Current Todos</h2>
     <div class="container">
	
	<h1>Enter Todo Details</h1>
	
	<form:form action="update"  method="post" modelAttribute="todo">
		<fieldset class="mb-3">				
			<form:label path="discription">Description</form:label>
			<form:input type="text" path="discription" required="required"/>
			<form:errors path="discription" cssClass="text-warning"/>
		</fieldset>
		<fieldset class="mb-3">				
			<form:label path="targetDate">Target Date</form:label>
			<form:input type="text" path="targetDate" required="required"/>
			<form:errors path="targetDate" cssClass="text-warning"/>
		</fieldset>
		<form:input type="hidden" path="id"/>
		<form:input type="hidden" path="done"/>
		<input type="hidden" name="_method" value="PUT" />
		<input type="submit" class="btn btn-success"/>
	
	</form:form>
	
</div>
 <script type="text/javascript">
	$('#targetDate').datepicker({
	    format: 'yyyy-mm-dd'
	});
</script>
 </body>
</html>
 