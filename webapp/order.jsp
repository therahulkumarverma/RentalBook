<!-- order.jsp -->
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

table {
	border-spacing: 8px 2px;
}

td {
	padding: 6px;
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
	
	

       <c:if
		test="${(not empty userobj) and (userobj.name =='admin')}">
		<c:redirect url="index.jsp" />

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

		<aside>
			<table class="table" border="2px"
				style="margin-top: 30px; width: 30%; float: left; margin-left: 30px;">
				<tr>
					<th colspan="8" class="text-center">Welcome- ${userobj.name }</th>
				</tr>
				<tr>
					<th colspan="2"><a href="cart.jsp" class="text-center"
						style="float: right; mrgin-right: 10px"><i
							class="fa fa-shopping-cart" aria-hidden="true"></i>Update Cart</a></th>
				</tr>


				<tr class="text-black bold">

					<td><b>Book Name</b></td>
					<td><b>Price</b></td>




				</tr>
				<%
				int totalprice = 0;
				for (Cart_Details b : list) {
					totalprice = b.getTotalprice();
				%>

				<tr>
					<td><%=b.getBookname()%></td>
					<td><%=b.getPrice()%></td>



					<%
					}
					%>
				
				<tr>
					<td colspan="4"><b class="text-danger">Total price</b><b
						style="margin-left: 100px;"> <%=totalprice%>&nbsp;Rupess
					</b></td>
				</tr>

			</table>
	</c:if>
	</aside>
	<aside style="float: right; margin-right: 10%; margin-top: 3%;">
		<table width="300px">
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

			<tr>
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<b>Enter Card Details</b>
						</div>
						<form action="order" method="post">

							<input type="hidden" name="uid" value="<%=u.getId()%>">
							<%
							int total = 0;
							for (Cart_Details b : list) {
								total = b.getTotalprice();
							%>


							<%
							}
							%>
							<p>${total}</p>
							<input type="hidden" name="total" value="<%=total%>"> <label>Card
								Number</label><br> <input type="text" name="cardnumber"
								placeholder="Enter 16 digits card number" class="form-control" required="#">
							<label>Expairy Date</label>&emsp;&emsp;
							<level>Security code</level>
							<br> <input type="text" name="expairy" size="8"
								placeholder="MM/YY" required="#">&emsp; <input type="text" name="cvv"
								size="6" placeholder="XXX" required="#"><br> <label>Name</label><br>
							<input type="text" class="form-control" name="cardholdername"
								placeholder="Card holder name" required="#"><br> 
								<%
								int n=total;
								 if(n==0)
								 {
									 %>
									 <a href="index.jsp" class="btn btn-success" class="form-control"
										 "><b><%=total%> Rs.</b> Add something to checkout >></a>
										<% 
								 }
								 else
								 {
									 %>
									 <input
								type="submit" class="btn btn-success" class="form-control"
								value="<%=total%> Proceed to checkout >>">
									 <% 
								 }
							     
								%>
								
						</form>

					</div>

				</div>
			</tr>
		</table>
	</aside>








</body>
</html>