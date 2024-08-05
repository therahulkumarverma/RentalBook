//orderservlet.java
package com.user.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.Order_Details;
@WebServlet("/order")
public class orderservlet extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int uid= Integer.parseInt(req.getParameter("uid"));
		int total=Integer.parseInt(req.getParameter("total"));
		String cardnumber=req.getParameter("cardnumber");
		String expairy=req.getParameter("expairy");
		String cvv=req.getParameter("cvv");
		String cardholdername=req.getParameter("cardholdername");
		//System.out.println("your user id"+uid);
		Order_Details  od=new Order_Details();
		od.setUid(uid);
		od.setTotal(total);
		od.setCardnumber(cardnumber);
		od.setExpairy(expairy);
		od.setCvv(cvv);
		od.setCardholdername(cardholdername);
		OrderDAOImpl dao=new OrderDAOImpl(DBConnect.getConn());
		boolean b=dao.Order(od);
		HttpSession session=req.getSession();
		if(b==true)
		{
		      session.setAttribute("succMsg","Order Placed Your Order Status..");
		      resp.sendRedirect("orderstatus.jsp");
		      }
		else
		{
			session.setAttribute("errMsg","OH no something wrong happend..");
		      resp.sendRedirect("order.jsp");
		}
		
		
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}
}
}
