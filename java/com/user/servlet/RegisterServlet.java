//registerservlet.java
package com.user.servlet;
import java.sql.*;
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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name= req.getParameter("name");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String address=req.getParameter("address");
			String dob=req.getParameter("dob");
			String gender=req.getParameter("gender");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			//System.out.println(name+" "+email+" "+phone+" "+address+""+dob+" "+gender+" "+password+" "+check);
			
			User_Details us=new User_Details();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setAddress(address);
			us.setDob(dob);
			us.setGender(gender);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			
			if(check!=null)
			{
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
				boolean f=dao.UserRigister(us);
				if(f)	
				{
					//System.out.println("user  registered successfully!");
					session.setAttribute("succMsg", "Register SuccessFully.....");
					resp.sendRedirect("register.jsp");
				}
				else
				{
					//System.out.println("something went wrong!");
					session.setAttribute("errMsg", "Something went wrong .....");
					resp.sendRedirect("register.jsp");
					
				}
				
			}
			else
			{
				session.setAttribute("errMsg", "Please Check terms & condition .....");
				resp.sendRedirect("register.jsp");
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

}
