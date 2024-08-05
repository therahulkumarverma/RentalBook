//categoryDAO.java
package com.DAO;

import java.util.List;

import com.entity.Book_Details;
import com.entity.Category_Details;
import com.entity.User_Details;

public interface CategoryDAO {
	public boolean AddCategory(Category_Details cat);
	public List<Category_Details> getAllCategory();
	public boolean deleteCategory(int id);
	public Category_Details getCategoryById(int id);

	public boolean updateEditCategory(Category_Details c);


}
