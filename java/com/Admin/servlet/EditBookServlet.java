//editbooks.java
package com.Admin.servlet;

    import java.io.IOException;

    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import javax.servlet.http.HttpSession;
    import javax.servlet.http.Part;

    import com.DAO.BookDAOImpl;
    import com.DB.DBConnect;
    import com.entity.Book_Details;

    @WebServlet("/editBooks")
    public class EditBookServlet extends HttpServlet{
       @Override
       protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          
          try {
            int id=Integer.parseInt(req.getParameter("id"));	
            
            String category=req.getParameter("category");
            String name=req.getParameter("name");
            String author=req.getParameter("author");
            String publication=req.getParameter("publication");
            Integer price =Integer.parseInt(req.getParameter("price"));
            String publication_year=req.getParameter("publish_year");
            String pages=req.getParameter("pages");
            String isbn=req.getParameter("isbn");
            String status=req.getParameter("status");
            String seller = req.getParameter("seller");
            
            
            
            Book_Details b=new Book_Details();
            b.setBook_id(id);
            b.setCategory(category);
            b.setName(name);
            b.setAuthor(author);
            b.setPublication(publication);
            b.setPrice(price);
            b.setPublication_year(publication_year);
            b.setPages(pages);
            b.setIsbn(isbn);
            b.setStatus(status);
            b.setSeller(seller);
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
             	//dao.updateEditBooks(b);
            boolean f=dao.updateEditBooks(b);
             //	System.out.print("boolean"+b);
            HttpSession session=req.getSession();
            if(f==true)
            {
             session.setAttribute("succMsg", "Book Edited Successfully!");
             resp.sendRedirect("admin/showBooks.jsp");
         }
         else
         {
             session.setAttribute("errMsg", "Something Went wrong!");
             resp.sendRedirect("admin/editBooks.jsp");
             
         }
         
         
     } catch (Exception e) {
         e.printStackTrace();
     }
     
     
 }
 

}
