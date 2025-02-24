package com.dao;

import java.sql.*;

import com.entity.User;

public class UserDAO {	

	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean userRegister(User u) {
		boolean f= false;
		
		try {
			String sql="insert into user_details(full_name,email,password) values(?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public User login(String email,String password) {
		User u= null;
		
		try {
			String sql="select * from user_details where email=? and password=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				u= new User();
				u.setId(rs.getInt(1));
				u.setFullname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}
	
	
	public boolean checkOldPassword(int userid, String oldPassword) {
	    boolean f = false;

	    try {
	        
	        String sql = "SELECT * FROM user_details WHERE id=? AND password=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, userid);
	        ps.setString(2, oldPassword);  

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {  
	            f = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return f;
	}

	
	
	
	public  boolean changePassword(int userid,String newPassword) {
		boolean f=false;
		
		try {
			String sql="update user_details set password=? where id=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return f;
	}
	
	

//	public Connection getConn() {
//		return conn;
//	}
//
//	public void setConn(Connection conn) {
//		this.conn = conn;
//	}

}
