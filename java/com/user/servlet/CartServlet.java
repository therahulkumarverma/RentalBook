package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Details;
import com.entity.Cart_Details;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	/**
	 *
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			 int uid=Integer.parseInt(req.getParameter("uid"));
			 int bid=Integer.parseInt(req.getParameter("bid"));
			 BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			 Book_Details b=dao.getBookById(bid);
			// System.out.println("book id is"+uid);
			   Cart_Details c=new Cart_Details(); 
			   c.setBid(bid);
			   c.setUid(uid);
			   c.setBookname(b.getName());
			   c.setAuthor(b.getAuthor());
			   c.setPrice(b.getPrice());
			   c.setTotalprice(b.getPrice());
				 CartDAOImpl dao1=new CartDAOImpl(DBConnect.getConn());
				 boolean f=dao1.addcart(c);
				 HttpSession session=req.getSession();
				 if(f==true)
				 {
					session.setAttribute("succMsg","Added to cart");
					 
					 resp.sendRedirect("cart.jsp");
                  					
				 }
				 else
				 {
					 session.setAttribute("errMsg", "Something wrong happend..");
                    resp.sendRedirect("index.jsp");
				 }
				 

			   
			 
			 
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	

}
