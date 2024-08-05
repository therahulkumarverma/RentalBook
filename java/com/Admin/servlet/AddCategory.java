//addcategory.java
package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CategoryDAOImpl;
import com.DB.DBConnect;
import com.entity.Category_Details;
@WebServlet("/addCategory")
public class AddCategory extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String categoryname=req.getParameter("categoryname");
          // System.out.println(categoryname);
			
			Category_Details cat= new Category_Details();
			cat.setCategoryname(categoryname);

			CategoryDAOImpl dao=new CategoryDAOImpl(DBConnect.getConn());
			boolean f=dao.addCategory(cat);
			HttpSession session=req.getSession();

			if(f)	
			{
				//System.out.println("user  registered successfully!");
				session.setAttribute("succMsg", "Added SuccessFully.....");
				resp.sendRedirect("admin/showCategory.jsp");
			}
			else
			{
				//System.out.println("something went wrong!");
				session.setAttribute("errMsg", "Something went wrong .....");
				resp.sendRedirect("admin/addCategory.jsp");
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		
	}
	
	

}
