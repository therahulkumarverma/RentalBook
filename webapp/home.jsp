<!--home.jsp -->
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
		<c:if test="${ not empty userobj}">
			<h1>${userobj.name }</h1>
			<h1>${userobj.email }</h1>

		</c:if>


		<%@include file="allComponent/footer.jsp"%>

	</body>
	</html>