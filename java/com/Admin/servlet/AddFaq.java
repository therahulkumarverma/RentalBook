//addfaq.java
package com.Admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DAO.FaqDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Details;
import com.entity.Faq_Details;
@WebServlet("/addFaq")
public class AddFaq extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String question=req.getParameter("question");
			String answer=req.getParameter("answer");
			
			
			
			Faq_Details b=new Faq_Details(question,answer);
			FaqDAOImpl dao=new FaqDAOImpl(DBConnect.getConn());
			
			boolean f=dao.addQuestion(b);
			HttpSession session=req.getSession();
			if(f==true) {
				
				session.setAttribute("succMsg","Question Added Successfully!");
				resp.sendRedirect("admin/showFaq.jsp");
			}else {
				session.setAttribute("errMsg", "Something Went  Worng!");
				resp.sendRedirect("admin/showFaq.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
