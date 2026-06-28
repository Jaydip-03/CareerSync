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
import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.EmailUtil;

@WebServlet("/postjob")
public class PostJobServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title") ;
		String desc = req.getParameter("description") ;
		String location = req.getParameter("location") ;
		String salary = req.getParameter("salary") ;
		
		System.out.println(title) ;
		System.out.println(desc) ;
		System.out.println(location) ;
		System.out.println(salary) ;
		
		
		Job job = new Job() ;
		job.setTitle(title) ;
		job.setDescription(desc) ;
		job.setLocation(location) ;
		job.setSalary(Double.parseDouble(salary)) ;
		
		HttpSession session = req.getSession() ;
		User recruiter = (User) session.getAttribute("user") ;
		
		job.setRecruiter(recruiter) ;
		
		JobDao.savJob(job);
		
		List<User> jobSeekers =
		        UserDao.getAllJobSeekers();
		
		String subject =
		        "New Job Posted : "
		        + job.getTitle();

		String message =
		        "Hello,\n\n" +

		        "A new job has been posted.\n\n" +

		        "Title : "
		        + job.getTitle() + "\n" +

		        "Location : "
		        + job.getLocation() + "\n" +

		        "Salary : ₹"
		        + job.getSalary() + "\n\n" +

		        "Login to OJPMS and apply now.\n\n" +

		        "Best Regards\n" +
		        "OJPMS Team";
		
		for(User u : jobSeekers)
		{
		    EmailUtil.sendEmail(
		            u.getEmail(),
		            subject,
		            message);
		}
		
		long count =
		        JobDao.countJobsByRecruiter(
		                recruiter.getId());

		req.getSession()
		   .setAttribute("jobCount", count);
		
		resp.sendRedirect("post-job.jsp") ;
		
		
		
	}
	
	

}
