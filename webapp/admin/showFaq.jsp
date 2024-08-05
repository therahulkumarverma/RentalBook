<!-- showfaq.jsp -->
<%@ page import="java.util.*"%>
<%@page import="com.DAO.FaqDAO"%>
<%@ page import="com.entity.*" %>
<%@page import="com.DAO.FaqDAOImpl"%>
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
				<a href="addQuestionAnswer.jsp" class="btn btn-primary"> Add FAQ</a>
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
		<table style="width:80%;margin-left:auto;margin-right:auto;" class="table" border="3px" >
			<thead class="thead-light 3x">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Question</th>


					<th scope="col">Answer</th>


					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>

				<%
				FaqDAOImpl dao = new FaqDAOImpl(DBConnect.getConn());
				List<Faq_Details> list = dao.getAllFaq();
				int count=0;
				for (Faq_Details m : list) {
					count++;
				%>
				<tr>
					<th><%=m.getId() %></th>
					<th ><%=m.getQuestion()%></th>
					<td><%=m.getAnswer() %></td>
					<td><a class="btn btn-danger" href="../deleteFaq?id=<%=m.getId() %>">Delete</a></td>
					
				</tr>

				<%
			}
			if(count==0)
			{
			%>
			<tr>
				<td colspan="4" class="text-center"><b class="text-danger">Sorry No record found..</b></td>
			</tr>
			<% 
		}
	%>



</tbody>
</table>


</body>
</html>