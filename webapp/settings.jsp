<!-- settings.jsp -->
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
				background: url("img/back.jpg");
				height: 50vh;
				width: 100%;
				background-repeat: no-repeat;
				background-size: cover;
			}

			.crd-ho:hover {
				background-color: #d9dedb;
			}

			aside {
				width: 30%;
				padding-left: 15px;
				float: left;
				font-style: italic;
				background-color: lightgray;
			}

			aside1 {
				width: 68%;
				float: right;
				margin-top: 10px;
			}
		</style>


	</head>
	<body style="background-color: #edf2ef">
		<%@include file="allComponent/navbar.jsp"%>

		<c:if test="${empty userobj}">
			<c:redirect url="/index.jsp" />
		</c:if>

		<c:if test="${!empty userobj}">
			<c:if test="${not empty succMsg }">
				<p class="text-center text-success">
					<b>${succMsg }</b>
				</p>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<c:if test="${not empty errMsg }">
				<p class="text-center text-danger">
					<b>${errMsg }</b>
				</p>
				<c:remove var="errMsg" scope="session" />
			</c:if>
			<div>
				<aside>

					<table class="table" border="4px"
					style="margin-top: 30px; width: 30%; position: justify; margin-left: 30px;">
					<tr>
						<th colspan="8" class="text-center">Welcome- ${userobj.name }</th>
					</tr>

					<tr>
						<td><b>ID</b></td>
						<td>${userobj.id }</td>
					</tr>
					<tr>
						<td><b>Name</b></td>
						<td>${userobj.name }</td>
					</tr>
					<tr>
						<td><b>Email</b></td>
						<td>${userobj.email }</td>
					</tr>
					<tr>
						<td><b>Phone</b></td>
						<td>${userobj.phone }</td>
					</tr>
					<tr>
						<td><b>Address</b></td>
						<td>${userobj.address }</td>
					</tr>
					<tr>
						<td><b>Gender</b></td>
						<td>${userobj.gender }</td>
					</tr>
					<tr>
						<td><b>DOB</b></td>
						<td>${userobj.dob }</td>
					</tr>
					<tr>
						<b><td colspan="2"><a
							href="editYourProfile.jsp?id=${userobj.id }"
							class="btn btn-primary">Update Profile</a></b>
						</td>
					</tr>

				</table>
			</aside>
			<aside1>

				<h4 align="center">
					<a href="changePass.jsp?id=${userobj.id }" class="btn btn-secondary">Change
					Password</a>&nbsp;&nbsp;
					
					<a href="orderstatus.jsp" class="btn btn-success">Your Orders</a>
				</h4>
				<h4 align="center">
					
				</h4>
			</aside1>




		</div>

	</c:if>






</body>
</html>