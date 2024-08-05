//add_books.java
package com.Admin.servlet;

	import java.io.File;
	import java.io.IOException;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.MultipartConfig;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;
	import javax.servlet.http.Part;

	import com.DAO.BookDAOImpl;
	import com.DB.DBConnect;
	import com.entity.Book_Details;

	@WebServlet("/Add_Books")
	@MultipartConfig
	public class Add_Books extends HttpServlet {
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			try {
				String category=req.getParameter("category");
				String name=req.getParameter("name");
				Part part=req.getPart("image");
                // Part part =req.getPart("image");
				String fileName=part.getSubmittedFileName();
				String author=req.getParameter("author");
				String publication=req.getParameter("publication");
				Integer price =Integer.parseInt(req.getParameter("price"));
				String publication_year=req.getParameter("publish_year");
				String pages=req.getParameter("pages");
				String isbn=req.getParameter("isbn");
				String status=req.getParameter("status");
				String seller = req.getParameter("seller");
				
				
				
				Book_Details b=new Book_Details(category,name,fileName,author, publication,price,publication_year,pages,isbn, status,seller);
               // System.out.print(b.seller);
				BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
				
				boolean f=dao.addBooks(b);
				HttpSession session=req.getSession();
				if(f==true) {
					String path= getServletContext().getRealPath("")+"img";
					File file= new File(path);
					part.write(path+File.separator+ fileName);
					System.out.println(path);
					session.setAttribute("succMsg","Book Added Successfully!");
					resp.sendRedirect("admin/showBooks.jsp");
				}else {
					session.setAttribute("errMsg", "Something Went  Worng!");
					resp.sendRedirect("admin/addBooks.jsp");
					
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
