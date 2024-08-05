<!-- review.jsp -->
<%
if(session.getAttribute("email")==null)
{
	response.sendRedirect("../index.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@page isELIgnored="false"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Admin: Add Book</title>
		<%@include file="allCss.jsp"%>

		<style>
			a {
				text-decoration: none;
				color: none;
			}
		</style>
	</head>
	<body>
		<%@include file="navbar.jsp"%>

		<div class="container mt-3 mb-3">

			<div class="text-center">
				<button class="btn btn-success">Users Review Table
				</div>
			</div>
			<table class="table">
				<thead class="thead-light 3x">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>


						<th scope="col">Email</th>


						<th scope="col">Message</th>
						<th scope="col">Date</th>
						<th scope="col">Action</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						
					</tr>

				</tbody>
			</table>


		</body>
		</html>