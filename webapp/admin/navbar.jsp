<!-- navbar.jsp -->
<html>
<head>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@page isELIgnored="false"%>
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
		<meta http-equiv="PRAGMA" content="NO-CACHE" />
		<meta http-equiv="EXPIRES" content="0" />
	</head>
	<body>
		<div class="container-fluid"
		style="height: 10px; background-color: #303f9f"></div>



		<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa-solid fa-house ml-3 "></i> Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
						href="showCategory.jsp"><i class="fa-solid fa-square-plus"></i>
						AddCategory <span class="sr-only">(current)</span> </a></li>
						<li class="nav-item active"><a class="nav-link"
						href="showBooks.jsp"><i class="fa-solid fa-square-plus"></i>
						AddBooks <span class="sr-only">(current)</span> </a></li>
						<li class="nav-item active"><a class="nav-link"
						href="orderStatus.jsp"><i class="fa-solid fa-box-open "></i>
						OrderStatus <span class="sr-only">(current)</span> </a></li>
						<li class="nav-item active"><a class="nav-link"
						href="userInfo.jsp"><i class="fa-solid fa-users "></i>
						UserInfo <span class="sr-only">(current)</span> </a></li>
					
					
					
						<li class="nav-item active"><a class="nav-link"
							href="message.jsp"><i class="fa-solid fa-message"></i> Message
							<span class="sr-only">(current)</span> </a></li>
							<li class="nav-item active"><a class="nav-link" href="faq.jsp"><i
								class="fa fa-question"></i> FAQs<span
								class="sr-only">(current)</span> </a></li>
								<li class="nav-item active"><a class="nav-link"
						href="review.jsp"><i class="fa-solid fa-comments"></i>
						Review <span class="sr-only">(current)</span> </a></li>




								<li style="margin-left:400px;">

									
									<c:if test="${not empty userobj}">
										<button class="btn btn-success"><i class="fa-solid fa-user"></i> ${userobj.name }</button>
										&nbsp;
										

									</li>
									<li style="margin-left:50px">
										<form action="../logout">
											<%
											response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
											response.setHeader("Pragma", "no-cache");
											response.setHeader("Expires", "0");
										%>
										<input type="submit" value="Logout"
										class="btn btn-primary" />
									</c:if>

								</form>
								
							</li>


						</ul>

					</div>
				</nav>

				<!-- logout modal -->
			</body>
			</html>
