//orderDaoimpl.java
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.DB.*;
import com.entity.Order_Details;

public class OrderDAOImpl implements OrderDAO {

	private Connection conn;

	public OrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean Order(Order_Details od) {
		boolean f = false;
		try {
			String sql = "insert into orders(uid,total,cardnumber,expairy,cvv,cardholdername) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,od.getUid());
			ps.setInt(2, od.getTotal());
			ps.setString(3, od.getCardnumber());
		    ps.setString(4,od.getExpairy());
			ps.setString(5, od.getCvv());
			ps.setString(6, od.getCardholdername());
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
