//deletecategory.java
package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CategoryDAOImpl;
import com.DB.DBConnect;
@WebServlet("/deleteCategory")
public class DeleteCategory extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			CategoryDAOImpl dao=new CategoryDAOImpl(DBConnect.getConn());
			boolean f=dao.deleteCategory(id);
			HttpSession session=req.getSession();
			if(f==true)
			{
				session.setAttribute("succMsg", "Category Deleted Successfully!");
				resp.sendRedirect("admin/showCategory.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Something Went wrong!");
				resp.sendRedirect("admin/showCategory.jsp");
				
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		

	}
}
