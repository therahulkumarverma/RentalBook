package com.DB;
import java.sql.*;

public class DBConnect {

	private static Connection conn;
	public static Connection  getConn()
	{
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3308/rentalbook","root","india@123");
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("connection failed");
			e.printStackTrace();
			
		}
		return conn;
		
	}
	
	
}
