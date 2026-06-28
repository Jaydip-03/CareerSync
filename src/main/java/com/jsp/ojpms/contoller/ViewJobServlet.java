package com.jsp.ojpms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;

@WebServlet(value = "/viewjob")
public class ViewJobServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String search = req.getParameter("search") ;
		System.out.println(search);
		if (search != null && !search.trim().isEmpty()) {
			System.out.println(search);
			
			List<Job> searchJob = JobDao.searchJob(search) ;
			req.setAttribute("jobs", searchJob) ;
			req.getRequestDispatcher("viewjob.jsp").forward(req, resp) ;
			
		}
		else {
			
		List<Job> allJob = JobDao.getAllJob() ;
//		for(Job j : allJob) 
//			System.out.println(j);
		
		req.setAttribute("jobs" , allJob) ;
		req.getRequestDispatcher("viewjob.jsp").forward(req, resp) ;
		}
		
	}

}
