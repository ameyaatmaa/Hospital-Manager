package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

public class DoctorDAO {
	private Connection conn;

	public DoctorDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean registerDoctor(Doctor d) {
		boolean f=false;
		
		try {
			
			String sql="INSERT INTO doctor(fug,dob,qualification,specialist,email,mob,password) VALUES(?,?,?,?,?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());
			
			int i= ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Doctor> getAllDoctor(){
		List<Doctor> list= new ArrayList<>();
		
		Doctor d=null;
		
		try {
			
			String sql="select * from doctor order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setEmail(rs.getString(6));
				d.setSpecialist(rs.getString(5));
				d.setMobNo(rs.getString(7));
				list.add(d);
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public Doctor getDoctorById(int id){
		
		
		Doctor d=null;
		
		try {
			
			String sql="select * from doctor where id=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			
			
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setEmail(rs.getString(6));
				d.setSpecialist(rs.getString(5));
				d.setMobNo(rs.getString(7));
				
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return d;
	}
	
	public boolean updateDoctor(Doctor d) {
		boolean f=false;
		
		try {
			
			String sql="update doctor set fug=?,dob=?,qualification=?,specialist=?,email=?,mob=?,password=? where id=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());
			ps.setInt(8, d.getId());
			
			int i= ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public boolean deleteDoctor(int doctorId) {
	    Connection con = null;
	    PreparedStatement pstmt1 = null;
	    PreparedStatement pstmt2 = null;

	    try {
	        con = DBConnect.getConn();
	        con.setAutoCommit(false); // Start transaction

	        // Step 1: Delete related appointments
	        String deleteAppointmentsSQL = "DELETE FROM appointment WHERE docid = ?";
	        pstmt1 = con.prepareStatement(deleteAppointmentsSQL);
	        pstmt1.setInt(1, doctorId);
	        pstmt1.executeUpdate();

	        // Step 2: Delete doctor
	        String deleteDoctorSQL = "DELETE FROM doctor WHERE id = ?";
	        pstmt2 = con.prepareStatement(deleteDoctorSQL);
	        pstmt2.setInt(1, doctorId);
	        int affectedRows = pstmt2.executeUpdate();

	        con.commit(); // Commit transaction

	        return affectedRows > 0; // Return true if doctor was deleted successfully

	    } catch (Exception e) {
	        try {
	            if (con != null) {
	                con.rollback(); // Rollback transaction in case of failure
	            }
	        } catch (SQLException rollbackEx) {
	            rollbackEx.printStackTrace();
	        }
	        e.printStackTrace();
	        return false;
	    } finally {
	        try {
	            if (pstmt1 != null) pstmt1.close();
	            if (pstmt2 != null) pstmt2.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	
	public Doctor login(String email,String password) {
		Doctor d= null;
		
		try {
			String sql="select * from doctor where email=? and password=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				d=new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setEmail(rs.getString(6));
				d.setSpecialist(rs.getString(5));
				d.setMobNo(rs.getString(7));
	
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return d;
	}
	
	
	public int countDoctor() {
		int i=0;
		
		try {
			
			String sql="select * from doctor ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	
	
	
	public int countSpecialist() {
		int i=0;
		
		try {
			
			String sql="select * from specialist ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countUser() {
		int i=0;
		
		try {
			
			String sql="select * from user_details ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countAppointment() {
		int i=0;
		
		try {
			
			String sql="select * from appointment ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	public int countAppointmentByDoctorId(int did) {
		int i=0;
		
		try {
			
			String sql="select * from appointment where docid=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,did);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	
	public boolean checkOldPassword(int userid, String oldPassword) {
	    boolean f = false;

	    try {
	        
	        String sql = "SELECT * FROM doctor WHERE id=? AND password=?";
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
			String sql="update doctor set password=? where id=? ";
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
	
	public boolean editDoctorProfile(Doctor d) {
		boolean f=false;
		
		try {
			
			String sql="update doctor set fug=?,dob=?,qualification=?,specialist=?,email=?,mob=? where id=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			
			ps.setInt(7, d.getId());
			
			int i= ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	
	
	
	
	

}
