//deletefromcart.java
package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
@WebServlet("/deleteCart")
public class DeleteFromCart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int uid=Integer.parseInt(req.getParameter("uid"));
			int cid=Integer.parseInt(req.getParameter("cid"));
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			boolean f= dao.deleteFromCart(uid, cid);
			HttpSession session=req.getSession();
			if(f==true)
			{
				session.setAttribute("succMsg","Removed from cart");
				 
				 resp.sendRedirect("cart.jsp");
			}
			else
			{
				session.setAttribute("errMsg","OH no something went wrong");
				 
				 resp.sendRedirect("cart.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
