<!-- userinfo.jsp -->
<%
if(session.getAttribute("email")==null)
{
	response.sendRedirect("../index.jsp");
}
%>

<%@ page import="java.util.*"%>
<%@ page import="com.DAO.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User_Details"%>
<%@page import="com.entity.User_Details"%>
<%@page import="com.entity.User_Details"%>



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
				<button class="btn btn-success">User Information Table
				</div>

				<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg }</p>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty errMsg }">
					<p class="text-center text-danger">${errMsg }</p>
					<c:remove var="errMsg" scope="session" />
				</c:if>
			</div>
			<table class="table" border="3px"  >
				<tr class="thead-dark">
					<th scope="col">ID</th>
					<th scope="col">Name</th>

					
					<th scope="col">Email</th>
					<th scope="col">Phone</th>

					<th scope="col">Address</th>
					<th scope="col">DOB</th>
					<th scope="col">Gender</th>
					<th scope="col">Password</th>

					<th scope="col" colspan="3">Action</th>

				</tr>
				
				<tbody>
					<%
					UserDAOImpl dao= new UserDAOImpl(DBConnect.getConn());
					List<User_Details> list =dao.getAllUsers();
					int  count=0;
					for(User_Details u: list)
					{
						count++;
					%>
					<tr>
						<td><b><%=u.getId() %></b></td>
						<td><%=u.getName() %></td>
						<td><%=u.getEmail()%></td>
						<td><%=u.getPhone()%></td>
						<td><%=u.getAddress() %></td>
						<td><%=u.getGender() %></td>
						<td><%=u.getDob() %></td>
						<td><%=u.getPassword() %></td>
						
						<td><b><a class="btn btn-primary" href="editUser.jsp?id=<%=u.getId()%>">Edit</a>&nbsp</td>
							<td><a class="btn btn-danger" href="../deleteUser?id=<%=u.getId()%>">Delete</a></b><td>
								
							</tr>
							
							<% 
						}
						
						if(count==0)
						{
						%>
						<tr>
							<td colspan="9" class="text-center"><b class="text-danger">Sorry No record found..</b></td>
						</tr>
						<% 
					}
				%>
				




			</tbody>
		</table>
		<div style="width: 120%; margin-top: 350px;"><%@include
			file="footer.jsp"%></div>
		</body>
		</html>