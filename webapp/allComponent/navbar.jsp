<!-- navbar.jsp -->
<%@ page import="java.util.*"%>
<%@ page import="com.DAO.CategoryDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Category_Details"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<%@page isELIgnored="false"%>
	
	<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-3 text-success">
				<h3>
					<i class="fas fa-book"></i> <a href="index.jsp">RentalBook</a>
				</h3>
			</div>
			<div class="col-md-5">
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
					<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
				</form>

			</div>
			<c:if test="${(empty userobj) or (userobj.email=='admin@gmail.com')}">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i> Login</a>&nbsp; <a
					href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> <i class="fa fa-sign-in"
					aria-hidden="true"></i> Register</a>
				</c:if>


				<c:if
				test="${(not empty userobj) and (userobj.email !='admin@gmail.com')}">

				<button class="btn btn-secondary">
					<i class="fa-solid fa-user"></i> ${userobj.name}
				</button>&nbsp;&nbsp;
				<button class="btn btn-success">
					<i class="fa fa-wrench" aria-hidden="true"></i> <a href="settings.jsp" class="text-white">Setting</a>
				</button>&nbsp;&nbsp;


				<form action="logout">
					<button class="btn btn-secondary">
						<i class="fa-solid fa-right-from-bracket"></i></i><input type="submit"
						value="Logout">
					</button>
				</form>


			</c:if>

		</div>

	</div>

</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
	data-target="#navbarSupportedContent"
	aria-controls="navbarSupportedContent" aria-expanded="false"
	aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
	<ul class="navbar-nav mr-auto">
		<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
			class="fa-solid fa-house ml-3 "></i> Home <span class="sr-only">(current)</span>
		</a></li>
		<li class="nav-item active ml-3"><a class="nav-link"
			href="aboutUs.jsp"> AboutUs</a></li>
			<li class="nav-item active ml-3"><a class="nav-link"
				href="contactUs.jsp"> ContactUs</a></li>


				<li class="nav-item active ml-3"><a class="nav-link"
					href="faq.jsp"><i class="fa fa-question-circle"
					aria-hidden="true"></i> FAQ</a></li>
					<li class="nav-item active ml-3"><a class="nav-link"
						href="review.jsp"><i class="fas fa-comments"></i> Review</a></li>

						<li class="nav-item active dropdown">
							<a class="nav-link dropdown-toggle" href="categoryWiseBookDisplay.jsp" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><i class="fa-solid fa-book"></i>Categories </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<%
								CategoryDAOImpl da = new CategoryDAOImpl(DBConnect.getConn());
								List<Category_Details> li = da.getAllCategory();
								for (Category_Details c : li) {
								%>
								<form action="categoryWiseBook" method="get">

									<a class="dropdown-item" href="categoryWiseBookDisplay.jsp?category=<%=c.getCategoryname()%>"> <%=c.getCategoryname()%></a>

								</form> 
								<%
							}
						%>
					<!--  <a class="dropdown-item" href="#">Self Help</a> <a
						class="dropdown-item" href="#">Biography</a> -->
					</ul>
					<form class="form-inline my-2 my-lg-0">
						<ul class="navbar-nav mr-auto">

						</ul>

						
						<c:if
						test="${(not empty userobj) and (userobj.email !='admin@gmail.com')}">

						<a href="cart.jsp" class="text-white"><b><i
									class="fas fa-cart-plus"></i>Cart</b></a>
					</button> &nbsp;&nbsp;

				</c:if>


			</form>
		</div>
	</nav>