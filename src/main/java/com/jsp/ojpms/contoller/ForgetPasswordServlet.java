package com.jsp.ojpms.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.util.PasswordUtil;

@WebServlet("/reset")
public class ForgetPasswordServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email") ;
		String password = req.getParameter("password") ;
		
		System.out.println("Email " + email +" : " + password);
		
		String encode = PasswordUtil.encode(password) ;
		
		if (UserDao.updatePassword(email, encode)) {
			
			req.setAttribute("msg", "Password reset succesfully") ;
			req.getRequestDispatcher("login.jsp").forward(req, resp) ;
		}
		else {
			req.setAttribute("msg" , "Email not regesterd..");
			req.getRequestDispatcher("reset.jsp").forward(req, resp);
		}
	}
	

}
