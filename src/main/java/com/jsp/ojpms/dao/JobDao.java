package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;
import com.sun.xml.fastinfoset.algorithm.BooleanEncodingAlgorithm;

public class JobDao {
	
	public static void savJob(Job job) {
		
		EntityManager em = JPAUtil.getEm() ;
		EntityTransaction et = em.getTransaction() ;
		
		User recruiter = job.getRecruiter() ;
		
		et.begin() ;
		em.persist(job) ;
//		em.persist(recruiter) ;
		et.commit() ;
		
//		em.close() ;
	}
	
	
	
	public static List<Job> getAllJob() {
		EntityManager em = JPAUtil.getEm() ;
		Query query = em.createQuery("FROM Job") ;
		List<Job> resultList = query.getResultList() ;
		
		return resultList ;
	}
	
	
	public static List<Job> searchJob(String search) {
		
		EntityManager em = JPAUtil.getEm();  
		
		/*
		 * Query query = em.createQuery("FROM Job WHERE title LIKE ?1 ") ;
		 * query.setParameter(1, "%" + search + "%") ; List list = query.getResultList()
		 * ;
		 * 
		 * return list ;
		 */
		
		return em.createQuery(

			    "SELECT j FROM Job j " +

			    "WHERE lower(j.title) " +
			    "LIKE lower(:key) " +

			    "OR lower(j.location) " +
			    "LIKE lower(:key) " +

			    "OR lower(j.description) " +
			    "LIKE lower(:key)",

			    Job.class)

			    .setParameter(
			        "key",
			        "%" + search + "%")
			    .getResultList();
	}
	
	
	public static List<Job> getJobsByRecruiter(int recruiterId){

	    EntityManager em = JPAUtil.getEm();

	    Query query = em.createQuery(
	        "FROM Job j WHERE j.recruiter.id=?1");

	    query.setParameter(1, recruiterId);

	    return query.getResultList();
	}
	
	public static void deleteJob(int id) {

	    EntityManager em = JPAUtil.getEm();

	    Job job = em.find(Job.class, id);

	    em.getTransaction().begin();

	    em.remove(job);

	    em.getTransaction().commit();
	}
	
	public static Job findJobById(int id) {

	    EntityManager em = JPAUtil.getEm();

	    return em.find(Job.class, id);
	}
	
	
	public static void updateJob (Job job) {
		EntityManager em = JPAUtil.getEm();

	    Job dbJob =
	        em.find(Job.class, job.getId());
	    
	    dbJob.setTitle(job.getTitle());
	    dbJob.setDescription(job.getDescription());
	    dbJob.setLocation(job.getLocation());
	    dbJob.setSalary(job.getSalary());
	    
	    em.getTransaction().begin();

	    em.merge(dbJob);

	    em.getTransaction().commit();
	}
	
	
	public static long countJobsByRecruiter(int recruiterId) {

	    EntityManager em = JPAUtil.getEm();

	    Long count = em.createQuery(
	            "SELECT COUNT(j) FROM Job j WHERE j.recruiter.id=:id",
	            Long.class)
	            .setParameter("id", recruiterId)
	            .getSingleResult();

	    return count;
	}
	
	public static long countJobs()
	{
	    EntityManager em =
	            JPAUtil.getEm();

	    Long count =
	    (Long) em.createQuery(
	    "SELECT COUNT(j) FROM Job j")
	    .getSingleResult();

	    return count;
	}

}
