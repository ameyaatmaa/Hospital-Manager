package com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDAO;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String fullName= req.getParameter("fullName");
			String dob= req.getParameter("dob");
			String qualification= req.getParameter("qualification");
			String specialist= req.getParameter("spec");
			String email= req.getParameter("email");
			String mobNo= req.getParameter("mobNo");
			String password= req.getParameter("password");
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			Doctor d= new Doctor(id,fullName,dob,qualification,specialist,email,mobNo,password);
			
			DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			if(dao.updateDoctor(d)) {
				session.setAttribute("succMsg", "Doctor Updated Successfully...");
			resp.sendRedirect("admin/doctor.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Something Wrong On Server");
				resp.sendRedirect("admin/doctor.jsp");
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
	}
	
	

}
