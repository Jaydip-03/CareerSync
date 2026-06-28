package com.jsp.ojpms.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "applications")
public class Application {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id ;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	private Job job ;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	private User user ;
	
	
	private String status="APPLIED" ;
	
	public Application() {
		
	}

	public Application(Job job, User user, String status) {
		super();
		this.job = job;
		this.user = user;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Application [id=" + id + ", job=" + job + ", user=" + user + ", status=" + status + "]";
	}
	
	
	
	
	

}
