<!-- CategoryWiseBookDisplay.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Details"%>
<%@page import="com.entity.User_Details"%>
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

	<%
	User_Details u = (User_Details) session.getAttribute("userobj");
	%>


	<!-- start of books -->
	<%
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	String category = request.getParameter("category");
	List<Book_Details> list = dao.getBookByCategory(category);
	int count = 0;
	%>
	<h3 align="center"><%=category%></h3>
	<%
	for (Book_Details b : list) {
		count++;
	%>
	<div class="container-fluid" style="background-color: #edf2ef;">

		<hr>
		<div class="row text-center">
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="./img/<%=b.getImage()%>"
							style="width: 135px; height: 180px;class="
							img-thumblin"style="width :50px; hight:50px;">
						<p>
							<b><i><%=b.getName()%></i></b>
						</p>
						<p>
							by -<%=b.getAuthor()%></p>
						<p>
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b.getPrice()%></p>
						<div class="row">
							<c:if
								test="${(not empty userobj) and (userobj.email !='admin@gmail.com')}">
								<a href="cart?uid=<%=u.getId()%>&&bid=<%=b.getBook_id()%>"
									class="btn btn-primary btn-sm mr-1 ml-1"><i
									class="fas fa-cart-plus"></i>Add to Cart</a>
							</c:if>
							<c:if test="${empty userobj }">
								<a href="login.jsp" class="btn btn-primary btn-sm mr-1 ml-1"><i
									class="fas fa-cart-plus"></i>Add to Cart</a>
							</c:if>

							<c:if
								test="${(not empty userobj) and (userobj.email !='admin@gmail.com')}">
								<a href="cart?uid=<%=u.getId()%>&&bid=<%=b.getBook_id()%>"
									class="btn btn-danger btn-sm mr-1 ml-1"><i
									class="fas fa-cart-plus"></i>Place Order</a>
							</c:if>
							<c:if test="${empty userobj }">
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1 ml-1">Place Order</a>

							</c:if>


						</div>
					</div>

				</div>


			</div>

			<div class="col-md-6"">
				<div class="card crd-ho">
					<div class="card-body text-center  text-align: justify;">
						<p>
							<b class="text-danger"><i>Specification</i></b>
						</p>
						<p>
							<b>ISBN - </b><%=b.getIsbn()%></p>
						<p>
							<b>Language - </b>Hindi
						</p>
						<p>
							<b>Pages - </b><%=b.getPages()%></p>
						<p>
							<b>Publication - </b><%=b.getPublication()%></p>
						<p>
							<b><i>Status - </i></b>
							<%=b.getStatus()%></p>
						<p>
							<b>Publication Year - </b><%=b.getPublication_year()%></p>
						<p>
							<b><i>Category - </i></b><%=b.getCategory()%></p>




					</div>

				</div>


			</div>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<p>
							<b>Seller - <%=b.getSeller()%></b>
						</p>
						<p>
							To Contact Seller <a href="#">click here</a>
						</p>


						<p class="text-primary">
							<b><i>Rating & Review</i></b>
						</p>
						<button vlaue="post">
							<a href="#">Post Your Question</a>
						</button>


						<p class="text-danger">
							<b><a href="#">4.8 Star</a></b>
						</p>

						<p>
							<i><b>see review</b></i>
						</p>
						<p>
							<b>Amit - </b>Best Book ever i recommend you all to read this.
						</p>
						<p></p>
					</div>
				</div>

			</div>


		</div>


		<%
		}
		if (count == 0) {
		%>
		<h4 class="text-center">
			<b class="text-danger">Sorry No record foun...</b>
		</h4>
		<%
		}
		%>

		<hr>
</body>
</html>