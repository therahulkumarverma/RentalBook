//changepassword.java
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

@WebServlet("/changePass")
public class changePassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// int id=Integer.parseInt(req.getParameter("id"));
			int id = Integer.parseInt(req.getParameter("id"));
			String password = req.getParameter("password");
			String repeatpassword = req.getParameter("repeatpassword");
			User_Details us = new User_Details();
			us.setId(id);
			us.setPassword(password);

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.updatePassword(us);
			//System.out.println("return"+f);
			HttpSession session = req.getSession();

			if (password.equals(repeatpassword)) {

				if (f == true) {
					System.out.println("welcome");
					session.setAttribute("succMsg", "Password Updated successfully....");
					resp.sendRedirect("settings.jsp");

				} else {
                      //System.out.println("not welcome");
					session.setAttribute("errMsg", "Something went wrong...");

					resp.sendRedirect("settings.jsp");

				}

			} else {
				//System.out.println("not matched");
				session.setAttribute("errMsg", "Password and RepeatPassword are not same ...");

				resp.sendRedirect("settings.jsp");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
