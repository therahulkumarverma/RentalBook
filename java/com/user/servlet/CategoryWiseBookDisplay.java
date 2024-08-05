//categorywisedisplay.java
package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Details;
@WebServlet("/categoryWiseBook")
public class CategoryWiseBookDisplay extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String categoryname=req.getParameter("categoryname");	
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			
			List f=	dao.getBookByCategory(categoryname);
            //System.out.print("boolean"+b);
			HttpSession session=req.getSession();
			if(f!=null)
			{
				session.setAttribute("succMsg", "Book Edited Successfully!");
				resp.sendRedirect("admin/showBooks.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Something Went wrong!");
				resp.sendRedirect("admin/editBooks.jsp");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
