<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.jsp.ojpms.entity.Job" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page isELIgnored = "false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>
</head>
<body>
   <h1>JOBS ARE AVALABLE HERE </h1>
   
   <%
   List<Job> jobs = (List<Job>) request.getAttribute("jobs") ;
   
   for(Job j : jobs) {
	   
   
   %>
   
   <h3><%= j.getTitle() %></h3>
   <p><%= j.getDescription() %></p>
	<p><%= j.getLocation() %></p>
	
	<%
	}
	%>
	
	
	<form action="viewjob">
		<input type="text" name="search" placeholder="Search jobs here...">
		<input type="submit" value="search">
    </form>
    <c:if test="${empty jobs }">
    	<p style="color: red">NO JOB FOUND...</p>
    </c:if>
    <a href="viewjob"><button>Refresh</button></a>
	
	<c:forEach var="j" items="${jobs}">
			<div style="border: 2px solid black; margin: 10px; padding: 10px ">
			Title : ${j.getTitle()} <br>
			Description : ${j.getDescription() }<br>
			Location : ${j.getLocation() } <br>
			Salary : ${j.getSalary() }
			
			<form action="applyjob">
					<input type="text" hidden="" name="jobId" value="${j.id }">
					<input type="submit" value="Apply">
			</form>	
			
			<c:if test="${applyId==j.id }">
			<p style="color: red;">${error }</p>
			</c:if>
			
			</div>
			</c:forEach>
</body>
</html> --%>



<%-- 

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jsp.ojpms.entity.Job" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Explore Jobs | OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" href="css/theme.css">


<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f8fafc;
    color:#111827;
}

/* NAVBAR */

.navbar{
    width:90%;
    margin:20px auto;

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:18px 35px;

    background:rgba(255,255,255,.9);

    backdrop-filter:blur(12px);

    border-radius:20px;

    box-shadow:
    0 8px 30px rgba(0,0,0,.06);

    position:sticky;
    top:15px;

    z-index:1000;
}

.logo{
    font-size:34px;
    font-weight:800;
    color:#2563eb;
}

.nav-links{
    display:flex;
    gap:35px;
}

.nav-links a{
    text-decoration:none;
    color:#374151;
    font-weight:500;
    transition:.3s;
}

.nav-links a:hover{
    color:#2563eb;
}

.logout-btn{
    text-decoration:none;
    background:#2563eb;
    color:white;
    padding:12px 25px;
    border-radius:12px;
}

/* HERO */

.hero{
    text-align:center;
    margin-top:70px;
}

.hero h1{
    font-size:64px;
    font-weight:800;
}

.hero span{
    color:#2563eb;
}

.hero p{
    color:#6b7280;
    margin-top:15px;
    font-size:18px;
}

/* STATS */

.stats{
    width:90%;
    margin:50px auto;

    display:flex;
    justify-content:center;
    gap:25px;
}

.stat-card{
    background:white;

    padding:25px 40px;

    border-radius:20px;

    box-shadow:
    0 10px 25px rgba(0,0,0,.06);

    transition:.3s;
}

.stat-card:hover{
    transform:translateY(-5px);
}

.stat-card h2{
    color:#2563eb;
    text-align:center;
}

.stat-card p{
    color:#6b7280;
    margin-top:10px;
}

/* SEARCH */

.search-section{
    display:flex;
    justify-content:center;
    gap:15px;
    margin-top:35px;
}

.search-section input{

    width:700px;

    padding:18px;

    border:none;

    outline:none;

    border-radius:18px;

    background:white;

    box-shadow:
    0 10px 25px rgba(0,0,0,.08);
}

.search-section button{

    border:none;

    background:#2563eb;

    color:white;

    padding:18px 35px;

    border-radius:18px;

    cursor:pointer;

    font-weight:600;
}

/* FILTERS */

.filters{

    width:90%;

    margin:50px auto;

    display:flex;

    gap:15px;
}

.filter{

    padding:10px 20px;

    background:white;

    border-radius:25px;

    box-shadow:
    0 5px 15px rgba(0,0,0,.06);

    cursor:pointer;

    transition:.3s;
}

.filter:hover{

    background:#2563eb;

    color:white;
}

/* JOBS GRID */

.jobs{
    width:90%;
    margin:40px auto;

    display:grid;

    grid-template-columns:
    repeat(auto-fill,minmax(320px,320px));

    justify-content:center;

    gap:30px;
}

/* JOB CARD */

.job-card{
    background:#ffffff;

    border:1px solid #e5e7eb;

    border-radius:20px;

    padding:22px;

    min-height:300px;

    display:flex;
    flex-direction:column;

    transition:all .3s ease;

    box-shadow:
    0 8px 25px rgba(0,0,0,.05);
}

.job-card:hover{
    transform:translateY(-8px);

    box-shadow:
    0 20px 40px rgba(37,99,235,.15);
}



.company-logo{
    width:50px;
    height:50px;

    border-radius:50%;

    background:#dbeafe;

    color:#2563eb;

    display:flex;
    justify-content:center;
    align-items:center;

    font-size:22px;
    font-weight:700;

    margin-bottom:15px;
}

.badge{
    display:inline-block;

    width:fit-content;

    background:#e0edff;

    color:#2563eb;

    padding:6px 12px;

    border-radius:30px;

    font-size:11px;

    font-weight:600;

    margin-bottom:15px;
}

.company-name{
    color:#6b7280;

    font-size:14px;

    margin-bottom:15px;
}

.job-title{
    font-size:24px;

    font-weight:700;

    margin-bottom:10px;
}

.location{

    color:#6b7280;

    margin-bottom:15px;
}

.salary{
    color:#16a34a;

    font-size:18px;

    font-weight:700;

    margin-bottom:15px;
}

.job-type{
    display:inline-block;

    width:fit-content;

    background:#f3f4f6;

    color:#374151;

    padding:8px 14px;

    border-radius:20px;

    font-size:13px;

    margin-bottom:18px;
}

.description{
    color:#4b5563;

    font-size:14px;

    line-height:1.6;

    flex-grow:1;

    overflow:hidden;

    display:-webkit-box;

    -webkit-line-clamp:2;

    -webkit-box-orient:vertical;

    margin-bottom:20px;
}

.apply-btn{
    width:100%;

    border:none;

    background:#2563eb;

    color:white;

    padding:14px;

    border-radius:12px;

    cursor:pointer;

    font-size:15px;

    font-weight:600;

    transition:.3s;
}

.apply-btn:hover{
    background:#1d4ed8;

    transform:translateY(-2px);
}



.error{
    color:red;
    margin-top:10px;
}

.no-job{
    text-align:center;
    color:red;
    margin-top:30px;
}

</style>

</head>

<body>

<nav class="navbar">


<div class="logo">
    OJPMS
</div>

<div class="nav-links">
    <a href="home.jsp">Home</a>
    <a href="viewjob">Jobs</a>
    <a href="user-dashboard.jsp">Dashboard</a>
</div>

<a href="logout" class="logout-btn">
    Logout
</a>


</nav>

<div class="hero">

<h1>
    Find Your <span>Dream Job</span>
</h1>

<p>
    Discover opportunities from top recruiters and companies
</p>

<form action="viewjob" class="search-section">

    <input
        type="text"
        name="search"
        placeholder="Search jobs, skills, companies">

    <button>
        Find Jobs
    </button>

</form>


</div>

<div class="stats">


<div class="stat-card">
    <h2>10K+</h2>
    <p>Active Jobs</p>
</div>

<div class="stat-card">
    <h2>500+</h2>
    <p>Recruiters</p>
</div>

<div class="stat-card">
    <h2>25K+</h2>
    <p>Applications</p>
</div>


</div>

<div class="filters">


<div class="filter">Remote</div>
<div class="filter">Hybrid</div>
<div class="filter">Onsite</div>
<div class="filter">Full Time</div>


</div>

<c:if test="${empty jobs}"> <h2 class="no-job">No Jobs Found...</h2>
</c:if>

<div class="jobs">

<c:forEach var="j" items="${jobs}">

<div class="job-card">

    <div class="company-logo">
        ${j.title.substring(0,1)}
    </div>

    <span class="badge">
        Featured
    </span>

    <div class="job-title">
        ${j.title}
    </div>
    
    <div class="company-name">
    OJPMS Technologies
	</div>

    <div class="location">
        📍 ${j.location}
    </div>

    <div class="salary">
        ₹ ${j.salary}
    </div>

    <div class="job-type">
        Hybrid
    </div>

    <div class="description">
        ${j.description}
    </div>

    <form action="applyjob">

        <input
            type="hidden"
            name="jobId"
            value="${j.id}">

        <button class="apply-btn">
            Apply Now
        </button>

    </form>

    <c:if test="${applyId==j.id}">
        <p class="error">
            ${error}
        </p>
    </c:if>

</div>

</c:forEach>

</div>

<script src="js/theme.js"></script>

</body>
</html> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Explore Jobs | OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    /* COMPREHENSIVE VARIABLE SYSTEM MATCHING OUR GLASS/NEON THEME */
    :root {
        --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
        --text-main: #1e293b;
        --text-muted: #475569;
        --surface: #ffffff;
        --glass-bg: rgba(255, 255, 255, 0.45);
        --glass-border: rgba(255, 255, 255, 0.7);
        --primary: #a3e635; /* Lime green */
        --primary-hover: #84cc16;
        --shadow-color: rgba(0, 0, 0, 0.05);
        --orb-color: linear-gradient(135deg, #93c5fd, #a7f3d0);
        --card-bg: rgba(255, 255, 255, 0.6);
        --badge-bg: rgba(37, 99, 235, 0.1);
        --badge-text: #2563eb;
    }

    [data-theme="dark"] {
        --bg-gradient: linear-gradient(135deg, #0f172a 0%, #020617 100%);
        --text-main: #f8fafc;
        --text-muted: #94a3b8;
        --surface: #1e293b;
        --glass-bg: rgba(30, 41, 59, 0.55);
        --glass-border: rgba(255, 255, 255, 0.05);
        --primary: #a3e635; 
        --primary-hover: #bef264;
        --shadow-color: rgba(0, 0, 0, 0.25);
        --orb-color: linear-gradient(135deg, #3b82f6, #10b981);
        --card-bg: rgba(15, 23, 42, 0.4);
        --badge-bg: rgba(163, 230, 53, 0.15);
        --badge-text: #a3e635;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        background: var(--bg-gradient);
        color: var(--text-main);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        transition: background 0.4s ease, color 0.4s ease;
        overflow-x: hidden;
    }

    /* BACKGROUND ORBS */
    .abstract-orb {
        width: 500px; height: 500px;
        background: var(--orb-color);
        border-radius: 50%;
        filter: blur(90px);
        opacity: 0.5;
        position: fixed;
        z-index: -1;
        animation: rotateOrb 15s linear infinite;
    }
    .orb-1 { top: -100px; left: -100px; }
    .orb-2 { bottom: -150px; right: -5%; animation-delay: 4s; }

    @keyframes rotateOrb {
        0% { transform: scale(1) translate(0, 0); }
        50% { transform: scale(1.1) translate(20px, 30px); }
        100% { transform: scale(1) translate(0, 0); }
    }

    /* NAVIGATION BAR */
    .navbar {
        max-width: 1400px;
        width: 95%;
        margin: 20px auto 0;
        padding: 18px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: var(--glass-bg);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1px solid var(--glass-border);
        border-radius: 20px;
        box-shadow: 0 8px 30px var(--shadow-color);
        position: sticky;
        top: 15px;
        z-index: 1000;
    }

    .logo {
        font-size: 24px;
        font-weight: 800;
        color: var(--text-main);
        text-decoration: none;
        letter-spacing: -1px;
    }

    .nav-links {
        display: flex;
        gap: 35px;
        align-items: center;
    }

    .nav-links a {
        text-decoration: none;
        color: var(--text-muted);
        font-weight: 500;
        font-size: 14px;
        transition: color 0.3s;
    }

    .nav-links a:hover { color: var(--text-main); }

    .logout-btn {
        background: rgba(239, 68, 68, 0.15);
        color: #ef4444 !important;
        padding: 8px 20px;
        border-radius: 10px;
        font-weight: 600;
        font-size: 14px;
        transition: 0.3s;
    }
    .logout-btn:hover {
        background: #ef4444;
        color: white !important;
    }

    /* THEME TOGGLE */
    .theme-switch { position: relative; width: 44px; height: 24px; display: inline-block; }
    .theme-switch input { opacity: 0; width: 0; height: 0; }
    .slider {
        position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0;
        background-color: var(--surface); border: 1px solid var(--glass-border);
        transition: .4s; border-radius: 34px;
    }
    .slider:before {
        position: absolute; content: "☀️"; height: 16px; width: 16px; left: 3px; bottom: 3px;
        background-color: transparent; transition: .4s; font-size: 12px;
        display: flex; justify-content: center; align-items: center;
    }
    input:checked + .slider:before { transform: translateX(20px); content: "🌙"; }

    /* CORE INTEGRATED FEED LAYOUT CONTAINER */
    .feed-wrapper {
        max-width: 1400px;
        width: 95%;
        margin: 30px auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: 300px 1fr;
        gap: 30px;
        align-items: flex-start;
    }

    /* CONTROLS & FILTER PANELS (LEFT) */
    .filter-sidebar {
        padding: 30px 25px;
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    .sidebar-block h3 {
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 12px;
        color: var(--text-main);
    }

    .filter-tags {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .filter-item {
        padding: 12px 16px;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        border-radius: 12px;
        font-size: 13px;
        font-weight: 600;
        color: var(--text-muted);
        cursor: pointer;
        transition: 0.3s;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .filter-item:hover {
        border-color: var(--primary);
        color: var(--text-main);
        transform: translateX(3px);
    }

    /* SEARCH & FEED AREA (RIGHT) */
    .search-feed-container {
        display: flex;
        flex-direction: column;
        gap: 25px;
    }

    /* SEARCH PANEL UTILITY */
    .search-panel {
        padding: 20px;
        display: flex;
        gap: 15px;
    }

    .search-panel input {
        flex: 1;
        padding: 14px 20px;
        border: 1px solid var(--glass-border);
        border-radius: 14px;
        background: var(--surface);
        color: var(--text-main);
        font-size: 14px;
        font-weight: 500;
        outline: none;
        transition: 0.3s;
    }
    .search-panel input:focus {
        border-color: var(--primary);
    }

    .search-panel button {
        border: none;
        background: var(--primary);
        color: #1e293b;
        padding: 0 30px;
        border-radius: 14px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 700;
        transition: 0.3s;
    }
    .search-panel button:hover {
        background: var(--primary-hover);
        transform: translateY(-1px);
    }

    /* GRID FOR ACTIVE ROLES */
    .jobs-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr)); /* Clean wide rows */
        gap: 20px;
        width: 100%;
    }

    /* SYSTEM JOB CARD CARD */
    .job-card {
        background: var(--card-bg);
        border: 1px solid var(--glass-border);
        border-radius: 20px;
        padding: 25px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        min-height: 280px;
        transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }
    .job-card:hover {
        transform: translateY(-4px);
        border-color: var(--primary);
        box-shadow: 0 15px 30px var(--shadow-color);
    }

    .card-meta-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 15px;
    }

    /* SAFE ICON DESIGN WITH ZERO STRING METHODS */
    .company-avatar-placeholder {
        width: 45px;
        height: 45px;
        border-radius: 12px;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 20px;
    }

    .badge {
        padding: 4px 12px;
        background: var(--badge-bg);
        color: var(--badge-text);
        border-radius: 8px;
        font-size: 11px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .job-title {
        font-size: 20px;
        font-weight: 700;
        color: var(--text-main);
        letter-spacing: -0.5px;
        margin-bottom: 4px;
    }

    .company-name {
        font-size: 13px;
        color: var(--text-muted);
        font-weight: 500;
        margin-bottom: 15px;
    }

    .job-details-row {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        margin-bottom: 15px;
    }

    .detail-tag {
        font-size: 12px;
        font-weight: 600;
        color: var(--text-muted);
        background: rgba(255, 255, 255, 0.3);
        border: 1px solid var(--glass-border);
        padding: 4px 10px;
        border-radius: 6px;
    }
    .detail-tag.salary-tag {
        color: #16a34a;
        [data-theme="dark"] & { color: #4ade80; }
        background: rgba(22, 163, 74, 0.05);
    }

    .description {
        color: var(--text-muted);
        font-size: 13px;
        line-height: 1.5;
        margin-bottom: 20px;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .apply-btn {
        width: 100%;
        border: none;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        color: var(--text-main);
        padding: 12px;
        border-radius: 12px;
        cursor: pointer;
        font-size: 13px;
        font-weight: 700;
        transition: 0.2s;
    }
    .apply-btn:hover {
        background: var(--primary);
        color: #1e293b;
        border-color: var(--primary);
    }

    .error-tag {
        color: #ef4444;
        font-size: 11px;
        font-weight: 600;
        margin-top: 8px;
        text-align: center;
    }

    .no-job-banner {
        grid-column: 1 / -1;
        text-align: center;
        padding: 60px 20px;
        color: var(--text-muted);
        font-weight: 500;
    }
</style>
</head>
<body>

    <div class="abstract-orb orb-1"></div>
    <div class="abstract-orb orb-2"></div>

    <nav class="navbar">
        <a href="user-dashboard.jsp" class="logo">CareerSync</a>
        
        <div class="nav-links">
            <a href="user-dashboard.jsp">Dashboard</a>
            <a href="viewjob" style="color: var(--text-main); font-weight: 700;">Explore Jobs</a>
            
            <label class="theme-switch" title="Toggle Theme">
                <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
                <span class="slider"></span>
            </label>

            <a href="logout" class="logout-btn">Log out</a>
        </div>
    </nav>

    <div class="feed-wrapper">
        
        <aside class="filter-sidebar glass-card">
            <div class="sidebar-block">
                <h3>Work Environment</h3>
                <div class="filter-tags">
                    <div class="filter-item">🌐 Remote</div>
                    <div class="filter-item">🏢 Onsite</div>
                    <div class="filter-item">🤝 Hybrid</div>
                </div>
            </div>

            <div class="sidebar-block">
                <h3>Job Nature</h3>
                <div class="filter-tags">
                    <div class="filter-item">⚡ Full Time</div>
                    <div class="filter-item">⏱️ Part Time</div>
                </div>
            </div>
        </aside>

        <div class="search-feed-container">
            
            <form action="viewjob" method="GET" class="search-panel glass-card">
                <input type="text" name="search" placeholder="Search tech stacks, keywords, or locations..." value="${param.search}">
                <button type="submit">Find Opportunities</button>
            </form>

            <div class="jobs-grid">
                <c:if test="${empty jobs}">
                    <div class="no-job-banner glass-card">
                        <h2>No Open Postings Match Your Search Matrix</h2>
                        <p style="font-size: 13px; margin-top: 5px;">Try adjustments to your terms or work preferences.</p>
                    </div>
                </c:if>

                <c:forEach var="j" items="${jobs}">
                    <div class="job-card">
                        <div>
                            <div class="card-meta-header">
                                <div class="company-avatar-placeholder">💼</div>
                                <span class="badge">Active</span>
                            </div>

                            <div class="job-title">${j.title}</div>
                            <div class="company-name">OJPMS Partner Network</div>

                            <div class="job-details-row">
                                <div class="detail-tag">📍 ${j.location}</div>
                                <div class="detail-tag salary-tag">₹ ${j.salary}</div>
                                <div class="detail-tag">Hybrid</div>
                            </div>

                            <div class="description">${j.description}</div>
                        </div>

                        <div>
                            <form action="applyjob" method="GET">
                                <input type="hidden" name="jobId" value="${j.id}">
                                <button type="submit" class="apply-btn">Submit Profile</button>
                            </form>

                            <c:if test="${applyId == j.id}">
                                <p class="error-tag">${error}</p>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>

    <script>
        function toggleTheme() {
            const body = document.documentElement;
            if (body.getAttribute('data-theme') === 'dark') {
                body.removeAttribute('data-theme');
                localStorage.setItem('theme', 'light');
            } else {
                body.setAttribute('data-theme', 'dark');
                localStorage.setItem('theme', 'dark');
            }
        }

        window.onload = () => {
            if (localStorage.getItem('theme') === 'dark') {
                document.documentElement.setAttribute('data-theme', 'dark');
                document.getElementById('themeToggle').checked = true;
            }
        }
    </script>
</body>
</html> 


<%-- 

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Explore Jobs | OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    /* CORE THEME VARIABLES */
    :root {
        --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
        --text-main: #1e293b;
        --text-muted: #475569;
        --surface: #ffffff;
        --glass-bg: rgba(255, 255, 255, 0.45);
        --glass-border: rgba(255, 255, 255, 0.7);
        --primary: #a3e635; /* Lime green */
        --primary-hover: #84cc16;
        --shadow-color: rgba(0, 0, 0, 0.04);
        --orb-color: linear-gradient(135deg, #93c5fd, #a7f3d0);
        --card-bg: rgba(255, 255, 255, 0.6);
        --badge-bg: rgba(37, 99, 235, 0.1);
        --badge-text: #2563eb;
        --nav-active-bg: rgba(255, 255, 255, 0.8);
        --header-bg: rgba(255, 255, 255, 0.6);
        --header-border: rgba(255, 255, 255, 0.5);
    }

    [data-theme="dark"] {
        --bg-gradient: linear-gradient(135deg, #0f172a 0%, #020617 100%);
        --text-main: #f8fafc;
        --text-muted: #94a3b8;
        --surface: #1e293b;
        --glass-bg: rgba(30, 41, 59, 0.55);
        --glass-border: rgba(255, 255, 255, 0.05);
        --primary: #a3e635; 
        --primary-hover: #bef264;
        --shadow-color: rgba(0, 0, 0, 0.25);
        --orb-color: linear-gradient(135deg, #3b82f6, #10b981);
        --card-bg: rgba(15, 23, 42, 0.4);
        --badge-bg: rgba(163, 230, 53, 0.15);
        --badge-text: #a3e635;
        --nav-active-bg: rgba(255, 255, 255, 0.07);
        --header-bg: rgba(15, 23, 42, 0.4);
        --header-border: rgba(255, 255, 255, 0.03);
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        background: var(--bg-gradient);
        color: var(--text-main);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        transition: background 0.4s ease, color 0.4s ease;
        overflow-x: hidden;
    }

    /* BACKGROUND ORBS */
    .abstract-orb {
        width: 500px; height: 500px;
        background: var(--orb-color);
        border-radius: 50%;
        filter: blur(90px);
        opacity: 0.5;
        position: fixed;
        z-index: -1;
        animation: rotateOrb 15s linear infinite;
    }
    .orb-1 { top: -100px; left: -100px; }
    .orb-2 { bottom: -150px; right: -5%; animation-delay: 4s; }

    @keyframes rotateOrb {
        0% { transform: scale(1) translate(0, 0); }
        50% { transform: scale(1.1) translate(20px, 30px); }
        100% { transform: scale(1) translate(0, 0); }
    }

    /* FULL-WIDTH INTEGRATED HEADER LAYOUT (HOME DASHBOARD STYLE) */
    header {
        width: 100%;
        background: var(--header-bg);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        border-bottom: 1px solid var(--header-border);
        box-shadow: 0 4px 20px var(--shadow-color);
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .header-container {
        max-width: 1400px;
        margin: 0 auto;
        padding: 16px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        font-size: 24px;
        font-weight: 800;
        color: var(--text-main);
        text-decoration: none;
        letter-spacing: -1px;
    }

    /* Modern Link Capsule Menu Container */
    .nav-links-container {
        display: flex;
        align-items: center;
        background: rgba(0, 0, 0, 0.03);
        [data-theme="dark"] & { background: rgba(255, 255, 255, 0.02); }
        padding: 4px;
        border-radius: 14px;
        gap: 4px;
    }

    .nav-link {
        text-decoration: none;
        color: var(--text-muted);
        font-weight: 600;
        font-size: 13px;
        padding: 6px 16px;
        border-radius: 10px;
        transition: all 0.3s ease;
    }

    .nav-link:hover {
        color: var(--text-main);
    }

    .nav-link.active {
        background: var(--nav-active-bg);
        color: var(--text-main);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        border: 1px solid var(--glass-border);
    }

    /* Action Segments */
    .nav-right-actions {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .profile-quick-avatar {
        width: 36px;
        height: 36px;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        text-decoration: none;
        font-size: 15px;
        box-shadow: 0 4px 8px var(--shadow-color);
        transition: 0.3s;
    }
    .profile-quick-avatar:hover {
        transform: scale(1.05);
        border-color: var(--primary);
    }

    .logout-btn {
        text-decoration: none;
        background: rgba(239, 68, 68, 0.12);
        color: #ef4444 !important;
        padding: 8px 16px;
        border-radius: 10px;
        font-weight: 600;
        font-size: 13px;
        transition: 0.3s;
    }
    .logout-btn:hover {
        background: #ef4444;
        color: white !important;
        box-shadow: 0 4px 12px rgba(239, 68, 68, 0.15);
    }

    /* THEME SWITCH */
    .theme-switch { position: relative; width: 44px; height: 24px; display: inline-block; }
    .theme-switch input { opacity: 0; width: 0; height: 0; }
    .slider {
        position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0;
        background-color: var(--surface); border: 1px solid var(--glass-border);
        transition: .4s; border-radius: 34px;
    }
    .slider:before {
        position: absolute; content: "☀️"; height: 16px; width: 16px; left: 3px; bottom: 3px;
        background-color: transparent; transition: .4s; font-size: 12px;
        display: flex; justify-content: center; align-items: center;
    }
    input:checked + .slider:before { transform: translateX(20px); content: "🌙"; }

    /* CORE INTERFACE WORKSPACE LAYOUT */
    .feed-wrapper {
        max-width: 1400px;
        width: 105%;
        margin: 30px auto;
        padding: 0 40px;
        display: grid;
        grid-template-columns: 280px 1fr;
        gap: 35px;
        align-items: flex-start;
    }

    /* FILTERS SIDEBAR */
    .filter-sidebar {
        padding: 25px 20px;
        display: flex;
        flex-direction: column;
        gap: 24px;
        background: var(--glass-bg);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1px solid var(--glass-border);
        border-radius: 20px;
    }

    .sidebar-block h3 {
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 12px;
        color: var(--text-main);
    }

    .filter-tags {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .filter-item {
        padding: 10px 14px;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        border-radius: 10px;
        font-size: 13px;
        font-weight: 600;
        color: var(--text-muted);
        cursor: pointer;
        transition: 0.3s;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .filter-item:hover {
        border-color: var(--primary);
        color: var(--text-main);
        transform: translateX(3px);
    }

    /* SEARCH PANEL AND GRID ROW (RIGHT) */
    .search-feed-container {
        display: flex;
        flex-direction: column;
        gap: 25px;
    }

    .search-panel {
        padding: 15px 20px;
        display: flex;
        gap: 15px;
        background: var(--glass-bg);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1px solid var(--glass-border);
        border-radius: 20px;
    }

    .search-panel input {
        flex: 1;
        padding: 12px 18px;
        border: 1px solid var(--glass-border);
        border-radius: 12px;
        background: var(--surface);
        color: var(--text-main);
        font-size: 14px;
        font-weight: 500;
        outline: none;
        transition: 0.3s;
    }
    .search-panel input:focus { border-color: var(--primary); }

    .search-panel button {
        border: none;
        background: var(--primary);
        color: #1e293b;
        padding: 0 25px;
        border-radius: 12px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 700;
        transition: 0.3s;
    }
    .search-panel button:hover {
        background: var(--primary-hover);
        transform: translateY(-1px);
    }

    /* JOBS FEED */
    .jobs-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 20px;
        width: 100%;
    }

    .job-card {
        background: var(--card-bg);
        border: 1px solid var(--glass-border);
        border-radius: 20px;
        padding: 25px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        min-height: 280px;
        transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }
    .job-card:hover {
        transform: translateY(-4px);
        border-color: var(--primary);
        box-shadow: 0 15px 30px var(--shadow-color);
    }

    .card-meta-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 15px;
    }

    .company-avatar-placeholder {
        width: 45px;
        height: 45px;
        border-radius: 12px;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 20px;
    }

    .badge {
        padding: 4px 12px;
        background: var(--badge-bg);
        color: var(--badge-text);
        border-radius: 8px;
        font-size: 11px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .job-title {
        font-size: 20px;
        font-weight: 700;
        color: var(--text-main);
        letter-spacing: -0.5px;
        margin-bottom: 4px;
    }

    .company-name {
        font-size: 13px;
        color: var(--text-muted);
        font-weight: 500;
        margin-bottom: 15px;
    }

    .job-details-row {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        margin-bottom: 15px;
    }

    .detail-tag {
        font-size: 12px;
        font-weight: 600;
        color: var(--text-muted);
        background: rgba(255, 255, 255, 0.3);
        border: 1px solid var(--glass-border);
        padding: 4px 10px;
        border-radius: 6px;
    }
    .detail-tag.salary-tag {
        color: #16a34a;
        [data-theme="dark"] & { color: #4ade80; }
        background: rgba(22, 163, 74, 0.05);
    }

    .description {
        color: var(--text-muted);
        font-size: 13px;
        line-height: 1.5;
        margin-bottom: 20px;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .apply-btn {
        width: 100%;
        border: none;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        color: var(--text-main);
        padding: 12px;
        border-radius: 12px;
        cursor: pointer;
        font-size: 13px;
        font-weight: 700;
        transition: 0.2s;
    }
    .apply-btn:hover {
        background: var(--primary);
        color: #1e293b;
        border-color: var(--primary);
    }

    .error-tag {
        color: #ef4444;
        font-size: 11px;
        font-weight: 600;
        margin-top: 8px;
        text-align: center;
    }

    .no-job-banner {
        grid-column: 1 / -1;
        text-align: center;
        padding: 60px 20px;
        color: var(--text-muted);
        font-weight: 500;
    }
</style>
</head>
<body>

    <div class="abstract-orb orb-1"></div>
    <div class="abstract-orb orb-2"></div>

    <!-- UPGRADED FIXED TOP NAVBAR CONTAINER -->
    <header>
        <div class="header-container">
            <a href="user-dashboard.jsp" class="logo">OJPMS.</a>
            
            <!-- Capsule Menu Items -->
            <div class="nav-links-container">
                <a href="user-dashboard.jsp" class="nav-link">Dashboard</a>
                <a href="viewjob" class="nav-link active">Explore Jobs</a>
            </div>
            
            <!-- System Controls -->
            <div class="nav-right-actions">
                <label class="theme-switch" title="Toggle Theme">
                    <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
                    <span class="slider"></span>
                </label>
                
                <a href="profile" class="profile-quick-avatar" title="View Profile">👤</a>
                <a href="logout" class="logout-btn">Log out</a>
            </div>
        </div>
    </header>

    <!-- Workspace Layout Container -->
    <div class="feed-wrapper">
        
        <!-- Filter Controls Sidebar -->
        <aside class="filter-sidebar">
            <div class="sidebar-block">
                <h3>Work Environment</h3>
                <div class="filter-tags">
                    <div class="filter-item">🌐 Remote</div>
                    <div class="filter-item">🏢 Onsite</div>
                    <div class="filter-item">🤝 Hybrid</div>
                </div>
            </div>

            <div class="sidebar-block">
                <h3>Job Nature</h3>
                <div class="filter-tags">
                    <div class="filter-item">⚡ Full Time</div>
                    <div class="filter-item">⏱️ Part Time</div>
                </div>
            </div>
        </aside>

        <!-- Main Content Area -->
        <div class="search-feed-container">
            
            <form action="viewjob" method="GET" class="search-panel">
                <input type="text" name="search" placeholder="Search tech stacks, keywords, or locations..." value="${param.search}">
                <button type="submit">Find Opportunities</button>
            </form>

            <div class="jobs-grid">
                <c:if test="${empty jobs}">
                    <div class="no-job-banner glass-card">
                        <h2>No Open Postings Match Your Search Matrix</h2>
                        <p style="font-size: 13px; margin-top: 5px;">Try adjustments to your terms or work preferences.</p>
                    </div>
                </c:if>

                <c:forEach var="j" items="${jobs}">
                    <div class="job-card">
                        <div>
                            <div class="card-meta-header">
                                <div class="company-avatar-placeholder">💼</div>
                                <span class="badge">Active</span>
                            </div>

                            <div class="job-title">${j.title}</div>
                            <div class="company-name">OJPMS Partner Network</div>

                            <div class="job-details-row">
                                <div class="detail-tag">📍 ${j.location}</div>
                                <div class="detail-tag salary-tag">₹ ${j.salary}</div>
                                <div class="detail-tag">Hybrid</div>
                            </div>

                            <div class="description">${j.description}</div>
                        </div>

                        <div>
                            <form action="applyjob" method="GET">
                                <input type="hidden" name="jobId" value="${j.id}">
                                <button type="submit" class="apply-btn">Submit Profile</button>
                            </form>

                            <c:if test="${applyId == j.id}">
                                <p class="error-tag">${error}</p>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>

    <script>
        function toggleTheme() {
            const body = document.documentElement;
            if (body.getAttribute('data-theme') === 'dark') {
                body.removeAttribute('data-theme');
                localStorage.setItem('theme', 'light');
            } else {
                body.setAttribute('data-theme', 'dark');
                localStorage.setItem('theme', 'dark');
            }
        }

        window.onload = () => {
            if (localStorage.getItem('theme') === 'dark') {
                document.documentElement.setAttribute('data-theme', 'dark');
                document.getElementById('themeToggle').checked = true;
            }
        }
    </script>
</body>
</html> --%>

