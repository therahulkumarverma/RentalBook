//edituser.java
package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CategoryDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Category_Details;
import com.entity.User_Details;
@WebServlet("/editUser")
public class EditUser extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String   name = req.getParameter("name");
			String   email = req.getParameter("email");
			String   phone = req.getParameter("phone");
			String   address = req.getParameter("address");
			String   gender = req.getParameter("gender");
			String   dob = req.getParameter("dob");

			User_Details us = new User_Details();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setAddress(address);
			us.setGender(gender);
			us.setDob(dob);

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			// dao.updateEditBooks(b);
			boolean f = dao.updateEditUser(us);
			// System.out.print("boolean"+b);
			HttpSession session = req.getSession();
			if (f == true) {
				session.setAttribute("succMsg", "User Data Edited Successfully!");
				resp.sendRedirect("admin/userInfo.jsp");
			} else {
				session.setAttribute("errMsg", "Something Went wrong!");
				resp.sendRedirect("admin/userInfo.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
