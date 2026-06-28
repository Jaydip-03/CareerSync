<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Edit Job</h1>

<form action="updatejob" method="post">

    <input type="hidden"
           name="id"
           value="${job.id}" readonly="readonly">

    Title :
    <input type="text"
           name="title"
           value="${job.title}">
    <br><br>

    Description :
    <textarea name="description">${job.description}</textarea>
    <br><br>

    Location :
    <input type="text"
           name="location"
           value="${job.location}">
    <br><br>

    Salary :
    <input type="number"
           name="salary"
           value="${job.salary}">
    <br><br>

    <input type="submit"
           value="Update Job">

</form>

</body>
</html> --%>

<%-- 

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Job | OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link rel="stylesheet" href="css/theme.css">


<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#f4f7fc;
}

.container{

    width:650px;

    background:white;

    padding:40px;

    border-radius:25px;

    box-shadow:
    0 15px 35px rgba(0,0,0,.08);
}

.title{

    text-align:center;

    color:#2563eb;

    font-size:36px;

    font-weight:700;

    margin-bottom:30px;
}

.form-group{
    margin-bottom:20px;
}

.form-group label{

    display:block;

    margin-bottom:8px;

    font-weight:600;

    color:#374151;
}

input,
textarea{

    width:100%;

    padding:14px;

    border:1px solid #d1d5db;

    border-radius:12px;

    outline:none;

    font-size:15px;

    transition:.3s;
}

input:focus,
textarea:focus{

    border-color:#2563eb;

    box-shadow:
    0 0 0 4px rgba(37,99,235,.12);
}

textarea{

    resize:none;

    height:140px;
}

.btns{

    display:flex;

    gap:15px;

    margin-top:25px;
}

.update-btn{

    flex:1;

    border:none;

    background:#2563eb;

    color:white;

    padding:15px;

    border-radius:12px;

    font-size:16px;

    font-weight:600;

    cursor:pointer;

    transition:.3s;
}

.update-btn:hover{

    background:#1d4ed8;

    transform:translateY(-3px);
}

.back-btn{

    flex:1;

    text-decoration:none;

    background:#ef4444;

    color:white;

    text-align:center;

    padding:15px;

    border-radius:12px;

    font-weight:600;

    transition:.3s;
}

.back-btn:hover{

    background:#dc2626;

    transform:translateY(-3px);
}

</style>

</head>
<body>

<div class="container">

```
<h1 class="title">
    ✏ Edit Job
</h1>

<form action="updatejob" method="post">

    <input type="hidden"
           name="id"
           value="${job.id}">

    <div class="form-group">

        <label>Job Title</label>

        <input type="text"
               name="title"
               value="${job.title}"
               required>

    </div>

    <div class="form-group">

        <label>Description</label>

        <textarea name="description"
                  required>${job.description}</textarea>

    </div>

    <div class="form-group">

        <label>Location</label>

        <input type="text"
               name="location"
               value="${job.location}"
               required>

    </div>

    <div class="form-group">

        <label>Salary</label>

        <input type="number"
               name="salary"
               value="${job.salary}"
               required>

    </div>

    <div class="btns">

        <button class="update-btn">
            🚀 Update Job
        </button>

        <a href="myjobs"
           class="back-btn">
            ← Back
        </a>

    </div>

</form>
```

</div>


<script src="js/theme.js"></script>
</body>
</html> --%>






<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
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
    <title>Edit Job | TAMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
            --text-main: #1e293b;
            --text-muted: #475569;
            --surface: #ffffff;
            --glass-bg: rgba(255, 255, 255, 0.6);
            --glass-border: rgba(255, 255, 255, 0.8);
            --primary: #a3e635; /* Neon Lime Green */
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

        /* BACKGROUND GRADIENT ORBS */
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

        /* FIXED HEADER */
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
        .header-back-btn:hover { color: var(--text-main); }
        
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

        /* HERO MATRIX CONTAINER */
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

        /* FORM BLOCK GLASS CARD */
        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 30px 35px;
            border-radius: 24px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 20px 40px var(--shadow-color);
        }

        .form-title { font-size: 24px; font-weight: 700; margin-bottom: 20px; }

        .input-group { margin-bottom: 14px; }
        .input-group label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 6px; }
        
        .input-group input, .input-group textarea {
            width: 100%;
            padding: 10px 14px;
            border-radius: 10px;
            border: 1px solid var(--glass-border);
            background: var(--input-bg);
            color: var(--text-main);
            font-size: 14px;
            outline: none;
            transition: 0.3s;
        }
        
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
        .back-link:hover { color: var(--text-main); }
    </style>
</head>
<body>

    <div class="abstract-orb orb-1"></div>
    <div class="abstract-orb orb-2"></div>

    <nav>
        <div class="nav-branding">
            <a href="recruiter-dashboard.jsp" class="logo">CareerSync</a>
            <a href="myjobs" class="header-back-btn">← Back to Postings</a>
        </div>
        <label class="theme-switch" title="Toggle Theme">
            <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
            <span class="slider"></span>
        </label>
    </nav>

    <div class="container">
        <div class="hero-text">
            <h1>Modify Your <br><span>Listing Details</span></h1>
            <p>Update role parameters, rewrite core descriptions, or tune competitive pricing to optimize your job application conversion rate matrix.</p>
        </div>

        <div class="glass-card">
            <div class="form-title">Edit Job Configuration</div>
            <form action="updatejob" method="post">
                <input type="hidden" name="id" value="${job.id}">
                
                <div class="input-group">
                    <label>Job Title</label>
                    <input type="text" name="title" value="${job.title}" required>
                </div>
                <div class="input-group">
                    <label>Description</label>
                    <textarea name="description" required>${job.description}</textarea>
                </div>
                <div class="input-group">
                    <label>Location</label>
                    <input type="text" name="location" value="${job.location}" required>
                </div>
                <div class="input-group">
                    <label>Salary (Per Annum)</label>
                    <input type="number" name="salary" value="${job.salary}" required>
                </div>
                <button type="submit" class="submit-btn">💾 Save Changes</button>
                <a href="myjobs" class="back-link">Discard Changes & Cancel</a>
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
