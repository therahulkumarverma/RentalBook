//categoryDAOImpl
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.DB.*;
import com.entity.Book_Details;
import com.entity.Category_Details;

public class CategoryDAOImpl {
	private Connection con;

	public CategoryDAOImpl(Connection conn) {
		super();
		this.con=conn;
	}
	public boolean addCategory(Category_Details cat)
	{
		boolean f=false;
		try {
			String sql = "insert into category (categoryname) values(?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cat.getCategoryname());
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
	
	//show book ke liye list bana raha hu
	public List<Category_Details> getAllCategory() {
		List<Category_Details> list=new ArrayList<Category_Details>();
		Category_Details c =null;
		
		try {
			String sql= "select * from category";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				c= new Category_Details();
				c.setCategory_id(rs.getInt(1));
				c.setCategoryname(rs.getString(2));
				list.add(c);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public Boolean deleteCategory(int id) {
		boolean f=false;
		try {
			String sql="delete from category where category_id=?";
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
	//fatching data in the edit form
	public Category_Details getCategoryById(int id) {
		Category_Details c=null;
		try {
			String sql="select * from  category where category_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				c=new Category_Details();
				c.setCategory_id(rs.getInt(1));
				c.setCategoryname(rs.getString(2));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
		
	}
	
	//edit category
	public boolean updateEditCategory(Category_Details c) {
		boolean f=false;
		try {
			String sql="update category set categoryname=? where category_id=?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1,c.getCategoryname());
			
			ps.setInt(2,c.getCategory_id());
			

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
	
	
	
}



