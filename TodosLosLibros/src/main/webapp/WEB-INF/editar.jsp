<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Reading books</title>
	</head>
	<body>
		<h1>
			Editar libro
		</h1>
		<form:form method="POST" action="/books/${book.id}/editar" modelAttribute= "book">
			<input type="hidden" name="_method" value="PUT">
			<div>
				<form:label  path= "title" for="title">
					title:
				</form:label>
				<form:input path="title" type="text" name="title" id="titlee" />
				<form:errors path="title" />
			</div>
			<div>
				<form:label  path= "description" for="description">
					description:
				</form:label>
				<form:input path="description" type="text" name="description" id="description" />
				<form:errors path="description" />
			</div>
			<div>
				<form:label  path= "language" for="language">
					language:
				</form:label>
				<form:input path="language" type="text" name="language" id="language" />
				<form:errors path="language" />
			</div>
			<div>
				<form:label  path= "numberOfPages" for="numberOfPages">
					numberOfPages:
				</form:label>
				<form:input path="numberOfPages" type="number" name="numberOfPages" id="numberOfPages"  />
				<form:errors path="numberOfPages" />
			</div>
			<button type="submit">
				Save
			</button>
		</form:form>
	
	</body>
</html>