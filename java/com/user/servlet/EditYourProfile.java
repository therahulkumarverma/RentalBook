package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User_Details;
@WebServlet("/editYourProfile")
public class EditYourProfile extends HttpServlet{
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
				session.setAttribute("succMsg", "User Data Edited Successfully! Logout to Reflect Changes....");

				resp.sendRedirect("settings.jsp");
				
				
			} else {
				session.setAttribute("errMsg", "Something Went wrong!");
				resp.sendRedirect("settings.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
