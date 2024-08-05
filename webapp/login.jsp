<!-- login.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@page isELIgnored="false"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
		<meta http-equiv="PRAGMA" content="NO-CACHE" />
		<meta http-equiv="EXPIRES" content="0" />
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<%@include file="allComponent/allCss.jsp"%>
	</head>
	<body>
		<%@include file="allComponent/navbar.jsp"%>

		<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	%>
	<!-- khs -->
	<div class="container mt-3">
		<div class="row">
			<div class=" col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<h4>Login</h4>
						</div>

						<!--  -->
						<form action="login" method="post">


							<c:if test="${not empty errMsg }">
								<h5 class="text-center text-danger">${errMsg}</h5>
								<c:remove var="errMsg" scope="session" />
							</c:if>





							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter email"
								name="email" required> <label for="exampleInputEmail1">Password</label>
								<input type="password" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter password" name="password" required>

							</div>



							<button type="submit" class="btn btn-primary" name="submit">Submit</button>
						</form>
						<div class="text-center">
							<a href="register.jsp">Create account</a>
						</div>
						<!--  -->

					</div>
				</div>
			</div>


		</div>

	</div>

	<!-- jfldf -->

</div>

<div class="container-fluid text-center mt-3 "
style="position: fixed; bottom: 0px; background-color: #43454a; color: white; height: 50px">
<p>
	@CopyRight All Right reserved <b>Develop by ABHIJIT KUMAR</b>
</p>

</div>

<!-- Footer -->
</body>
</html>