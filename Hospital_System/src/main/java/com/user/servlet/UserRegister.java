package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String fullName=req.getParameter("full_name");
			String email= req.getParameter("email");
			String password=req.getParameter("password");
			
			User u= new User(fullName, email,password);
			
			UserDAO dao= new UserDAO(DBConnect.getConn());
			
			boolean t=dao.userRegister(u);
			
			HttpSession session = req.getSession()
;			
			if(t==true) {
				
				session.setAttribute("succMsg", "Registered Succesfully");
				resp.sendRedirect("signup.jsp");
				
//				System.out.println("data insert succ");
			}
			
			else {
				
				session.setAttribute("errorMsg", "Something Wrong");
				resp.sendRedirect("signup.jsp");
				//System.out.println(" faltu yarr");
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
	
}
