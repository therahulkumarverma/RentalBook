//cartDaoImpl.java
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart_Details;
import com.entity.User_Details;
import com.oracle.wls.shaded.java_cup.runtime.lr_parser;

public class CartDAOImpl implements CartDAO{
	
	private Connection conn;
	public CartDAOImpl(Connection conn)
	{
		this.conn=conn;
	}

	public boolean addcart(Cart_Details c) {
		boolean b=false;
		try {
			 String sql="insert into cart(bid,uid,bookname,author,price,totalprice) values(?,?,?,?,?,?)";
			 PreparedStatement ps=conn.prepareStatement(sql);
			 ps.setInt(1, c.getBid());
			 ps.setInt(2, c.getUid());
			 ps.setString(3,c.getBookname());
			 ps.setString(4, c.getAuthor());
			 ps.setInt(5, c.getPrice());
			 ps.setInt(6, c.getTotalprice());
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

	public List<Cart_Details> getbookDetailsById(int id) {
		List <Cart_Details> list=new ArrayList<Cart_Details>();
            int totalprice=0;
		 Cart_Details c=null;
			try {
				String sql="select * from  cart where uid=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					c=new Cart_Details();
					c.setCid(rs.getInt(1));
					c.setBid(rs.getInt(2));
					c.setUid(rs.getInt(3));
					c.setBookname(rs.getString(4));
					c.setAuthor(rs.getString(5));
					c.setPrice(rs.getInt(6));
				     totalprice=totalprice+rs.getInt(7);
				     c.setTotalprice(totalprice);
					
					list.add(c);
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return  list;

}
	public boolean deleteFromCart(int uid, int cid) {
        boolean f=false;
        try {
        	
        	String sql="delete from cart where cid=? and uid=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1,cid);
			ps.setInt(2, uid);
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
