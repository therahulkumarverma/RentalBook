//MessageDAOimpl.java
package com.DAO;
import com.entity.Message_Details;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MessageDAOImpl implements MessageDAO {
	private Connection conn;

	public MessageDAOImpl(Connection  conn)
	{
		super();
		this.conn = conn;
	}

	public boolean Message(Message_Details ms) {
		boolean f=false;
		try {
			String sql = "insert into message(name,email, message) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ms.getName());
			ps.setString(2, ms.getEmail());
			ps.setString(3, ms.getMessage());
			

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

			
		} catch (Exception e) {

			e.printStackTrace();
		}
		return f;
	}
	
	//fatching data on admin panel
	public  List<Message_Details> getAllMessage()
	{
		List<Message_Details> list= new ArrayList<Message_Details>();
		Message_Details ms=null;
		try {
			String sql="select * from message";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ms=new Message_Details();
				ms.setId(rs.getInt(1));
				ms.setName(rs.getString(2));
				ms.setEmail(rs.getString(3));
				ms.setMessage(rs.getString(4));
				list.add(ms);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteMessage(int id) {
		boolean f=false;
		try {
			String sql="delete from message where idmessage=?";
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
}