package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.util.JPAUtil;

public class ApplicationDao {
	
	public static void saveApplication(Application app) {
		
		EntityManager em = JPAUtil.getEm() ;
		EntityTransaction et = em.getTransaction() ;
		
		et.begin() ;
		em.persist(app) ;
		et.commit() ;
	}
	
	
	public static boolean isAlreadyApplyed(int uId , int jobId ) {
		
		EntityManager em = JPAUtil.getEm() ;
		Query query = em.createQuery("FROM Application WHERE user.id=?1 AND job.id=?2") ;
		query.setParameter(1, uId) ;
		query.setParameter(2, jobId) ;
		
		List list = query.getResultList() ; 
		
		boolean empty = list.isEmpty() ;
		System.out.println("Empty " + empty) ;
		
		
		
		return  !empty ;
	}
	
	
	public static void deleteApplicationByJobId(int jobId) {

	    EntityManager em = JPAUtil.getEm();

	    em.getTransaction().begin();

	    em.createQuery(
	        "DELETE FROM Application a WHERE a.job.id=:jobId")
	      .setParameter("jobId", jobId)
	      .executeUpdate();

	    em.getTransaction().commit();
	}
	
	
	public static List<Application> getApplicationsByJobId(int jobId)
	{
	    EntityManager em = JPAUtil.getEm();

	    return em.createQuery(
	        "SELECT a FROM Application a WHERE a.job.id=:id",
	        Application.class)
	        .setParameter("id", jobId)
	        .getResultList();
	}
	
	
	
	public static Application updateStatus(
	        int applicationId,
	        String status)
	{
	    EntityManager em = JPAUtil.getEm();

	    Application app =
	            em.find(
	            Application.class,
	            applicationId);

	    em.getTransaction().begin();

	    app.setStatus(status);

	    em.getTransaction().commit();

	    return app;
	}
	
	
	
	public static List<Application> getApplicationsByUserId(int userId)
	{
	    EntityManager em = JPAUtil.getEm();

	    return em.createQuery(
	            "SELECT a FROM Application a WHERE a.user.id=:id",
	            Application.class)
	            .setParameter("id", userId)
	            .getResultList();
	}
	
	
	public static long countApplicationsByRecruiter(int recruiterId)
	{
	    EntityManager em = JPAUtil.getEm();

	    Long count =
	    (Long) em.createQuery(
	    "SELECT COUNT(a) " +
	    "FROM Application a " +
	    "WHERE a.job.recruiter.id=:rid")

	    .setParameter("rid", recruiterId)
	    .getSingleResult();

	    return count;
	}
	
	
	public static long countAcceptedByRecruiter(
	        int recruiterId)
	{
	    EntityManager em = JPAUtil.getEm();

	    Long count =
	    (Long) em.createQuery(
	    "SELECT COUNT(a) " +
	    "FROM Application a " +
	    "WHERE a.job.recruiter.id=:rid " +
	    "AND a.status='ACCEPTED'")

	    .setParameter("rid", recruiterId)
	    .getSingleResult();

	    return count;
	}
	
	public static long countPendingByRecruiter(
	        int recruiterId)
	{
	    EntityManager em = JPAUtil.getEm();

	    Long count =
	    (Long) em.createQuery(
	    "SELECT COUNT(a) " +
	    "FROM Application a " +
	    "WHERE a.job.recruiter.id=:rid " +
	    "AND a.status='APPLIED'")

	    .setParameter("rid", recruiterId)
	    .getSingleResult();

	    return count;
	}
	
	
	public static long countApplicationsByUser(
	        int userId)
	{
	    EntityManager em = JPAUtil.getEm();

	    Long count =
	    (Long) em.createQuery(
	    "SELECT COUNT(a) " +
	    "FROM Application a " +
	    "WHERE a.user.id=:uid")

	    .setParameter("uid", userId)
	    .getSingleResult();

	    return count;
	}
	
	public static void deleteApplication(
	        int applicationId)
	{
	    EntityManager em =
	            JPAUtil.getEm();

	    Application app =
	            em.find(
	                    Application.class,
	                    applicationId);

	    em.getTransaction().begin();

	    em.remove(app);

	    em.getTransaction().commit();
	}
	

}
