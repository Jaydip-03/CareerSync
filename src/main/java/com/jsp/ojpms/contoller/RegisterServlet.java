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


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name") ;
		String email = req.getParameter("email") ;
		String password = req.getParameter("password") ;
		String role = req.getParameter("role") ;
		
		System.out.println("Name : " +   name) ;
		System.out.println("Email : " + email) ;
		System.out.println("pass : " + password) ;
		System.out.println("Role : " + role) ;
		
		String encodePass = PasswordUtil.encode(password) ;
		
		User user = new User(name, email, encodePass, role) ;
		
		UserDao.save(user);
		
		resp.sendRedirect("login.jsp") ;
	}

}
