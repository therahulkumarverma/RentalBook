<!-- faq.jsp -->
<%@ page import="java.util.*"%>
<%@page import="com.DAO.FaqDAO"%>
<%@ page import="com.entity.*" %>
<%@page import="com.DAO.FaqDAOImpl"%>
<%@ page import="com.DB.*"%>

<%
if (session.getAttribute("email") == null) {
	response.sendRedirect("../index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
		<meta http-equiv="PRAGMA" content="NO-CACHE" />
		<meta http-equiv="EXPIRES" content="0" />
		<meta charset="ISO-8859-1">
		<title>Admin: Home</title>
		<%@include file="allCss.jsp"%>

		<style>
			a {
				text-decoration: none;
				color: black;
			}

			a:hover {
				text-decoration: none;
				color: black;
			}
		</style>
	</head>
	<body>
		<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	%>
	<%@include file="navbar.jsp"%>
	
	
	//
	
	<div class="container mt-3 mb-3">

		<table style="width:80%;margin-left:auto;margin-right:auto;" class="table" border="3px" >
			<thead class="thead-light 3x">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Question</th>


					<th scope="col">Answer</th>


					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>

				<%
				FaqDAOImpl dao = new FaqDAOImpl(DBConnect.getConn());
				List<Faq_Details> list = dao.getAllFaq();
				int count=0;
				for (Faq_Details m : list) {
					count++;
				%>
				<tr>
					<th><%=m.getId() %></th>
					<th ><%=m.getQuestion()%></th>
					<td><%=m.getAnswer() %></td>
					<td><a class="btn btn-danger" href="../deleteFaq?id=<%=m.getId() %>">Delete</a></td>
					
				</tr>

				<%
			}
			if(count==0)
			{
			%>
			<tr>
				<td colspan="4" class="text-center"><b class="text-danger">Sorry No record found..</b></td>
			</tr>
			<% 
		}
	%>



</tbody>
</table>
//

<div style="width: 120%; margin-top: 310px;"><%@include
	file="footer.jsp"%></div>


</body>
</html>