package com.jsp.ojpms.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;

@WebServlet(value = "/updatejob")
public class UpdateJobServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id =
	            Integer.parseInt(req.getParameter("id"));

	        String title =
	            req.getParameter("title");

	        String description =
	            req.getParameter("description");

	        String location =
	            req.getParameter("location");

	        double salary =
	            Double.parseDouble(
	                req.getParameter("salary"));

	        Job job = new Job();
	        
	        job.setId(id);
	        job.setTitle(title);
	        job.setDescription(description);
	        job.setLocation(location);
	        job.setSalary(salary);
	        
	        JobDao.updateJob(job);

	        resp.sendRedirect("myjobs");
	}

}
