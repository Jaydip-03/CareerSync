package com.jsp.ojpms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;

@WebServlet(value = "/viewapplicants")
public class ViewApplicantsServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	   int jobId = Integer.parseInt(req.getParameter("jobId"));
	   
	   List<Application> applications = ApplicationDao.getApplicationsByJobId(jobId) ;
	   
	   req.setAttribute("applications", applications);
	   
	   req.getRequestDispatcher("view-applicants.jsp")
          .forward(req, resp);
	}

}
