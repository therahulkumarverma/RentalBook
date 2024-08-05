<!-- dashboard.jsp -->
<%
if (session.getAttribute("email") == null) {
	response.sendRedirect("../index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
		<meta http-equiv="PRAGMA" content="NO-CACHE" />
		<meta http-equiv="EXPIRES" content="0" />
		<meta charset="ISO-8859-1">
		<title>Admin: Home</title>
		<%@include file="allCss.jsp"%>

		<style>
			a {
				text-decoration: none;
				color: black;
			}

			a:hover {
				text-decoration: none;
				color: black;
			}
		</style>
	</head>
	<body>
		<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	%>
	<%@include file="navbar.jsp"%>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<table>
	<tr>
		<div class="container">
			<div class="row p-3">
				<div class="col-md-3">

					<a href="showCategory.jsp">
						<div class="card">
							<div class="card-body text-center text-secondary mt-3">

								<i class="fa-solid fa-square-plus fa-3x "></i>
								<h3>Add Category</h3>
								-----------

							</div>
						</a>

					</div>


				</div>
				<div class="col-md-3">
					<a href="showBooks.jsp">

						<div class="card">
							<div class="card-body text-center text-primary mt-3">

								<i class="fa-solid fa-book fa-3x "></i>
								<h3>Add Books</h3>
								-----------

							</div>
						</a>

					</div>


				</div>
				<div class="col-md-3">

					<a href="orderStatus.jsp">
						<div class="card">
							<div class="card-body text-center text-success mt-3">

								<i class="fa-solid fa-box-open fa-3x"></i>
								<h3>Order Status</h3>
								-----------

							</div>
						</a>
					</div>



				</div>
				<div class="col-md-3">

					<a href="userInfo.jsp">
						<div class="card">
							<div class="card-body text-center text-danger mt-3">
								<i class="fa-solid fa-users fa-3x"></i>
								<h3>UserInfo</h3>
								-----------

							</div>
						</a>

					</div>
				</tr>
				
				<tr>
					<div class="container">
						<div class="row p-3">
							<div class="col-md-3">

								<a href="message.jsp">
									<div class="card">
										<div class="card-body text-center text-primary mt-3">

											<i class="fa-solid fa-message fa-3x "></i>
											<h3>Messages</h3>
											-----------

										</div>
									</a>

								</div>


							</div>
							<div class="col-md-3">
								<a href="review.jsp">
									<div class="card">
										<div class="card-body text-center text-success mt-3">

											<i class="fa-solid fa-comments fa-3x"></i>
											<h3>Review</h3>
											-----------

										</div>
									</a>


								</div>


							</div>
							<div class="col-md-3">

								<a href="showFaq.jsp">
									<div class="card">
										<div class="card-body text-center text-danger mt-3">

											<i class="fa fa-question fa-3x" aria-hidden="true"></i>
											<h3>FAQ</h3>
											-----------

										</div>
									</a>
								</div>



							</div>
							<div class="col-md-3">

								<a href="dashboard.jsp">
									<div class="card">
										<div class="card-body text-center text-secondary mt-3">
											<i class="fa-solid fa-dashboard fa-3x"></i>
											<h3>Dashboard</h3>
											-----------

										</div>
									</a>

								</div>
							</tr>
							
						</table>
						<div style="width: 120%; margin-top: 310px;"><%@include
							file="footer.jsp"%></div>


						</body>
						</html>