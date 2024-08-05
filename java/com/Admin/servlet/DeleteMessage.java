//deletemessage.java
package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CategoryDAOImpl;
import com.DAO.MessageDAOImpl;
import com.DB.DBConnect;
@WebServlet("/deleteMessage")
public class DeleteMessage extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			MessageDAOImpl dao=new MessageDAOImpl(DBConnect.getConn());
			boolean f=dao.deleteMessage(id);
			HttpSession session=req.getSession();
			if(f==true)
			{
				session.setAttribute("succMsg", "Message Deleted Successfully!");
				resp.sendRedirect("admin/message.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Something Went wrong!");
				resp.sendRedirect("admin/message.jsp");
				
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		

	}

}
