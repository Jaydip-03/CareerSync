package com.jsp.ojpms.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.User;

@WebServlet(value = "/withdrawapplication")
public class WithdrawApplicationServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 int applicationId =
			        Integer.parseInt(
			        req.getParameter(
			        "applicationId"));

		
		// Delete application
		    ApplicationDao.deleteApplication(
		            applicationId);

		    // Get session
		    HttpSession session =
		            req.getSession();

		    User user =
		            (User) session.getAttribute(
		                    "user");

		    // Recalculate applied count
		    long count =
		            ApplicationDao
		            .countApplicationsByUser(
		                    user.getId());

		    session.setAttribute(
		            "appliedCount",
		            count);

		    resp.sendRedirect(
		            "myapplications?msg=withdrawn");
		    
		    
		 
     }
}
