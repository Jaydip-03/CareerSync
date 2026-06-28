package com.jsp.ojpms.contoller;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.PasswordUtil;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email") ;
		String password = req.getParameter("password") ;
		
//		System.out.println("Email : " + email) ;
//		System.out.println("Password : " + password) ;
		
		String ecodepass = PasswordUtil.encode(password) ;
		
		User user = UserDao.getUser(email, ecodepass) ;
		
		System.out.println(user) ;
		
		if (user != null) {
			
			HttpSession session = req.getSession(true) ;
			session.setAttribute("user", user);
			
			if (user.getRole().equals("JOB_SEEKER")) {
				
				long appliedCount = 
						ApplicationDao.countApplicationsByUser(user.getId());

				session.setAttribute("appliedCount",appliedCount);
				
				long totalJobs =
				        JobDao.countJobs();

				session.setAttribute(
				        "totalJobs",
				        totalJobs);
				
				resp.sendRedirect("user-dashboard.jsp");
				
			}
			else if (user.getRole().equals("RECRUITER")) {
				
				long count =
				        JobDao.countJobsByRecruiter(user.getId());
				session.setAttribute("jobCount", count);
				
				long applicationCount =
				        ApplicationDao.countApplicationsByRecruiter(user.getId());

				session.setAttribute("applicationCount", applicationCount);
				
				long acceptedCount =
				        ApplicationDao.countAcceptedByRecruiter(user.getId());

				long pendingCount =
				        ApplicationDao.countPendingByRecruiter(
				                user.getId());

				session.setAttribute("acceptedCount",acceptedCount);

				session.setAttribute("pendingCount",pendingCount);
				
				
				resp.sendRedirect("recruiter-dashboard.jsp");
				
			}
			
		}
		else {
			req.setAttribute("error", "Invalid Crediantials") ;
			req.getRequestDispatcher("login.jsp").forward(req, resp) ;
		}
		
		
	}

}
