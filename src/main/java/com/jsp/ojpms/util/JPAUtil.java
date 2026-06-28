package com.jsp.ojpms.util;

import javax.persistence.EntityManager; 
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/*
 * public class JPAUtil {
 * 
 * private JPAUtil() {
 * 
 * }
 * 
 * private static EntityManager em = null ;
 * 
 * public static EntityManager getEm() { if(em == null) { EntityManagerFactory
 * emf = Persistence.createEntityManagerFactory("jsp") ;
 * 
 * em = emf.createEntityManager() ; }
 * 
 * return em ; }
 * 
 * }
 */



public class JPAUtil {

    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("jsp");

    private JPAUtil() {

    }

    public static EntityManager getEm() {

        return emf.createEntityManager();

    }

}