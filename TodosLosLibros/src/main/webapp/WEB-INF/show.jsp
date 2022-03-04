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
		<div class="container">
			<h1>
				<c:out value = "${libro.getTitle()}"></c:out>
			</h1>
			<div>
			<ul>
				<li>
					<c:out value ="${libro.getDescription()}"/>
				</li>
				<li>
					<c:out value ="${libro.getLanguage()}"/>
				</li>
				<li>
					<c:out value ="${libro.getNumberOfPages()}"/>
				</li>
					<form action="/books/${libro.getId()}/edicion">
						<button type="submit">
							Editar
						</button>
					</form>
					
				</li>
		</ul>
			</div>
		</div>
	
	</body>
</html>