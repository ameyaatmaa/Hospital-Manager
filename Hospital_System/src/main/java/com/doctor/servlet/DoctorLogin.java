package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDAO;
import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			DoctorDAO dao= new DoctorDAO(DBConnect.getConn());
			
			Doctor d =dao.login(email, password);
			
			
			if(d!=null) {
				
				session.setAttribute("doctorObj",d  );
				resp.sendRedirect("doctor/index.jsp");
				
			}else {
				session.setAttribute("errorMsg", "invalid email & password" );
				resp.sendRedirect("doctor_login.jsp");
				
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	

	}
	}
