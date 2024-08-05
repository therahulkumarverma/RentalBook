<!-- orderstatus.jsp -->
<%@page import="java.util.List"%>

<%@ page import="java.util.*"%>
<%@ page import="com.DAO.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.*"%>
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
	<%
	User_Details u = (User_Details) session.getAttribute("userobj");
	CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
	List<Cart_Details> list = dao.getbookDetailsById(u.getId());
	%>


	<c:if test="${empty userobj}">
		<c:redirect url="/index.jsp" />
	</c:if>

	<c:if test="${!empty userobj}">
		<c:if test="${not empty succMsg }">
			<p class="text-center text-success"><b>${succMsg }</b></p>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty errMsg }">
			<p class="text-center text-danger"><b>${errMsg }</b></p>
			<c:remove var="errMsg" scope="session" />
		</c:if>

             
		<table class="table" border="4px"
			style="margin-top: 30px; width: 85%; position: justify; margin-left: auto; margin-right: auto;">
			<tr>
				<th colspan="8" class="text-center">Welcome- ${userobj.name }</th>
			</tr>
			<tr>
				<th colspan="8" class="text-center"><b
					class="btn btn-secondary" class="text-white">Your Orders</b></th>
			</tr>


			<tr class="text-success bold">

				<td><b>Book Name</b></td>
				<td><b>Author</b></td>
				<td><b>Price</b></td>
				<td><b>Action</b></td>




			</tr>
			<%
			int totalprice = 0;
			for (Cart_Details b : list) {
				totalprice = b.getTotalprice();
			%>

			<tr>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>

				<td><a href="deleteCart?uid=${userobj.id }&&cid=<%=b.getCid()%>"
					class="btn btn-danger">Delete</a></td>

				<%
				}
				%>
			
			

		</table>

	</c:if>






</body>
</html>