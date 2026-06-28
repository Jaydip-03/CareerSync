package com.jsp.ojpms.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.User;

@WebServlet(value = "/deletejob")
public class DeleteJobServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  int jobId =
		            Integer.parseInt(req.getParameter("jobId"));
		  
		  ApplicationDao.deleteApplicationByJobId(jobId);
		  
		  JobDao.deleteJob(jobId);
		  
		  User recruiter =
			        (User) req.getSession()
			                  .getAttribute("user");

			long count =
			        JobDao.countJobsByRecruiter(
			                recruiter.getId());

			req.getSession()
			   .setAttribute("jobCount", count);
		  
		  resp.sendRedirect("myjobs");
	}

}
