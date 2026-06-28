package com.jsp.ojpms.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.PasswordUtil;

@WebServlet(value = "/edituserprofile")
public class EditUserProfileServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String strId = req.getParameter("id") ;
		String name = req.getParameter("name") ;
		String email = req.getParameter("email") ;
		String password = req.getParameter("password") ;
		String role = req.getParameter("role") ;
		
		System.out.println("Id : " + strId) ;
		System.out.println("Name : " + name );
		System.out.println("Email : " + email) ;
		System.out.println("Pass :" +  password) ;
		
		int id = Integer.parseInt(strId) ;
		
		
		User user = new User() ;
		
		user.setId(id);
		user.setName(name) ;
		user.setEmail(email);
		user.setRole(role);
		
		if(password != null && !password.trim().isEmpty()) {

		    String encode = PasswordUtil.encode(password);
		    user.setPassword(encode);

		}
		
		
		
		
		if(user.getRole().equals("JOB_SEEKER")) {
			UserDao.updateProfile(user) ;
			
			req.getSession().setAttribute("user", user);
			
		req.setAttribute("msg", "Profile update sccessfullyy");
		req.getRequestDispatcher("user-dashboard.jsp").forward(req, resp);
		
		}
		if(user.getRole().equals("RECRUITER")) {
			UserDao.updateProfile(user) ;
			
			req.getSession().setAttribute("user", user);
		
			req.setAttribute("msg", "Profile update sccessfullyy") ;
			req.getRequestDispatcher("recruiter-dashboard.jsp").forward(req, resp) ;
		}
			
		
		
	}

}
