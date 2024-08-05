//editcategory.java
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
import com.entity.Book_Details;
import com.entity.Category_Details;

@WebServlet("/editCategory")
public class EditCategory extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("category_id"));

			String categoryname = req.getParameter("categoryname");

			Category_Details c = new Category_Details();
			c.setCategory_id(id);
			c.setCategoryname(categoryname);

			CategoryDAOImpl dao = new CategoryDAOImpl(DBConnect.getConn());
			// dao.updateEditBooks(b);
			boolean f = dao.updateEditCategory(c);
			// System.out.print("boolean"+b);
			HttpSession session = req.getSession();
			if (f == true) {
				session.setAttribute("succMsg", "Category Edited Successfully!");
				resp.sendRedirect("admin/showCategory.jsp");
			} else {
				session.setAttribute("errMsg", "Something Went wrong!");
				resp.sendRedirect("admin/editCategory.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
