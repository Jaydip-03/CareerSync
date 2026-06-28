<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<h1>JOB ll be post Soonnnnnnn</h1>


<form action="postjob" method="post">

Title : <input type="text" name="title"> <br>
Description <textarea name="description" rows="" cols=""></textarea> <br>
Location : <input type="text" name="location"> <br>
Salary : <input type="number" name="salary"> <br>
         <input type="submit" value="SUBMIT">

		
</form>

</body>
</html> --%>


<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Job | OJPMS</title>

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
min-height:100vh;
}

/* NAVBAR */

.navbar{
width:90%;
margin:20px auto;

display:flex;
justify-content:space-between;
align-items:center;

padding:18px 35px;

background:white;

border-radius:20px;

box-shadow:0 10px 30px rgba(0,0,0,.08);
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
}

.logout-btn{
background:#2563eb;
color:white;
padding:12px 25px;
border-radius:12px;
text-decoration:none;
font-weight:600;
}

/* MAIN */

.container{
width:90%;
max-width:1200px;

margin:50px auto;

display:flex;
align-items:center;
justify-content:space-between;
gap:60px;
}

/* LEFT SIDE */

.left{
flex:1;
}

.left h1{
font-size:65px;
font-weight:800;
line-height:1.1;
color:#111827;
}

.left span{
color:#2563eb;
}

.left p{
margin-top:20px;
font-size:18px;
color:#6b7280;
line-height:1.8;
}

/* RIGHT SIDE */

.form-card{

flex:1;

background:white;

padding:40px;

border-radius:30px;

box-shadow:
0 20px 50px rgba(37,99,235,.12);

transition:.4s;
}

.form-card:hover{
transform:translateY(-8px);
}

.form-title{
font-size:32px;
font-weight:700;
margin-bottom:25px;
}

/* FORM */

.input-group{
margin-bottom:20px;
}

.input-group label{
display:block;
margin-bottom:8px;
font-weight:600;
color:#374151;
}

.input-group input,
.input-group textarea{

width:100%;

padding:16px;

border:1px solid #d1d5db;

border-radius:14px;

font-size:15px;

outline:none;

transition:.3s;
}

.input-group input:focus,
.input-group textarea:focus{

border-color:#2563eb;

box-shadow:
0 0 0 4px rgba(37,99,235,.15);
}

textarea{
resize:none;
height:130px;
}

.submit-btn{

width:100%;

padding:16px;

border:none;

border-radius:14px;

background:linear-gradient(
135deg,
#2563eb,
#3b82f6
);

color:white;

font-size:16px;

font-weight:600;

cursor:pointer;

transition:.3s;
}

.submit-btn:hover{
transform:translateY(-3px);
}

/* SMALL STATS */

.info-boxes{
display:flex;
gap:15px;
margin-top:30px;
}

.info{
background:white;
padding:18px;
border-radius:16px;
box-shadow:0 5px 15px rgba(0,0,0,.08);
}

.info h3{
color:#2563eb;
font-size:24px;
}

.info p{
font-size:13px;
color:#6b7280;
}

</style>
</head>
<body>

<nav class="navbar">

<div class="logo">
OJPMS
</div>

<div class="nav-links">
<a href="recruiter-dashboard.jsp">Dashboard</a>
<a href="#">Jobs</a>
<a href="#">Applicants</a>
</div>

<a href="logout" class="logout-btn">
Logout
</a>

</nav>

<div class="container">

<div class="left">

<h1>
Post Your <span>Dream Hire</span>
</h1>

<p>
Create attractive job listings and connect with talented candidates.
Find skilled developers, designers and engineers faster than ever.
</p>

<div class="info-boxes">

<div class="info">
<h3>10K+</h3>
<p>Active Candidates</p>
</div>

<div class="info">
<h3>500+</h3>
<p>Recruiters</p>
</div>

<div class="info">
<h3>25K+</h3>
<p>Applications</p>
</div>

</div>

</div>

<div class="form-card">

<div class="form-title">
Create New Job
</div>

<form action="postjob" method="post">

<div class="input-group">
<label>Job Title</label>
<input type="text" name="title" required>
</div>

<div class="input-group">
<label>Description</label>
<textarea name="description" required></textarea>
</div>

<div class="input-group">
<label>Location</label>
<input type="text" name="location" required>
</div>

<div class="input-group">
<label>Salary</label>
<input type="number" name="salary" required>
</div>

<button class="submit-btn">
🚀 Publish Job
</button>

</form>

</div>

</div>

<script src="js/theme.js"></script>

</body>
</html> --%>

<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Post a Job | OJPMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
            --text-main: #1e293b;
            --text-muted: #475569;
            --glass-bg: rgba(255, 255, 255, 0.6);
            --glass-border: rgba(255, 255, 255, 0.8);
            --primary: #a3e635;
            --primary-hover: #84cc16;
            --shadow-color: rgba(0, 0, 0, 0.08);
        }

        [data-theme="dark"] {
            --bg-gradient: linear-gradient(135deg, #0f172a 0%, #020617 100%);
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --glass-bg: rgba(30, 41, 59, 0.6);
            --glass-border: rgba(255, 255, 255, 0.05);
            --primary: #a3e635;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { background: var(--bg-gradient); color: var(--text-main); min-height: 100vh; transition: 0.4s; }

        nav { max-width: 1200px; margin: 0 auto; padding: 25px 40px; display: flex; justify-content: space-between; align-items: center; }
        .logo { font-size: 24px; font-weight: 800; color: var(--text-main); text-decoration: none; }
        
        .container { 
            max-width: 1000px; 
            margin: 40px auto; 
            padding: 0 40px; 
            display: grid; 
            grid-template-columns: 1fr 1fr; 
            gap: 40px; 
            align-items: center;
        }

        .hero-text h1 { font-size: 48px; font-weight: 800; line-height: 1.1; margin-bottom: 20px; }
        .hero-text span { color: #4d7c0f; }
        .hero-text p { color: var(--text-muted); line-height: 1.6; }

        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            padding: 40px;
            border-radius: 24px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 20px 40px var(--shadow-color);
        }

        .input-group { margin-bottom: 20px; }
        .input-group label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; }
        .input-group input, .input-group textarea {
            width: 100%;
            padding: 12px 16px;
            border-radius: 12px;
            border: 1px solid var(--glass-border);
            background: rgba(255,255,255,0.5);
            font-size: 14px;
            outline: none;
            transition: 0.3s;
        }
        .input-group input:focus, .input-group textarea:focus { border-color: var(--primary); }
        textarea { height: 120px; resize: none; }

        .submit-btn {
            width: 100%;
            padding: 14px;
            background: var(--primary);
            border: none;
            border-radius: 12px;
            font-weight: 700;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
        }
        .submit-btn:hover { background: var(--primary-hover); transform: translateY(-2px); }

        /* Theme Toggle */
        .theme-switch { cursor: pointer; font-size: 20px; }
    </style>
</head>
<body>

    <nav>
        <a href="recruiter-dashboard.jsp" class="logo">OJPMS.</a>
        <div class="theme-switch" onclick="toggleTheme()">🌓</div>
    </nav>

    <div class="container">
        <div class="hero-text">
            <h1>Post Your <span>Dream Hire</span></h1>
            <p>Fill out the details below to publish your job opening. Reach top talent in your field instantly.</p>
        </div>

        <form action="postjob" method="post" class="glass-card">
            <div class="input-group">
                <label>Job Title</label>
                <input type="text" name="title" placeholder="e.g. Senior Java Developer" required>
            </div>
            <div class="input-group">
                <label>Description</label>
                <textarea name="description" placeholder="Write job responsibilities..." required></textarea>
            </div>
            <div class="input-group">
                <label>Location</label>
                <input type="text" name="location" placeholder="e.g. Pune" required>
            </div>
            <div class="input-group">
                <label>Salary (Per Annum)</label>
                <input type="number" name="salary" placeholder="e.g. 600000" required>
            </div>
            <button type="submit" class="submit-btn">🚀 Publish Job</button>
        </form>
    </div>

    <script>
        function toggleTheme() {
            const body = document.documentElement;
            body.setAttribute('data-theme', body.getAttribute('data-theme') === 'dark' ? 'light' : 'dark');
        }
    </script>
</body>
</html> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Post a Job | OJPMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
            --text-main: #1e293b;
            --text-muted: #475569;
            --surface: #ffffff;
            --glass-bg: rgba(255, 255, 255, 0.6);
            --glass-border: rgba(255, 255, 255, 0.8);
            --primary: #a3e635;
            --primary-hover: #84cc16;
            --input-bg: rgba(255, 255, 255, 0.5);
            --placeholder-color: rgba(30, 41, 59, 0.5);
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
            --input-bg: rgba(15, 23, 42, 0.4);
            --placeholder-color: rgba(248, 250, 252, 0.4);
            --shadow-color: rgba(0, 0, 0, 0.3);
            --orb-color: linear-gradient(135deg, #3b82f6, #10b981);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
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

        /* HEADER & NAVIGATION */
        nav { 
            max-width: 1400px; 
            width: 95%; 
            margin: 0 auto; 
            padding: 20px 40px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
        }
        
        .nav-branding {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .logo { font-size: 24px; font-weight: 800; color: var(--text-main); text-decoration: none; letter-spacing: -1px; }
        
        .header-back-btn {
            text-decoration: none;
            color: var(--text-muted);
            font-size: 14px;
            font-weight: 600;
            transition: color 0.2s;
        }
        .header-back-btn:hover {
            color: var(--text-main);
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

        /* HERO LAYOUT */
        .container { 
            max-width: 1400px; 
            width: 95%;
            margin: 10px auto; 
            padding: 0 40px; 
            display: grid; 
            grid-template-columns: 1fr 1fr; 
            gap: 50px; 
            align-items: center;
        }

        .hero-text h1 { font-size: 56px; font-weight: 800; line-height: 1.1; margin-bottom: 20px; letter-spacing: -1.5px; }
        .hero-text span { color: #4d7c0f; [data-theme="dark"] & { color: var(--primary); } }
        .hero-text p { color: var(--text-muted); line-height: 1.6; font-size: 16px; }

        /* COMPACTED FORM CARD */
        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 30px 35px; /* Shrunk padding to match professional tools */
            border-radius: 24px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 20px 40px var(--shadow-color);
        }

        .form-title { font-size: 24px; font-weight: 700; margin-bottom: 20px; }

        .input-group { margin-bottom: 14px; } /* Tighter margins */
        .input-group label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 6px; }
        
        .input-group input, .input-group textarea {
            width: 100%;
            padding: 10px 14px; /* Slightly more compact interior bounds */
            border-radius: 10px;
            border: 1px solid var(--glass-border);
            background: var(--input-bg);
            color: var(--text-main);
            font-size: 14px;
            outline: none;
            transition: 0.3s;
        }
        
        /* FIX: Placeholder Contrast Resolution across dark/light mode swaps */
        .input-group input::placeholder, .input-group textarea::placeholder {
            color: var(--placeholder-color);
            opacity: 1;
        }
        
        .input-group input:focus, .input-group textarea:focus { 
            border-color: var(--primary); 
            background: var(--surface);
        }
        textarea { height: 100px; resize: none; }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background: var(--primary);
            color: #1e293b;
            border: none;
            border-radius: 12px;
            font-weight: 700;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .submit-btn:hover { background: var(--primary-hover); transform: translateY(-2px); box-shadow: 0 8px 20px rgba(163, 230, 53, 0.3); }

        .back-link {
            display: block;
            text-align: center;
            color: var(--text-muted);
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            transition: 0.2s;
            margin-top: 10px;
        }
        .back-link:hover {
            color: var(--text-main);
        }
    </style>
</head>
<body>

    <div class="abstract-orb orb-1"></div>
    <div class="abstract-orb orb-2"></div>

    <nav>
        <div class="nav-branding">
            <a href="recruiter-dashboard.jsp" class="logo">CareerSync</a>
            <a href="recruiter-dashboard.jsp" class="header-back-btn">← Back to Dashboard</a>
        </div>
        <label class="theme-switch" title="Toggle Theme">
            <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
            <span class="slider"></span>
        </label>
    </nav>

    <div class="container">
        <div class="hero-text">
            <h1>Post Your <br><span>Dream Hire</span></h1>
            <p>Fill out the details to publish your job opening. Reach thousands of active and vetted tech professionals instantly.</p>
        </div>

        <div class="glass-card">
            <div class="form-title">Create New Job</div>
            <form action="postjob" method="post">
                <div class="input-group">
                    <label>Job Title</label>
                    <input type="text" name="title" placeholder="e.g. Senior Java Developer" required>
                </div>
                <div class="input-group">
                    <label>Description</label>
                    <textarea name="description" placeholder="Write core responsibilities, tech stack, and requirements..." required></textarea>
                </div>
                <div class="input-group">
                    <label>Location</label>
                    <input type="text" name="location" placeholder="e.g. Pune, Remote" required>
                </div>
                <div class="input-group">
                    <label>Salary (Per Annum)</label>
                    <input type="number" name="salary" placeholder="e.g. 600000" required>
                </div>
                <button type="submit" class="submit-btn">🚀 Publish Job</button>
                <a href="recruiter-dashboard.jsp" class="back-link">Cancel Posting</a>
            </form>
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