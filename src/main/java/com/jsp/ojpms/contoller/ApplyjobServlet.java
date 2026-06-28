package com.jsp.ojpms.contoller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.EmailUtil;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet(value = "/applyjob")
public class ApplyjobServlet extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String strId = req.getParameter("jobId") ;
		System.out.println("jobId : " + strId);
		
		int id = Integer.parseInt(strId) ;
		
		
		HttpSession session = req.getSession() ;
		User user =(User) session.getAttribute("user") ;
		
		EntityManager em = JPAUtil.getEm() ;
		Job job = em.find(Job.class, id) ;
		
		
//		System.out.println(ApplicationDao.isAlreadyApplyed(user.getId(), job.getId()));
		
		Application application = new Application() ;
		application.setJob(job) ;
		application.setUser(user) ;
		
		if(ApplicationDao.isAlreadyApplyed(user.getId(), job.getId())) {
			System.out.println("Alreadyyy aplyed");	
			
//			req.setAttribute("id", id) ;
			req.setAttribute("error", "Alreadyyy applyed") ; 
			req.setAttribute("applyId", id);
			
			List<Job> list = JobDao.getAllJob() ;
			req.setAttribute("jobs", list) ;
			
			
			req.getRequestDispatcher("viewjob.jsp").forward(req, resp) ; 
			
		}
		else {
			
			ApplicationDao.saveApplication(application) ;
			
			
			long count =
			        ApplicationDao
			        .countApplicationsByUser(
			                user.getId());

			session.setAttribute("appliedCount", count);
			
			
			
			String subject = "Application for" + job.getTitle() ;
			String message = "Hello " + user.getName() + " , \n \n " + "Ypu have successfully " + 
								"Applied for job :" + job.getTitle() + " Location : " + job.getLocation() + 
								"Best regards \n Job Portal Team " ;
			
			EmailUtil.sendEmail(user.getEmail(), subject , message) ;
			System.out.println(user.getEmail());
			
			
			// recruiter email 
			
			User recruiter = job.getRecruiter() ;
			String recruiterSubject = "New Application for " + job.getTitle() ;
			String recruiterMessage = "Hello \n \n A new Candidate has applied ... \n \n " + 
									  "Name : " + user.getName() +"\n" +
									  "Email: " + user.getEmail() + "\n" +
									  "Please logine to preview ... ... ..." +
									  "Best Regards \n Job portal Team .. " ;
			
			EmailUtil.sendEmail(recruiter.getEmail(), recruiterSubject, recruiterMessage) ;
			
		
			resp.sendRedirect("viewjob") ;	
				
		}
		
//		resp.sendRedirect("viewjob") ;
		
		
	}
	

}
