# 🚀 CareerSync- Online Job Portal Management System

## 📌 Overview

**HireHub** is a Java-based Online Job Portal Management System that streamlines the recruitment process by connecting **Job Seekers** and **Recruiters** on a single platform.

The application allows recruiters to post and manage job opportunities while enabling job seekers to discover, apply for, and track job applications efficiently.

The project was developed during my internship using Java EE technologies and follows the **MVC (Model–View–Controller)** architecture.

---

# ✨ Key Features

## 👨‍🎓 Job Seeker

* User Registration & Login
* Secure Password Encoding
* Browse Available Jobs
* Search Jobs
* Apply for Jobs
* Duplicate Application Prevention
* View Application Status
* Withdraw Job Application
* Dashboard with Application Analytics
* Profile Update

---

## 👨‍💼 Recruiter

* Recruiter Registration & Login
* Post New Jobs
* Edit Existing Jobs
* Delete Jobs
* Manage Posted Jobs
* View Applicants
* Accept / Reject Candidates
* Recruiter Dashboard
* Job Statistics & Analytics

---

## 📧 Email Notification System

* Recruiters receive email notifications whenever a candidate applies for one of their jobs.
* Job Seekers receive email notifications whenever a recruiter posts a new job opportunity.

---

## 📊 Dashboard Analytics

### Recruiter Dashboard

* Total Jobs Posted
* Total Applications Received
* Accepted Candidates
* Rejected Candidates

### Job Seeker Dashboard

* Total Jobs Available
* Applied Jobs Count

---

## 🌙 User Experience

* Modern Responsive UI
* Dark / Light Theme Toggle
* Dashboard Cards
* Clean Navigation
* User-Friendly Interface

---

# 🛠 Tech Stack

### Backend

* Java
* Servlets
* JSP
* JSTL
* Hibernate ORM
* JPA

### Frontend

* HTML5
* CSS3
* JavaScript

### Database

* PostgreSQL

### Server

* Apache Tomcat

### Additional Libraries

* JavaMail API

---

# 🏗 Architecture

The project follows the MVC Architecture.

```text
Presentation Layer
        │
        ▼
 JSP + HTML + CSS + JavaScript
        │
        ▼
      Servlets
        │
        ▼
     DAO Layer
        │
        ▼
 Hibernate / JPA
        │
        ▼
    PostgreSQL
```

---

# 📂 Database Entities

### User

* Name
* Email
* Password
* Role

### Job

* Title
* Description
* Location
* Salary
* Recruiter

### Application

* Job
* Job Seeker
* Status

---

# ⚙️ Project Setup

1. Clone the repository.
2. Create a PostgreSQL database named **ojpms**.
3. Update the database username and password in **persistence.xml**.
4. Configure your Gmail address and App Password in **EmailUtil.java**.
5. Deploy the project on Apache Tomcat.
6. Run the application.

---

# 🚀 Future Enhancements

* Resume Upload & Download
* Advanced Job Filters
* Save Jobs
* Admin Dashboard
* Interview Scheduling
* Spring Boot Migration
* JWT Authentication
* REST APIs

---

# 📸 Screenshots

* Landing Page
* Job Seeker Dashboard
* Recruiter Dashboard
* Manage Jobs
* View Applicants
* Dark Mode

(Add screenshots inside a **screenshots/** folder.)

---

# 👨‍💻 Developer

**Jay Desale**

Developed as an Internship Project using Java, Servlets, JSP, Hibernate, JPA, PostgreSQL, and Apache Tomcat.
CareerSync