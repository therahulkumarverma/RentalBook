<!-- editcategory.jsp -->
<%@ page import="java.util.*"%>
<%@ page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Category_Details"%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin: Edit Category</title>
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
								<h4>Edit Category</h4>
								<c:if test="${not empty succMsg }">
									<p class="text-center text-success">${succMsg }</p>
									<c:remove var="succMsg" scope="session" />
								</c:if>

								<c:if test="${not empty errMsg }">
									<p class="text-center text-danger">${errMsg }</p>
									<c:remove var="errMsg" scope="session" />
								</c:if>

							</div>

							<!-- fatching data from database  -->
							<%
							int id = Integer.parseInt(request.getParameter("id"));
							CategoryDAOImpl dao = new CategoryDAOImpl(DBConnect.getConn());
							Category_Details c = dao.getCategoryById(id);
						%>


						<form action="../editCategory" method="get">

							<div class="form-group">
								<input type="text" name="category_id"
								value="<%=c.getCategory_id()%>"> <label for="">Category
								Name</label> <input type="text" name="categoryname"
								value="<%=c.getCategoryname()%>"
								form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter name"
								name="name" required><br>
								<button type="submit" class="btn btn-primary" name="submit">Update</button>
							</form>


						</div>
					</div>
				</div>


			</div>

		</div>

	</table>

	<div style="width: 120%; margin-top: 290px;"><%@include
		file="footer.jsp"%></div>
	</body>
	</html>