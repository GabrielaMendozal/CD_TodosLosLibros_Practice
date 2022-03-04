<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     pageEncoding="ISO-8859-1"%>
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
				<div class="d-flex justify-content-between align-items-center pb-4">
					<h3>All Books</h3>
					<div>
						<a href="/registro" class="btn btn-primary">New Book</a>
					</div>
				</div>
				
				<div class="table-responsive">
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col">Id</th>
					      <th scope="col">Title</th>
					      <th scope="col">Language</th>
					      <th scope="col"># Pages</th>
					      <th scope="col">Actions</th>
					    </tr>
					  </thead>
					  <tbody>
						  <c:forEach var="book" items="${listaBooks}">
							<tr>
						      <th scope="row">${book.id}</th>
						      <td><a href="/books/${book.id}">${book.title}</a></td>
						      <td>${book.language}</td>
						      <td>${book.numberOfPages}</td>
						      <td>
						      	<div class="d-flex justify-content-between align-items-center">
							      	<a href="/books/${book.id}/edicion">Edit</a>
								      <form action="/eliminar/${book.id}" method="post">
								      	<input type="hidden" name="_method" value="DELETE">
								      	<button type="submit" class="btn btn-default link">Delete</button>
								      </form>
						      	</div>
						      </td>
						    </tr>
						</c:forEach>
					  </tbody>
					</table>
				</div>
				
			</div>
	
	</body>
</html>