<!-- showbooks.jsp -->
<%
if(session.getAttribute("email")==null)
{
	response.sendRedirect("../index.jsp");
}
%>

<%@ page import="java.util.*" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Details" %>
<%@page import="com.Admin.servlet.Add_Books" %>

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
			<div><b>
				<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg }</p>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty errMsg }">
					<p class="text-center text-danger">${errMsg }</p>
					<c:remove var="errMsg" scope="session" />
				</c:if>
			</b></div>

			<div class="text-center">
				
				<a class="btn btn-primary" href="addBooks.jsp">AddBooks</a>
				
			</div>
		</div>
		<table class="table" border="3px"  >
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Category</th>
				<th scope="col">Name</th>
				<th scope="col">Image</th>
				<th scope="col">Author</th>
				<th scope="col">Publication</th>
				<th scope="col">Price</th>
				<th scope="col">Pub_year</th>
				<th scope="col">Pages</th>
				<th scope="col">ISBN</th>
				<th scope="col">Status</th>
				<th scope="col">Seller</th>
				<th scope="col" colspan="2">Action</th>
			</tr>
			
			<tbody>
				<%
				BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
				List<Book_Details> list =dao.getAllBooks();
				int  count=0;
				for(Book_Details b: list)
				{
					count++;
				%>
				<tr>
					<td><b><%=b.getBook_id() %></b></td>
					<td><%=b.getCategory() %></td>
					<td><%=b.getName()%></td>
					<td><img src="../img/<%=b.getImage()%>" style="width :50px; hight:50px;"></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPublication() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPublication_year() %></td>
					<td><%=b.getPages() %></td>
					<td><%=b.getIsbn() %></td>
					<td><%=b.getStatus() %></td>
					<td> <%=b.getSeller() %></td>
					<td><b><a class="btn btn-primary" href="editBooks.jsp?id=<%=b.getBook_id()%>">Edit</a>&nbsp</td>
						<td><a class="btn btn-danger" href="../deleteBooks?id=<%=b.getBook_id() %>">Delete</a></b><td>
							
						</tr>
						
						<% 
					}
					
					if(count==0)
					{
					%>
					<tr>
						<td colspan="13" class="text-center"><b class="text-danger">Sorry No record found..</b></td>
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