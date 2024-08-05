<!-- register.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" /> <meta http-equiv="PRAGMA" content="NO-CACHE" />
		<meta http-equiv="EXPIRES" content="0" />
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
								<h4>Registration</h4>

								<c:if test="${not empty succMsg }">
									<p class="text-center text-success">${succMsg }</p>
									<c:remove var="succMsg" scope="session" />
								</c:if>

								<c:if test="${not empty errMsg }">
									<p class="text-center text-danger">${errMsg }</p>
									<c:remove var="errMsg" scope="session" />
								</c:if>

							</div>

							<!--  -->


							<form action="register" method="post">

								<div class="form-group">
									<label for="">Name</label> 
									<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name"
									name="name" required>
									<label for="exampleInputEmail1">Email address</label> 
									<input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" name="email" required> 
									<label
									for="exampleInputEmail1">Phone</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter phone"
									name="phone" required> 
									<label for="exampleInputEmail1">City</label>
									<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Address"
									name="address" required>
									<label for="exampleInputEmail1">
									DOB</label> 
									<input type="date" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="select dob" name="dob" required>
									<label>Gender</label>
									<select name="gender" class="form-control"
									value="<?php echo $gender; ?>" name="gender" required>
									<option>Male</option>
									<option>Female</option>
								</select>
								<label for="exampleInputEmail1">Password</label> <input
								type="password" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter password"
								name="password" required>
								<label for="exampleInputEmail1">Confirm
								Password</label>
								<input type="password" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Confirm password" name="password" required>


							</div>


							<div class="form-check">
								<input type="checkbox" class="form-check-input"
								id="exampleCheck1" name="check"> <label
								class="form-check-label" for="exampleCheck1">Terms &
							Condition</label>
						</div>
						<button type="submit" class="btn btn-primary" name="submit">Submit</button>
					</form>
					<!--  -->

				</div>
			</div>
		</div>


	</div>

</div>

<!-- jfldf -->
<%@include file="allComponent/footer.jsp"%>
</body>
</html>