//userdao.java
package com.DAO;

import java.util.List;

import com.entity.Book_Details;
import com.entity.User_Details; 

public interface UserDAO {
	public boolean  UserRigister(User_Details us);

	public User_Details login(String email, String password);
	public List<User_Details> getAllUsers();
	public Boolean deleteUser(int id);
	public User_Details getUserById(int id);
	public boolean updateEditUser(User_Details b);
	public boolean updatePassword(User_Details b);



}
