<!-- message.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<%@include file="allComponent/allCss.jsp"%>
	</head>
	<body>
		<%@include file="allComponent/navbar.jsp"%>
		<!-- khs -->
		<div class="container mt-3">
			<div class="row">
				<div class=" col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<h4>ContactUs</h4>
								<c:if test="${not empty succMsg }">
									<p class="text-center text-success"><b>${succMsg }</b></p>
									<c:remove var="succMsg" scope="session" />
								</c:if>

								<c:if test="${not empty errMsg }">
									<p class="text-center text-danger"><b>${errMsg }</b></p>
									<c:remove var="errMsg" scope="session" />
								</c:if>
								
							</div>

							<!--  -->
							<form action="contectServlet" method="post">

								<div class="form-group">
									<label for="exampleInputEmail1">Name</label>
									<input type="text" name="name"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
									<label for="exampleInputEmail1">Email</label> 
									<input
									type="email"  name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
									<label for="textarea">Message</label>
									<textarea name="message" class="form-control"></textarea>
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>



							</form>
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