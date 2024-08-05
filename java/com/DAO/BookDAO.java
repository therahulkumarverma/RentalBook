//BookDAO.java
package com.DAO;

import java.util.List;

import com.entity.Book_Details;

public interface BookDAO {
	
	public boolean addBooks(Book_Details b);
	public List<Book_Details> getAllBooks();
	public Book_Details getBookById(int id);
	public boolean updateEditBooks(Book_Details b);
	public Boolean deleteBooks(int id);
	public List<Book_Details> getBookByCategory(String categoryname);

	
}