//MessageDAO.java
package com.DAO;
import java.util.*;
import com.entity.Message_Details;
public interface MessageDAO {
	public boolean  Message(Message_Details ms);
	public List<Message_Details>getAllMessage();
	public boolean deleteMessage(int id);	

	

}
