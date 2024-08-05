<!-- faq.jsp -->
<%@ page import="java.util.*"%>
<%@page import="com.DAO.FaqDAO"%>
<%@ page import="com.entity.*" %>
<%@page import="com.DAO.FaqDAOImpl"%>
<%@ page import="com.DB.*"%>
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
	<tr class="text-center" ><th><p class="text-center" style="margin-top:10px; "><b class="text-danger"><i>Some Frequently asked Question and Answer</i></b></p></th></tr>
	
	<% 
	FaqDAOImpl dao = new FaqDAOImpl(DBConnect.getConn());
	List<Faq_Details> list = dao.getAllFaq();
	int count=1;
	int row=0;
	for (Faq_Details m : list) {
		count++;
		row++;
		
	%>
	<table style="width:95%; margin-left:auto; margin-right:auto;text-align:justify;">
		<tr>
			<th><%=count %>   <%=m.getQuestion()%></th></br></br>
		</tr>
		<tr>
			
			<td><%=m.getAnswer() %><td>
			</tr>
		</table>
		<%
	}
	if(row==0)
	{
	%>
	<tr>
		<td><p class="text-center"><b class="text-danger"><br><br>Sorry No record found..</b></p></td>
	</tr>
	<% 
}
%>






<%@include file="allComponent/footer.jsp"%>

</body>
</html>