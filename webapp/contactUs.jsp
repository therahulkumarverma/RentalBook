	<!-- contactUs.jsp -->
	<%@page import="java.sql.Connection"%>
	<%@page import="com.DB.DBConnect"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
		<!DOCTYPE html>
		<html>
		<head>
			<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
			<meta http-equiv="PRAGMA" content="NO-CACHE" />
			<meta http-equiv="EXPIRES" content="0" />
			<meta charset="ISO-8859-1">
			<title>RentalBook</title>

			<%@include file="allComponent/allCss.jsp"%>
			<style type="text/css">
				.back-img {
					background: url("img/1back.jpg");
					height: 50vh;
					width: 100%;
					background-repeat: no-repeat;
					background-size: cover;
				}

				.crd-ho:hover {
					background-color: #d9dedb;
				}
			</style>
		</head>
		<body style="background-color: #edf2ef">
			<%@include file="allComponent/navbar.jsp"%>
			<!--  <div class="container-fluid back-img"></div>-->
			<!-- add maven  mysql 8.0.27 connector dependencies to find output of this code to printed on the webpage-->
			<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
		%>
		
		<div class="container  "  style="margin-left:33px;margin-right:30px;margin-top:30px;">
			
			<div class="row">
				<div class="col-md-4 ">
					<div class="card body" >
						<div class="card">
							<div class="text-center" style="margin-top:20px; margin-bottom:20px;">
								<h4>Contact US At</h4><br>
								<p><b><i class="fas fa-phone"> </i>
								</b>9958728602</p>
								<p><b><i class="fa fa-envelope" aria-hidden="true"></i> </b>abhijitbooks@gmail.com</p>
								<p><i class="fa fa-address-card " aria-hidden="true"></i>
								J-18, Sector-58,Noida</p>
								<p>Uttar Pradesh, Pin-201301</p>
								<p><b>
									<a href="#"><i class='fab fa-whatsapp-square' style='font-size:30px;color:blue'></i>
									</a>   
									<a href="#"><i class="fa fa-envelope fa-2x" aria-hidden="true"></i>
									</a>
									<a href="#"><i class='fab fa-facebook-square' style='font-size:30px;color:blue'></i></a>
									<a href="#"> <i class='fab fa-facebook-messenger' style='font-size:30px;color:blue'></i></a>
									
								</b></p>
							</div>
						</div>
						
					</div>
				</div>
				<div class=" col-md-4 offset-md-3 ">
					
					<div class="card">
						
						<div class="card-body">
							<div class="text-center">
								<h4>Write Here</h4>
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
							

						</div>
						
					</div>
					
				</div>
				

			</div>
			
			
			
		</div>


		


	</body>
	</html>