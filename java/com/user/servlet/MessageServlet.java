package com.user.servlet;
import java.sql.*;
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
import com.entity.Message_Details;

@WebServlet("/contectServlet")

public class MessageServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name= req.getParameter("name");
			String email=req.getParameter("email");
			String message=req.getParameter("message");
			//System.out.println(name+" "+email+" "+message);
			Message_Details ms=new Message_Details();
			ms.setName(name);
			ms.setEmail(email);
			ms.setMessage(message);
			HttpSession session=req.getSession();
			MessageDAOImpl dao=new MessageDAOImpl(DBConnect.getConn());
			boolean f=dao.Message(ms);
			if(f)	
			{
				//System.out.println("user  registered successfully!");
				session.setAttribute("succMsg", "Message sent SuccessFully.....");
				resp.sendRedirect("contactUs.jsp");
			}
			else
			{
				//System.out.println("something went wrong!");
				session.setAttribute("errMsg", "Something went wrong .....");
				resp.sendRedirect("MessageUs.jsp");
				
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//super.doPost(req, resp);
	}

}
