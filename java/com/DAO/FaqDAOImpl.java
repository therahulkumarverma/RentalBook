//faqdaoimpl.java
package com.DAO;
import java.sql.Connection;
import  com.DB.DBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Details;
import com.entity.Faq_Details;

public class FaqDAOImpl implements FaqDAO {
	private Connection con;

	public FaqDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	public boolean addQuestion(Faq_Details f) {
		
		boolean b=false;
		try {
			String sql = "insert into faq(question, answer) values(?,?)";		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,f.getQuestion());
			ps.setString(2, f.getAnswer());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				b=true; 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	//fatching all faq on admin
	public  List<Faq_Details> getAllFaq()
	{
		List <Faq_Details> list=new ArrayList<Faq_Details>();
		Faq_Details b =null;
		
		try {
			String sql= "select * from faq";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Faq_Details();
				b.setId(rs.getInt(1));
				b.setQuestion(rs.getString(2));
				b.setAnswer(rs.getString(3));
				
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteQuestion(int id) {
		boolean f=false;
		try {
			String  sql="delete from faq where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
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
