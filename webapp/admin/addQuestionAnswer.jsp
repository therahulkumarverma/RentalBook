<!-- addQuestionanswer.jsp -->
<%@ page import="java.util.*"%>
<%@ page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Category_Details"%>


<%
if (session.getAttribute("email") == null) {
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
		</style>
	</head>
	<body>
		<%@include file="navbar.jsp"%>
		<table>

			<div class="container mt-3">
				<div class="row">
					<div class=" col-md-4 offset-md-4">
						<div class="card">
							<div class="card-body">
								<div class="text-center">
									<h4>Add FAQ</h4>

									<c:if test="${not empty succMsg }">
										<p class="text-center text-success">${succMsg }</p>
										<c:remove var="succMsg" scope="session" />
									</c:if>

									<c:if test="${not empty errMsg }">
										<p class="text-center text-danger">${errMsg }</p>
										<c:remove var="errMsg" scope="session" />
									</c:if>

								</div>

								<!--  -->


								<form action="../addFaq" method="post">

									<div class="form-group">

									</select> <label for="textarea">Question</label>
									<textarea name="question" class="form-control"></textarea>
								</select> <label for="textarea">Answer</label>
								<textarea name="answer" class="form-control"></textarea>





								<button type="submit" class="btn btn-primary" name="submit">Submit</button>
							</form>


						</div>
					</div>
				</div>


			</div>

		</div>

	</table>

</body>
</html>