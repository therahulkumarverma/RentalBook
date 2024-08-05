//deleteuser.java
package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MessageDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.deleteUser(id);
			HttpSession session=req.getSession();
			if(f==true)
			{
				session.setAttribute("succMsg", "User Data Deleted Successfully!");
				resp.sendRedirect("admin/userInfo.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Something Went wrong!");
				resp.sendRedirect("admin/userInfo.jsp");
				
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		

	}

}
