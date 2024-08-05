<!-- showcateory.jsp -->
<%
if(session.getAttribute("email")==null)
{
	response.sendRedirect("../index.jsp");
}
%>
<%@ page import="java.util.*" %>
<%@ page import="com.DAO.CategoryDAOImpl" %>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Category_Details" %>



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
				
				<a class="btn btn-secondary" href="addCategory.jsp">AddCategory</a>
				
				<c:if test="${not empty succMsg }">
					<p class="text-center text-success"><b>${succMsg }</b></p>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty errMsg }">
					<p class="text-center text-danger"><b>${errMsg }</b></p>
					<c:remove var="errMsg" scope="session" />
				</c:if>
				
			</div>
		</div>
		<table style="width:60%" border="3px" align="center" class="table">
			<thead class="thead-dark">
				<tr >
					<th scope="col">ID</th>
					

					<th scope="col">Category</th>

					
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>
				<%
				CategoryDAOImpl dao= new CategoryDAOImpl(DBConnect.getConn());	
				List<Category_Details> list =dao.getAllCategory();
				int count=0;
				for(Category_Details c:list)
				{
					count++;
				%>
				<tr>
					<td><b><%=c.getCategory_id() %></b></td>
					<td><b><%=c.getCategoryname() %></b></td>
					<td><a  class="btn btn-success" href="editCategory.jsp?id=<%= c.getCategory_id() %>">Edit</a>&nbsp;&nbsp;<a class="btn btn-danger" href="../deleteCategory?id=<%=c.getCategory_id() %>">Delete</a></td>
				</tr>
				<%
			}
			if(count==0)
			{
			%>
			<tr>
				<td colspan="3" class="text-center"><b class="text-danger">Sorry No record found..</b></td>
			</tr>
			<% 
		}
		
		
		
	%>
	
</tbody>
</table>
<div style="width:120%;margin-top:350px;"><%@include file="footer.jsp" %></div> 

</body>
</html>