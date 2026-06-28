<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
   if(session.getAttribute("user") == null)
	   response.sendRedirect("login.jsp") ;
%> 

<h1>Welcome to Recruiter dashboard</h1>

<h1>Welcome ${user.getName()}</h1>

<a href="post-job.jsp">post_job</a>
<a href="logout">Logout</a>

</body>
</html> --%>

<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<%
if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Dashboard | OJPMS</title>

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
padding:18px 35px;

display:flex;
justify-content:space-between;
align-items:center;

background:white;
border-radius:20px;

box-shadow:0 10px 30px rgba(0,0,0,.08);
}

.logo{
font-size:34px;
font-weight:800;
color:#2563eb;
}

.logout-btn{
text-decoration:none;
background:#2563eb;
color:white;
padding:12px 25px;
border-radius:12px;
font-weight:600;
}

/* HERO */

.hero{
width:90%;
margin:50px auto;
}

.hero h1{
font-size:50px;
font-weight:800;
margin-bottom:10px;
}

.hero span{
color:#2563eb;
}

.hero p{
color:#6b7280;
font-size:18px;
}

/* STATS */

.stats{
width:90%;
margin:40px auto;

display:grid;
grid-template-columns:
repeat(auto-fit,minmax(250px,1fr));

gap:25px;
}

.stat-card{
background:white;
padding:30px;

border-radius:20px;

box-shadow:
0 10px 25px rgba(0,0,0,.08);

transition:.3s;
}

.stat-card:hover{
transform:translateY(-8px);
}

.stat-number{
font-size:40px;
font-weight:800;
color:#2563eb;
}

.stat-title{
margin-top:10px;
color:#6b7280;
}

/* ACTIONS */

.actions{
width:90%;
margin:50px auto;

display:flex;
gap:20px;
flex-wrap:wrap;
}

.action-btn{
text-decoration:none;
background:#2563eb;
color:white;

padding:16px 30px;

border-radius:14px;

font-weight:600;

transition:.3s;
}

.action-btn:hover{
transform:translateY(-4px);
}

.secondary-btn{
background:white;
color:#111827;
box-shadow:0 5px 15px rgba(0,0,0,.08);
}

/* RECENT JOBS */

.section{
width:90%;
margin:50px auto;
}

.section h2{
font-size:35px;
margin-bottom:25px;
}

.jobs{
display:grid;

grid-template-columns:
repeat(auto-fit,minmax(300px,1fr));

gap:25px;
}

.job-card{
background:white;
padding:25px;
border-radius:20px;

box-shadow:
0 10px 25px rgba(0,0,0,.08);

transition:.3s;
}

.job-card:hover{
transform:translateY(-8px);
}

.job-card h3{
margin-bottom:10px;
}

.job-card p{
color:#6b7280;
margin-bottom:10px;
}

.badge{
display:inline-block;

padding:8px 15px;

background:#dbeafe;
color:#2563eb;

border-radius:20px;

font-size:13px;
font-weight:600;
}

</style>
</head>

<body>

<nav class="navbar">

<div class="logo">
OJPMS
</div>

<a href="logout" class="logout-btn">
Logout
</a>

</nav>

<div class="hero">

<h1>
Welcome,
<span>${user.getName()}</span>
</h1>

<p>
Manage job postings, track applicants and hire top talent.
</p>

</div>

<div class="stats">

<div class="stat-card">
<div class="stat-number">${jobCount}</div>
<div class="stat-title">Jobs Posted</div>
</div>

<div class="stat-card">
<div class="stat-number">${applicationCount}</div>
<div class="stat-title">Applications</div>
</div>

<div class="stat-card">
<div class="stat-number">${acceptedCount}</div>
<div class="stat-title">Accepted</div>
</div>

<div class="stat-card">
<div class="stat-number">${pendingCount}</div>
<div class="stat-title">Pending</div>
</div>

</div>

<div class="actions">

<a href="post-job.jsp" class="action-btn">
+ Post New Job
</a>

<a href="myjobs" class="action-btn secondary-btn">
View posted Job
</a>

<a href="recruiterprofile?id=${user.getId() }" class="action-btn secondary-btn">
Manage profile
<p>${msg }</p>
</a>

</div>

<div class="section">

<h2>Recent Job Posts</h2>

<div class="jobs">

<div class="job-card">
<span class="badge">Active</span>
<h3>Java Developer</h3>
<p>Pune</p>
<p>34 Applications</p>
</div>

<div class="job-card">
<span class="badge">Active</span>
<h3>Frontend Developer</h3>
<p>Mumbai</p>
<p>19 Applications</p>
</div>

<div class="job-card">
<span class="badge">Active</span>
<h3>DevOps Engineer</h3>
<p>Bangalore</p>
<p>27 Applications</p>
</div>

</div>

</div>


<script src="js/theme.js"></script>

</body> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recruiter Dashboard - OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    /* CSS VARIABLES - KEPT CONSISTENT WITH OUR PREMIUM THEME */
    :root {
        --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
        --text-main: #1e293b;
        --text-muted: #475569;
        --surface: #ffffff;
        --glass-bg: rgba(255, 255, 255, 0.6);
        --glass-border: rgba(255, 255, 255, 0.8);
        --primary: #a3e635; /* Lime green */
        --primary-hover: #84cc16;
        --nav-btn-bg: #0f172a;
        --nav-btn-text: #ffffff;
        --shadow-color: rgba(0, 0, 0, 0.08);
        --orb-color: linear-gradient(135deg, #93c5fd, #a7f3d0);
    }

    [data-theme="dark"] {
        --bg-gradient: linear-gradient(135deg, #0f172a 0%, #020617 100%);
        --text-main: #f8fafc;
        --text-muted: #94a3b8;
        --surface: #1e293b;
        --glass-bg: rgba(30, 41, 59, 0.6);
        --glass-border: rgba(255, 255, 255, 0.05);
        --primary: #a3e635; 
        --primary-hover: #bef264;
        --nav-btn-bg: #f8fafc;
        --nav-btn-text: #0f172a;
        --shadow-color: rgba(0, 0, 0, 0.3);
        --orb-color: linear-gradient(135deg, #3b82f6, #10b981);
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
        overflow-x: hidden;
        transition: background 0.4s ease, color 0.4s ease;
    }

    /* BACKGROUND ORBS */
    .abstract-orb {
        width: 400px; height: 400px;
        background: var(--orb-color);
        border-radius: 50%;
        filter: blur(80px);
        opacity: 0.6;
        position: fixed;
        animation: pulse 10s ease-in-out infinite;
        z-index: -1;
    }
    .orb-1 { top: -50px; left: -100px; }
    .orb-2 { bottom: -100px; right: 5%; animation-delay: 3s; }

    @keyframes pulse {
        0%, 100% { transform: scale(1); opacity: 0.5; }
        50% { transform: scale(1.1); opacity: 0.7; }
    }

    /* NAVBAR */
    nav {
        max-width: 1400px;
        width: 95%;
        margin: 0 auto;
        padding: 20px 40px;
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

    .nav-links {
        display: flex;
        gap: 30px;
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
    .nav-links a.active { color: var(--text-main); font-weight: 700; }

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
        box-shadow: 0 5px 15px rgba(239, 68, 68, 0.3);
    }

    /* WIDER DASHBOARD LAYOUT */
    .dashboard-container {
        max-width: 1400px;
        width: 95%;
        margin: 20px auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: 320px 1fr;
        gap: 35px;
        align-items: flex-start;
    }

    /* GLOBAL GLASS CARD STYLE */
    .glass-card {
        background: var(--glass-bg);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border-radius: 20px;
        border: 1px solid var(--glass-border);
        box-shadow: 0 15px 35px var(--shadow-color);
        overflow: hidden;
    }

    /* LEFT SIDEBAR: PROFILE */
    .profile-sidebar {
        padding: 40px 25px 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        position: relative;
        width: 100%;
    }

    .avatar-wrapper {
        position: relative;
        margin-bottom: 15px;
    }

    .avatar {
        width: 100px;
        height: 100px;
        background: #0f172a; /* Darker background for recruiter distinction */
        color: var(--primary); /* Lime text */
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 40px;
        font-weight: 800;
        box-shadow: 0 10px 25px rgba(15, 23, 42, 0.4);
    }

    .status-dot {
        position: absolute;
        bottom: 5px;
        right: 8px;
        width: 20px;
        height: 20px;
        background: #10b981;
        border: 3px solid var(--surface);
        border-radius: 50%;
    }

    .profile-sidebar h2 {
        font-size: 22px;
        font-weight: 700;
        margin-bottom: 2px;
        color: var(--text-main);
    }

    .profile-sidebar p {
        color: var(--text-muted);
        font-size: 14px;
        margin-bottom: 25px;
    }

    .badge-role {
        background: rgba(37, 99, 235, 0.1);
        color: #2563eb;
        padding: 4px 12px;
        border-radius: 8px;
        font-size: 12px;
        font-weight: 700;
        margin-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    [data-theme="dark"] .badge-role { color: var(--primary); background: rgba(163, 230, 53, 0.1); }

    .profile-action {
        width: 100%;
        padding: 12px;
        background: transparent;
        color: var(--text-main);
        border: 1px solid var(--glass-border);
        border-radius: 12px;
        font-weight: 600;
        font-size: 14px;
        text-decoration: none;
        transition: 0.3s;
    }

    .profile-action:hover {
        background: var(--primary);
        color: #1e293b;
        border-color: var(--primary);
    }

    /* RIGHT MAIN CONTENT */
    .main-content {
        display: flex;
        flex-direction: column;
        gap: 25px;
        width: 100%; 
    }

    /* WELCOME HEADER */
    .welcome-header h1 {
        font-size: 32px;
        font-weight: 800;
        line-height: 1.2;
        letter-spacing: -0.5px;
        margin-bottom: 5px;
    }

    .welcome-header p {
        font-size: 15px;
        color: var(--text-muted);
    }

    /* STATS BENTO ROW */
    .stats-row {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr)); /* Updated to 4 to match your original design */
        gap: 20px;
        width: 100%;
    }

    .stat-box {
        padding: 25px 20px; /* Reduced padding slightly to fit 4 boxes */
        transition: 0.3s;
        display: flex;
        flex-direction: column;
        justify-content: center;
        width: 100%;
    }

    .stat-box:hover {
        transform: translateY(-5px);
    }

    .stat-box h3 {
        font-size: 36px;
        font-weight: 800;
        color: var(--text-main);
        margin-bottom: 4px;
        line-height: 1;
    }

    .stat-box p {
        font-size: 11px;
        color: var(--text-muted);
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    /* Highlighted Stat Box */
    .stat-highlight {
        background: #d9f99d; 
        border-color: #bef264;
    }
    
    .stat-highlight h3, .stat-highlight p {
        color: #1e293b !important; 
    }

    /* ACTIONS BENTO ROW */
    .actions-row {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr)); 
        gap: 20px;
        width: 100%;
    }

    .action-card {
        padding: 30px;
        display: flex;
        align-items: center;
        gap: 20px;
        transition: 0.3s;
        text-decoration: none;
        position: relative;
        width: 100%;
    }

    .action-card:hover {
        transform: translateY(-5px);
        border-color: var(--primary);
    }

    .action-icon {
        width: 50px;
        height: 50px;
        background: var(--surface);
        border-radius: 14px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 24px;
        box-shadow: 0 5px 15px var(--shadow-color);
        flex-shrink: 0;
    }

    .action-text h4 {
        font-size: 18px;
        color: var(--text-main);
        margin-bottom: 6px;
    }

    .action-text p {
        font-size: 14px;
        color: var(--text-muted);
        line-height: 1.5;
        padding-right: 20px;
    }

    .arrow-icon {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        right: 30px;
        color: var(--text-muted);
        font-size: 20px;
        transition: 0.3s;
    }

    .action-card:hover .arrow-icon {
        color: var(--text-main);
        transform: translate(5px, -50%);
    }

    /* RECENT ACTIVITY LIST */
    .activity-section {
        margin-top: 10px;
        width: 100%;
    }
    
    .activity-header {
        display: flex; justify-content: space-between; align-items: center;
        padding: 25px 30px; border-bottom: 1px solid var(--glass-border);
    }
    
    .activity-header h3 { font-size: 18px; font-weight: 700; color: var(--text-main); }
    .activity-header a { font-size: 14px; color: var(--text-muted); text-decoration: none; font-weight: 500; transition: 0.3s; }
    .activity-header a:hover { color: var(--text-main); }

    .activity-list {
        display: flex; flex-direction: column;
    }
    
    .activity-item {
        padding: 20px 30px;
        display: flex; justify-content: space-between; align-items: center;
        border-bottom: 1px solid var(--glass-border);
        transition: 0.2s;
    }
    .activity-item:last-child { border-bottom: none; }
    .activity-item:hover { background: rgba(255, 255, 255, 0.2); }

    .job-info h4 { font-size: 16px; color: var(--text-main); font-weight: 600; margin-bottom: 4px; }
    .job-info p { font-size: 13px; color: var(--text-muted); }
    
    .action-small-btn {
        padding: 8px 16px;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        color: var(--text-main);
        font-size: 12px;
        font-weight: 600;
        border-radius: 8px;
        text-decoration: none;
        transition: 0.2s;
    }

    .action-small-btn:hover {
        background: var(--primary);
        color: #1e293b;
        border-color: var(--primary);
    }

</style>
</head>
<body>

    <div class="abstract-orb orb-1"></div>
    <div class="abstract-orb orb-2"></div>

    <nav>
        <a href="index.jsp" class="logo">CareerSync</a>
        
        <div class="nav-links">
            <a href="recruiter-dashboard.jsp" class="active">Overview</a>
            <a href="post-job.jsp">Post a Job</a>
            <a href="myjobs">Manage Postings</a>
            
            <label class="theme-switch" title="Toggle Theme">
                <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
                <span class="slider"></span>
            </label>

            <a href="logout" class="logout-btn">Sign out</a>
        </div>
    </nav>

    <div class="dashboard-container">
        
        <!-- LEFT: Recruiter Profile Sidebar -->
        <aside class="profile-sidebar glass-card">
            <div class="avatar-wrapper">
                <div class="avatar">
                    <!-- Removed .substring() entirely to prevent crash. Replaced with generic highly-professional icon -->
                    R
                </div>
                <div class="status-dot" title="Online"></div>
            </div>
            
            <div class="badge-role">Recruiter</div>
            
            <h2>${user.getName()}</h2>
            <p>${user.getEmail()}</p>
            
            <a href="recruiterprofile?id=${user.getId() }" class="profile-action">Edit Company Profile</a>
            <p style="color: #10b981; font-size: 13px; margin-top: 12px; font-weight: 500;">${msg}</p>
        </aside>

        <!-- RIGHT: Main Content -->
        <main class="main-content">
            
            <div class="welcome-header">
                <!-- Removed .split() entirely to prevent crash -->
                <h1>Hiring Dashboard, ${user.getName()}</h1>
                <p>Manage your job postings and review top candidates.</p>
            </div>

            <!-- Stats Row - Now perfectly mapped to your Servlet's 4 variables -->
            <div class="stats-row">
                <div class="stat-box glass-card stat-highlight">
                    <h3>${jobCount != null ? jobCount : '0'}</h3>
                    <p>Jobs Posted</p>
                </div>

                <div class="stat-box glass-card">
                    <h3>${applicationCount != null ? applicationCount : '0'}</h3>
                    <p>Applications</p>
                </div>

                <div class="stat-box glass-card">
                    <h3>${acceptedCount != null ? acceptedCount : '0'}</h3>
                    <p>Accepted</p>
                </div>
                
                <div class="stat-box glass-card">
                    <h3>${pendingCount != null ? pendingCount : '0'}</h3>
                    <p>Pending</p>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="actions-row">
                <a href="post-job.jsp" class="action-card glass-card">
                    <div class="action-icon">✍️</div>
                    <div class="action-text">
                        <h4>Post a New Job</h4>
                        <p>Create a listing and start attracting top talent.</p>
                    </div>
                    <div class="arrow-icon">→</div>
                </a>

                <a href="myjobs" class="action-card glass-card">
                    <div class="action-icon">👥</div>
                    <div class="action-text">
                        <h4>Manage Postings</h4>
                        <p>View your active roles and review applicants.</p>
                    </div>
                    <div class="arrow-icon">→</div>
                </a>
            </div>

            <!-- Recent Jobs List (Placeholder to match your old layout) -->
            <div class="activity-section glass-card">
                <div class="activity-header">
                    <h3>Recent Job Posts</h3>
                    <a href="myjobs">View all jobs &rarr;</a>
                </div>
                
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="job-info">
                            <h4>Java Developer</h4>
                            <p>Pune • Active</p>
                        </div>
                        <a href="myjobs" class="action-small-btn">View Details</a>
                    </div>

                    <div class="activity-item">
                        <div class="job-info">
                            <h4>Frontend Developer</h4>
                            <p>Mumbai • Active</p>
                        </div>
                        <a href="myjobs" class="action-small-btn">View Details</a>
                    </div>
                    
                    <div class="activity-item">
                        <div class="job-info">
                            <h4>DevOps Engineer</h4>
                            <p>Bangalore • Active</p>
                        </div>
                        <a href="myjobs" class="action-small-btn">View Details</a>
                    </div>
                </div>
            </div>

        </main>
    </div>

    <!-- Theme Toggle Script -->
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