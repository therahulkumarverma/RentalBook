//deletefaq.java
package com.Admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.FaqDAOImpl;
import com.DB.DBConnect;
@WebServlet("/deleteFaq")
public class DeleteFaqServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			FaqDAOImpl  dao=new FaqDAOImpl(DBConnect.getConn());
			boolean b=dao.deleteQuestion(id);
			//System.out.println(b);

			HttpSession session=req.getSession();
			if(b==true)
			{
				session.setAttribute("succMsg", "Question Deleted...");
				resp.sendRedirect("admin/showFaq.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Something went wrong...");
				resp.sendRedirect("admin/showFaq.jsp");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
