<!-- message.jsp -->
<%@ page import="java.util.*"%>
<%@ page import="com.entity.Message_Details"%>
<%@page import="com.DAO.MessageDAO"%>
<%@page import="com.DAO.MessageDAOImpl"%>
<%@ page import="com.DB.*"%>

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
				<button class="btn btn-success">Questioneries
				</div>
				<c:if test="${not empty succMsg }">
					<p class="text-center text-success"><b>${succMsg }</b></p>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty errMsg }">
					<p class="text-center text-danger"><b>${errMsg }</b></p>
					<c:remove var="errMsg" scope="session" />
				</c:if>
			</div>
			<table class="table" border="3px">
				<thead class="thead-light 3x">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>


						<th scope="col">Email</th>


						<th scope="col">Message</th>
						<th scope="col">Action</th>

					</tr>
				</thead>
				<tbody>

					<%
					MessageDAOImpl dao = new MessageDAOImpl(DBConnect.getConn());
					List<Message_Details> list = dao.getAllMessage();
					int count=0;
					for (Message_Details m : list) {
						count++;
					%>
					<tr>
						<th><%=m.getId() %></th>
						<th ><%=m.getName() %></th>
						<td><%=m.getEmail() %></td>
						<td><%=m.getMessage() %></td>
						<td><a class="btn btn-danger" href="../deleteMessage?id=<%=m.getId() %>">Delete</a></td>
						
					</tr>

					<%
				}
				if(count==0)
				{
				%>
				<tr>
					<td colspan="5" class="text-center"><b class="text-danger">Sorry No record found..</b></td>
				</tr>
				<% 
			}
		%>



	</tbody>
</table>


</body>
</html>