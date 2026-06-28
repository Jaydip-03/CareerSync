package com.jsp.ojpms.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;

@WebServlet(value = "/editjob")
public class EditJobServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int jobId =
	            Integer.parseInt(req.getParameter("jobId"));

	        Job job = JobDao.findJobById(jobId);
	        
	        req.setAttribute("job", job);

	        req.getRequestDispatcher("edit-job.jsp")
	           .forward(req, resp);
	}

}
