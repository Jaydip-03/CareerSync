package com.jsp.ojpms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.User;

@WebServlet(value = "/myapplications")
public class MyApplicationsServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session =
                req.getSession();

        User user =
                (User) session.getAttribute("user");

        List<Application> applications =
                ApplicationDao
                .getApplicationsByUserId(
                        user.getId());
        
        long count =
        		ApplicationDao
        		.countApplicationsByUser(
        		        user.getId());

        		session.setAttribute(
        		        "appliedCount",
        		        count);

        req.setAttribute(
                "applications",
                applications);

        req.getRequestDispatcher(
                "my-applications.jsp")
           .forward(req, resp);
		
	}
}
