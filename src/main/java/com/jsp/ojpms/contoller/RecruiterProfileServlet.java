package com.jsp.ojpms.contoller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet(value = "/recruiterprofile")
public class RecruiterProfileServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String strId = req.getParameter("id") ;
		System.out.println(strId);
		
		int id = Integer.parseInt(strId) ;
		
		EntityManager em = JPAUtil.getEm() ;
		User user = em.find(User.class, id) ;
		
		req.setAttribute("user", user) ;
		req.getRequestDispatcher("profile.jsp").forward(req, resp) ;
	}

}
