//deletebooksservlete.java
package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/deleteBooks")

public class DeleteBooksServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.deleteBooks(id);
			HttpSession session=req.getSession();
			if(f==true)
			{
				session.setAttribute("succMsg", "Book Deleted Successfully!");
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
