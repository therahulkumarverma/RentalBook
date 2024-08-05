<!-- editbooks.jsp -->
<%@ page import="java.util.*" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Details" %>
<%@page import="com.Admin.servlet.Add_Books" %>
<%@ page import="java.util.*" %>
<%@ page import="com.DAO.CategoryDAOImpl" %>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Category_Details" %>
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
		<title>Admin: Edit Book Details</title>
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
									<h4>Edit Books Details</h4>

									<c:if test="${not empty succMsg }">
										<p class="text-center text-success">${succMsg }</p>
										<c:remove var="succMsg" scope="session" />
									</c:if>

									<c:if test="${not empty errMsg }">
										<p class="text-center text-danger">${errMsg }</p>
										<c:remove var="errMsg" scope="session" />
									</c:if>

								</div>

								<!-- fetching data from databases -->
								<%
								int id=Integer.parseInt(request.getParameter("id"));
								BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
								Book_Details b= dao.getBookById(id);
								
							%>
							

							<form action="../editBooks" method="post">

								<div class="form-group">
									
									<label>Select Category</label> <select name="category"
									class="form-control" value="<%=b.getCategory() %>" name="category" required>

									<%
									CategoryDAOImpl da = new CategoryDAOImpl(DBConnect.getConn());
									List<Category_Details> li = da.getAllCategory();
									for (Category_Details c : li) {
									%>


									<option > <%=c.getCategoryname()%></option>

									<%
								}
							%>
							<!--  <option>Science</option>-->

						</select> 
								<label for="">Book Name</label> 
								<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter name"
								name="name" value="<%=b.getName() %>" required><br> 
								
								<label for="">AuthorName</label> 
								<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter name" name="author" value="<%=b.getAuthor() %>" required><br>
								<label for="">Publication</label> 
								<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter name"
								name="publication"  value="<%=b.getPublication() %>" required><br> 
								<label for="">Price</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter name"
								name="price"value="<%=b.getPrice() %>" required><br>
								<label for="">Publication Year</label>
								<input type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter name" name="publish_year" value="<%=b.getPublication_year() %>" required><br>
								<label for="">Pages</label> 
								<input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter name"
								name="pages" value="<%=b.getPages() %>" required><br>
								<label for="">ISBN</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter name"
								name="isbn" value="<%=b.getIsbn() %>"required><br>
								<label>Status</label>
								<select name="status"
								class="form-control" value="<%=b.getStatus() %>" name="status" required>
								<option>Active</option>
								<option>Unavailable</option>
							</select>
							<input type="hidden" id="thisField" name="seller" value="<%=b.getSeller() %>"}">
							
							<div class="form-group">
								
								
								<input type="hidden" name="id" value="<%=b.getBook_id()%>" class="form-control">




								<button type="submit" class="btn btn-primary" name="submit">Update </button>
							</form>


						</div>
					</div>
				</div>


			</div>

		</div>

	</table>
	<div style="width: 120%;"><%@include file="footer.jsp"%></div>

</body>
</html>