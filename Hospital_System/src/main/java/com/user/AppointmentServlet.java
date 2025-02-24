package com.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		 int userId = Integer.parseInt(req.getParameter("userid"));
         String fullName = req.getParameter("fullName");
         String gender = req.getParameter("gender");
         String age = req.getParameter("age");
         String appointmentDate = req.getParameter("appointmentDate");
         String email = req.getParameter("email");
         String phoneNo = req.getParameter("phoneNo");
         String diseases = req.getParameter("diseases");
         int doctorId = Integer.parseInt(req.getParameter("doctor"));
         String address = req.getParameter("address");
    
         Appointment ap = new Appointment( userId, fullName, gender, age, appointmentDate, email, phoneNo, diseases, doctorId, address, "Pending");
		
		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
		
		HttpSession session= req.getSession();
		
		
		if(dao.addAppointment(ap)) {
			session.setAttribute("succMsg", "Appointment Succesfull");
			resp.sendRedirect("user_appointment.jsp");
		}
		else {
			session.setAttribute("errorMsg","Something Wrong on Server");
			resp.sendRedirect("user_appointment.jsp");
		}
	}

	
	
}
