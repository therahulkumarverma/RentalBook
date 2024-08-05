//userdaoimpl.java
package com.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Details;
import com.entity.User_Details;

public class UserDAOImpl implements UserDAO { 
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean UserRigister(User_Details us) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "insert into user(name,email, phone,address, dob,gender,password) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getAddress());
			ps.setString(5, us.getDob());
			ps.setString(6, us.getGender());
			ps.setString(7, us.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}

	public User_Details login(String email, String password) {

		User_Details us=   null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				
				us=new User_Details();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setAddress(rs.getString(5));
				us.setGender(rs.getString(6));
				us.setDob(rs.getString(7));
				us.setPassword(rs.getString(8));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return us;
		
	}
	
	
	//fatching data on admin portal
	
	public List<User_Details> getAllUsers() {
		List <User_Details> list=new ArrayList<User_Details>();
		User_Details usd =null;
		
		try {
			String sql= "select * from user";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				
				usd=new User_Details();
				usd.setId(rs.getInt(1));
				usd.setName(rs.getString(2));
				usd.setEmail(rs.getString(3));
				usd.setPhone(rs.getString(4));
				usd.setAddress(rs.getString(5));
				usd.setGender(rs.getString(6));
				usd.setDob(rs.getString(7));
				usd.setPassword(rs.getString(8));
				
				list.add(usd);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
//delete user
	public Boolean deleteUser(int id)
	{
		boolean f=false;
		try {
			String sql="delete from user where id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
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
	// get user by id
	public User_Details getUserById(int id)
	{
		User_Details us=null;
		try {
			String sql="select * from  user where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				us=new User_Details();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setAddress(rs.getString(5));
				us.setGender(rs.getString(6));
				us.setDob(rs.getString(7));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
		
	}
	
	//edit user
	

	public boolean updateEditUser(User_Details us) {
		boolean f=false;
		try {
			String sql="update user set  name=?,email=?,phone=?,address=?,gender=?,dob=? where id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,us.getName() );
			ps.setString(2,us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getAddress());
			ps.setString(5, us.getGender());
			ps.setString(6, us.getDob());
			ps.setInt(7, us.getId());
			
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

	public boolean updatePassword(User_Details us) {
		boolean f=false;
		try {
			String sql="update user set  password=? where id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ps.setString(1, us.getPassword());
			ps.setInt(2, us.getId());
			
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
