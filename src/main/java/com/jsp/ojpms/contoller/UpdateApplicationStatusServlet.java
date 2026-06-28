package com.jsp.ojpms.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.util.EmailUtil;

@WebServlet(value = "/updateapplicationstatus")
public class UpdateApplicationStatusServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int appId =
	            Integer.parseInt(
	                req.getParameter(
	                    "applicationId"));

	        String status =
	            req.getParameter(
	                "status");

	        Application app =
	                ApplicationDao.updateStatus(
	                        appId,
	                        status);
	        
	        String email = app.getUser().getEmail() ;
	        String title = app.getJob().getTitle() ;
	        
	        if(status.equals("ACCEPTED"))
	        {
	            EmailUtil.sendEmail(
	                    email,
	                    "Application Accepted",
	                    "Congratulations!\n\n" +
	                    "Your application for "
	                    + title +
	                    " has been accepted.");
	        }
	        
	        if(status.equals("REJECTED"))
	        {
	            EmailUtil.sendEmail(
	                    email,
	                    "Application Status Update",
	                    "Thank you for applying for "
	                    + title +
	                    ".\n\nUnfortunately your application was not selected.");
	        }

	        resp.sendRedirect(
	                "viewapplicants?jobId="
	                + req.getParameter("jobId"));
	}

}
