//BookDAOImpl.java
package com.DAO;
import java.util.*;
import  java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Book_Details;

public class BookDAOImpl implements BookDAO {
	private Connection con;

	public BookDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	public boolean addBooks(Book_Details b) {
		boolean f = false;
		try {
			String sql = "insert into book (category,name,image,author, publication,price,publication_year,pages,isbn,status,seller) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getCategory());
			ps.setString(2, b.getName());
			ps.setString(3,b.getImage());
			ps.setString(4, b.getAuthor());
			ps.setString(5, b.getPublication());
			ps.setInt(6, b.getPrice());
			ps.setString(7, b.getPublication_year());
			ps.setString(8, b.getPages());
			ps.setString(9, b.getIsbn());
			ps.setString(10, b.getStatus());
			ps.setString(11, b.getSeller());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true; 
			}
			
			

		}
		catch (Exception e) {
			e.printStackTrace();

		}
		return f;
	}

	public List<Book_Details> getAllBooks() {
		List <Book_Details> list=new ArrayList<Book_Details>();
		Book_Details b =null;
		
		try {
			String sql= "select * from book";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Book_Details();
				b.setBook_id(rs.getInt(1));
				b.setCategory(rs.getString(2));
				b.setName(rs.getString(3));
				b.setImage(rs.getString(4));
				b.setAuthor(rs.getString(5));
				b.setPublication(rs.getString(6));
				b.setPrice(rs.getInt(7));
				b.setPublication_year(rs.getString(8));
				b.setPages(rs.getString(9));
				b.setIsbn(rs.getString(10));
				b.setStatus(rs.getString(11));
				b.setSeller(rs.getString(12));
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Book_Details getBookById(int id) {
		Book_Details b=null;
		try {
			String sql="select * from  book where book_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Book_Details();
				b.setBook_id(rs.getInt(1));
				b.setCategory(rs.getString(2));
				b.setName(rs.getString(3));
				b.setImage(rs.getString(4));
				b.setAuthor(rs.getString(5));
				b.setPublication(rs.getString(6));
				b.setPrice(rs.getInt(7));
				b.setPublication_year(rs.getString(8));
				b.setPages(rs.getString(9));
				b.setIsbn(rs.getString(10));
				b.setStatus(rs.getString(11));
				b.setSeller(rs.getString(12));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
		
	}

	public boolean updateEditBooks(Book_Details b) {
		boolean f=false;
		try {
			String sql="update book set category=?,name=?,author=?,publication=?,price=?,publication_year=?,pages=?,isbn=?,status=?, seller=? where book_id=?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1,b.getCategory());
			ps.setString(2,b.getName() );
			ps.setString(3,b.getAuthor());
			ps.setString(4,b.getPublication() );
			ps.setInt(5,b.getPrice() );
			ps.setString(6,b.getPublication_year() );
			ps.setString(7,b.getPages() );
			ps.setString( 8,b.getIsbn());
			ps.setString(9, b.getStatus());
			ps.setString(10,b.getSeller());
			ps.setInt(11,b.getBook_id());
			

			int i= ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}

		return f;
	}

	public Boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql="delete from book where book_id=?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setInt(1,id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Book_Details> getBookByCategory(String category) 
	{
		List <Book_Details> list=new ArrayList<Book_Details>();

		Book_Details b=null;
		try {
			String sql="select * from  book where category=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, category);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Book_Details();
				b.setBook_id(rs.getInt(1));
				b.setCategory(rs.getString(2));
				b.setName(rs.getString(3));
				b.setImage(rs.getString(4));
				b.setAuthor(rs.getString(5));
				b.setPublication(rs.getString(6));
				b.setPrice(rs.getInt(7));
				b.setPublication_year(rs.getString(8));
				b.setPages(rs.getString(9));
				b.setIsbn(rs.getString(10));
				b.setStatus(rs.getString(11));
				b.setSeller(rs.getString(12));
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
		
	}
	
	

}
