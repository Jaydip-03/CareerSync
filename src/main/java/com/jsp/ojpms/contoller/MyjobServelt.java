package com.jsp.ojpms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;

@WebServlet(value = "/myjobs")
public class MyjobServelt extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession() ;
		
		 User recruiter =
	                (User) session.getAttribute("user");
		 
		 List<Job> jobs =
	                JobDao.getJobsByRecruiter(recruiter.getId());
		 
		 req.setAttribute("jobs", jobs) ;
		 
		 req.getRequestDispatcher("myjobs.jsp")
         .forward(req, resp);
		 
	}
	

}
