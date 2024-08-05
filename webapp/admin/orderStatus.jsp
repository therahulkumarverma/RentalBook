<!-- orderstatus.jsp -->
<%
if(session.getAttribute("email")==null)
{
  response.sendRedirect("../index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@page isELIgnored="false"%>
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Admin: Add Book</title>
    <%@include file="allCss.jsp"%>

    <style>


      a{
        text-decoration:none;
        color:none;
      }


    </style>
  </head>
  <body>
   <%@include file="navbar.jsp"%>

   <div class="container mt-3 mb-3">
     
     <div class="text-center text-white"><button class="btn btn-success">Order Status</button></div>
   </div>
   <table class="table" border="2px">
    <thead class="thead-dark">
      <tr>
        <th scope="col">Order_id</th>
        <th scope="col">Customer_id</th>
        
        <th scope="col">Book</th>
        <th scope="col">Author</th>
        <th scope="col">Publication</th>
        
        <th scope="col">Price</th>
        <th scope="col">Pages</th>
        <th scope="col">Pub_year</th>
        <th scope="col">Payment _type</th>
        
        <th scope="col">Date</th>
        <th scope="col">Action</th>
      </tr>
    </thead>
    <tbody>
      <tr>
         <td>1</td>
         <td>22</td>
         <td>Ramayana</td>
         <td>Balmikiji</td>
         <td>Rama Publication</td>
         <td>1000</td>
         <td>1160</td>
         <td>2022</td>
         <td>Card</td>
         <td>17/09/2022</td>
         <td><a class="btn btn-danger">Remove</a></td>
         <td></td>
      </tr>
      
    </tbody>
  </table>

</body>
</html>