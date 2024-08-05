<!-- change pass -->
	<%@page import="java.sql.Connection"%>
	<%@page import="com.DB.DBConnect"%>
	<%@page import="com.DAO.*" %>
	<%@page import="com.DAO.UserDAOImpl" %>
	<%@page import="com.DAO.*" %>
	<%@page import="com.entity.*" %>
	<%@page import="com.DB.*" %>

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
					background: url("img/back.jpg");
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


			<div class="container mt-3">
				<div class="row">
					<div class=" col-md-4 offset-md-4">
						<div class="card">
							<div class="card-body">
								<div class="text-center">
									<h4>Change Password</h4>

									<c:if test="${not empty succMsg }">
										<p class="text-center text-success">${succMsg }</p>
										<c:remove var="succMsg" scope="session" />
									</c:if>

									<c:if test="${not empty errMsg }">
										<p class="text-center text-danger">${errMsg }</p>
										<c:remove var="errMsg" scope="session" />
									</c:if>

								</div>

								<!--fatching data form database   -->
								<%
								int id=Integer.parseInt(request.getParameter("id"));
								UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
								User_Details b= dao.getUserById(id);
								
							%>


							<form action="changePass" method="post">

								<div class="form-group">
									<label>Password</label>
									<input type="password" name="password" class="form-control" placeholder="enter password">
									<label>Repeat Password</label>
									<input type="password" name="repeatpassword" class="form-control" placeholder="repeat password">
									
									<input type="hidden" name="id" value="<%=b.getId() %>">

								</div>


								
								<button type="submit" class="btn btn-primary" name="submit">Submit</button>
							</form>
							<!--  -->

						</div>
					</div>
				</div>


			</div>

		</div>

		
	</body>
	</html>