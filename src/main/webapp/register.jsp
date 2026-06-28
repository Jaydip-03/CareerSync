<%-- <%--  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>Welcomr to registe page</h1>
    
    <form action="register" method="post">
    
       Name : <input type="text" name="name"> <br><br>
       Email : <input type="email" name="email"> <br><br>
       Password : <input type="text" name="password"> <br><br>
       Role :  <select name="role">
       		<option value="JOB_SEEKER">Job-Seeker</option>
       		<option value="RECRUITER">Recruiter</option>
       </select>
       <input type="submit" value="Register">
       
    </form>
</body>
</html> 






 --%>
 
 
 
 <%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

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

    background:linear-gradient(
        135deg,
        #f8fafc,
        #eef4ff
    );

    overflow:hidden;
}

/* Background Blurs */

.blur1{
    width:300px;
    height:300px;

    background:#93c5fd;

    position:absolute;
    top:-100px;
    right:-100px;

    border-radius:50%;

    filter:blur(120px);

    opacity:.4;
}

.blur2{
    width:250px;
    height:250px;

    background:#c4b5fd;

    position:absolute;
    bottom:-100px;
    left:-100px;

    border-radius:50%;

    filter:blur(120px);

    opacity:.4;
}

/* Card */

.card{

    width:450px;

    background:white;

    padding:40px;

    border-radius:30px;

    box-shadow:
    0 20px 40px rgba(0,0,0,.08);

    position:relative;
    z-index:10;
}

.logo{

    text-align:center;

    font-size:32px;

    font-weight:700;

    color:#2563eb;

    margin-bottom:10px;
}

.card h1{

    text-align:center;

    color:#111827;

    margin-bottom:10px;
}

.subtitle{

    text-align:center;

    color:#6b7280;

    margin-bottom:35px;
}

/* Inputs */

.input-group{

    margin-bottom:20px;
}

.input-group label{

    display:block;

    margin-bottom:8px;

    font-weight:500;

    color:#374151;
}

.input-group input,
.input-group select{

    width:100%;

    padding:15px;

    border:2px solid #e5e7eb;

    border-radius:14px;

    font-size:15px;

    transition:.3s;
}

.input-group input:focus,
.input-group select:focus{

    outline:none;

    border-color:#2563eb;
}

/* Button */

button{

    width:100%;

    border:none;

    background:#2563eb;

    color:white;

    padding:16px;

    border-radius:14px;

    font-size:16px;

    font-weight:600;

    cursor:pointer;

    transition:.3s;
}

button:hover{

    transform:translateY(-3px);

    box-shadow:
    0 10px 25px rgba(37,99,235,.3);
}

/* Footer */

.footer{

    text-align:center;

    margin-top:25px;

    color:#6b7280;
}

.footer a{

    text-decoration:none;

    color:#2563eb;

    font-weight:600;
}

</style>

</head>
<body>

<div class="blur1"></div>
<div class="blur2"></div>

<div class="card">

    <div class="logo">
        OJPMS
    </div>

    <h1>Create Account</h1>

    <p class="subtitle">
        Join thousands of job seekers and recruiters.
    </p>

    <form action="register" method="post">

        <div class="input-group">

            <label>Full Name</label>

            <input type="text"
                   name="name"
                   placeholder="Enter your name"
                   required>

        </div>

        <div class="input-group">

            <label>Email Address</label>

            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

        </div>

        <div class="input-group">

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Enter password"
                   required>

        </div>

        <div class="input-group">

            <label>Select Role</label>

            <select name="role">

                <option value="JOB_SEEKER">
                    Job Seeker
                </option>

                <option value="RECRUITER">
                    Recruiter
                </option>

            </select>

        </div>

        <button type="submit">
            Create Account
        </button>

    </form>

    <div class="footer">

        Already have an account?

        <a href="login.jsp">
            Login
        </a>

    </div>

</div>


<script src="js/theme.js"></script>

</body>
</html> 
 --%>
 
 
 
 
 <%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - OJPMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* CSS VARIABLES FOR CONSISTENT THEME */
        :root {
            --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
            --text-main: #1e293b;
            --text-muted: #475569;
            --surface: #ffffff;
            --glass-bg: rgba(255, 255, 255, 0.6);
            --glass-border: rgba(255, 255, 255, 0.8);
            --primary: #a3e635; /* Lime green */
            --primary-hover: #84cc16;
            --input-bg: rgba(255, 255, 255, 0.9);
            --input-border: #cbd5e1;
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
            --input-bg: rgba(15, 23, 42, 0.8);
            --input-border: #334155;
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
            display: flex;
            flex-direction: column;
            transition: background 0.4s ease, color 0.4s ease;
            overflow-x: hidden;
        }

        /* MINIMAL NAVBAR */
        nav {
            width: 100%;
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            top: 0;
            z-index: 100;
        }

        .logo {
            font-size: 24px;
            font-weight: 800;
            color: var(--text-main);
            text-decoration: none;
            letter-spacing: -1px;
        }

        /* THEME TOGGLE */
        .theme-switch {
            position: relative; width: 50px; height: 26px; display: inline-block;
        }
        .theme-switch input { opacity: 0; width: 0; height: 0; }
        .slider {
            position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0;
            background-color: var(--surface); border: 1px solid var(--glass-border);
            transition: .4s; border-radius: 34px;
        }
        .slider:before {
            position: absolute; content: "☀️"; height: 18px; width: 18px; left: 3px; bottom: 3px;
            background-color: transparent; transition: .4s; font-size: 14px;
            display: flex; justify-content: center; align-items: center;
        }
        input:checked + .slider:before {
            transform: translateX(24px); content: "🌙";
        }

        /* SPLIT LAYOUT */
        .container {
            display: flex;
            flex: 1;
            margin-top: 80px;
            padding: 0 50px;
            align-items: center;
            justify-content: space-evenly;
            gap: 40px;
            max-width: 1400px;
            margin-left: auto;
            margin-right: auto;
        }

        /* LEFT SIDE - VISUALS */
        .visual-section {
            flex: 1;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 500px;
        }

        .abstract-orb {
            width: 400px; height: 400px;
            background: var(--orb-color);
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.5;
            position: absolute;
            animation: pulse 8s ease-in-out infinite;
        }

        .info-card {
            position: relative;
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 30px;
            border-radius: 24px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 20px 40px var(--shadow-color);
            z-index: 10;
        }

        .info-card h2 {
            font-size: 32px;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 15px;
        }

        .info-card p {
            color: var(--text-muted);
            font-size: 15px;
            line-height: 1.6;
        }

        .badge-float {
            position: absolute;
            background: var(--surface);
            padding: 10px 20px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 14px;
            box-shadow: 0 10px 20px var(--shadow-color);
            display: flex;
            align-items: center;
            gap: 10px;
            animation: float 5s ease-in-out infinite;
        }

        .badge-1 { top: -20px; left: -30px; }
        .badge-2 { bottom: -20px; right: -20px; animation-delay: 2s; }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.4; }
            50% { transform: scale(1.1); opacity: 0.6; }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        /* RIGHT SIDE - FORM */
        .form-section {
            flex: 1;
            max-width: 480px;
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 40px;
            border-radius: 24px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 20px 40px var(--shadow-color);
        }

        .form-section h3 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .form-section > p {
            color: var(--text-muted);
            margin-bottom: 30px;
            font-size: 15px;
        }

        /* Interactive Role Selector */
        .role-selector {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
        }

        .role-option {
            flex: 1;
            position: relative;
        }

        .role-option input {
            display: none;
        }

        .role-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px;
            background: var(--input-bg);
            border: 2px solid var(--input-border);
            border-radius: 16px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            color: var(--text-muted);
        }

        .role-card span { font-size: 24px; margin-bottom: 5px; }

        .role-option input:checked + .role-card {
            border-color: var(--primary);
            background: rgba(163, 230, 53, 0.1);
            color: var(--text-main);
        }

        /* Standard Inputs */
        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-main);
        }

        .input-group input {
            width: 100%;
            padding: 14px 16px;
            border-radius: 12px;
            border: 1px solid var(--input-border);
            background: var(--input-bg);
            color: var(--text-main);
            font-size: 15px;
            transition: all 0.3s;
            outline: none;
        }

        .input-group input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(163, 230, 53, 0.2);
        }

        .submit-btn {
            width: 100%;
            background: var(--primary);
            color: #1e293b;
            border: none;
            padding: 16px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: var(--text-muted);
        }

        .login-link a {
            color: var(--text-main);
            font-weight: 600;
            text-decoration: none;
            border-bottom: 2px solid var(--primary);
            padding-bottom: 2px;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: var(--primary);
        }

    </style>
</head>
<body>

    <nav>
        <a href="index.jsp" class="logo">OJPMS.</a>
        <!-- Dark Mode Toggle -->
        <label class="theme-switch" title="Toggle Theme">
            <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
            <span class="slider"></span>
        </label>
    </nav>

    <div class="container">
        <!-- Left Side: Visuals -->
        <div class="visual-section">
            <div class="abstract-orb"></div>
            
            <div class="info-card">
                <div class="badge-float badge-1">🚀 10,000+ Jobs</div>
                
                <h2>Start your journey<br>with us today.</h2>
                <p>Join the fastest-growing network of tech professionals. Whether you are looking for your dream job or hunting for top talent, we bridge the gap.</p>
                
                <div class="badge-float badge-2">✨ Top Recruiters</div>
            </div>
        </div>

        <!-- Right Side: Registration Form -->
        <div class="form-section">
            <h3>Create an Account</h3>
            <p>Select your account type and fill in your details.</p>

            <form action="RegisterServlet" method="POST">
                
                <!-- Modern Role Selection Cards -->
                <div class="role-selector">
                    <label class="role-option">
                        <input type="radio" name="role" value="Job Seeker" checked>
                        <div class="role-card">
                            <span>👨‍💻</span>
                            Job Seeker
                        </div>
                    </label>
                    <label class="role-option">
                        <input type="radio" name="role" value="Recruiter">
                        <div class="role-card">
                            <span>🏢</span>
                            Recruiter
                        </div>
                    </label>
                </div>

                <div class="input-group">
                    <label>Full Name</label>
                    <input type="text" name="name" placeholder="John Doe" required>
                </div>

                <div class="input-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="john@example.com" required>
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Create a strong password" required>
                </div>

                <button type="submit" class="submit-btn">Create Account</button>

                <div class="login-link">
                    Already have an account? <a href="login.jsp">Log in here</a>
                </div>
            </form>
        </div>
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
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - OJPMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* CSS VARIABLES */
        :root {
            --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
            --text-main: #1e293b;
            --text-muted: #475569;
            --surface: #ffffff;
            --glass-bg: rgba(255, 255, 255, 0.6);
            --glass-border: rgba(255, 255, 255, 0.8);
            --primary: #a3e635; 
            --primary-hover: #84cc16;
            --input-bg: rgba(255, 255, 255, 0.9);
            --input-border: #cbd5e1;
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
            --input-bg: rgba(15, 23, 42, 0.8);
            --input-border: #334155;
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
            display: flex;
            flex-direction: column;
            transition: background 0.4s ease, color 0.4s ease;
            overflow-x: hidden;
        }

        /* COMPACT NAVBAR */
        nav {
            width: 100%;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            top: 0;
            z-index: 100;
        }

        .logo {
            font-size: 22px;
            font-weight: 800;
            color: var(--text-main);
            text-decoration: none;
            letter-spacing: -1px;
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

        /* COMPACT SPLIT LAYOUT */
        .container {
            display: flex;
            flex: 1;
            margin-top: 60px; /* Reduced from 80px */
            padding: 0 40px;
            align-items: center;
            justify-content: space-evenly;
            gap: 30px; /* Reduced gap */
            max-width: 1200px; /* Reduced from 1400px */
            margin-left: auto;
            margin-right: auto;
        }

        /* LEFT SIDE - VISUALS */
        .visual-section {
            flex: 1;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 450px;
        }

        .abstract-orb {
            width: 300px; height: 300px; /* Scaled down from 400px */
            background: var(--orb-color);
            border-radius: 50%;
            filter: blur(60px);
            opacity: 0.5;
            position: absolute;
            animation: pulse 8s ease-in-out infinite;
        }

        .info-card {
            position: relative;
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 25px; /* Scaled down padding */
            border-radius: 20px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 15px 30px var(--shadow-color);
            z-index: 10;
        }

        .info-card h2 {
            font-size: 26px; /* Scaled down from 32px */
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 12px;
        }

        .info-card p {
            color: var(--text-muted);
            font-size: 13px; /* Scaled down */
            line-height: 1.5;
        }

        .badge-float {
            position: absolute;
            background: var(--surface);
            padding: 8px 16px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 12px; /* Scaled down */
            box-shadow: 0 8px 15px var(--shadow-color);
            display: flex;
            align-items: center;
            gap: 8px;
            animation: float 5s ease-in-out infinite;
        }

        .badge-1 { top: -15px; left: -20px; }
        .badge-2 { bottom: -15px; right: -15px; animation-delay: 2s; }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.4; }
            50% { transform: scale(1.1); opacity: 0.6; }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        /* RIGHT SIDE - FORM */
        .form-section {
            flex: 1;
            max-width: 420px; /* Scaled down from 480px */
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 30px; /* Scaled down from 40px */
            border-radius: 20px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 15px 30px var(--shadow-color);
        }

        .form-section h3 {
            font-size: 24px; /* Scaled down from 28px */
            font-weight: 700;
            margin-bottom: 5px;
        }

        .form-section > p {
            color: var(--text-muted);
            margin-bottom: 20px;
            font-size: 13px;
        }

        /* COMPACT Role Selector */
        .role-selector {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .role-option { flex: 1; position: relative; }
        .role-option input { display: none; }

        .role-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px; /* Reduced padding */
            background: var(--input-bg);
            border: 2px solid var(--input-border);
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            font-size: 13px;
            color: var(--text-muted);
        }

        .role-card span { font-size: 20px; margin-bottom: 2px; }

        .role-option input:checked + .role-card {
            border-color: var(--primary);
            background: rgba(163, 230, 53, 0.1);
            color: var(--text-main);
        }

        /* COMPACT Inputs */
        .input-group { margin-bottom: 15px; }

        .input-group label {
            display: block; font-size: 13px; font-weight: 600;
            margin-bottom: 5px; color: var(--text-main);
        }

        .input-group input {
            width: 100%;
            padding: 10px 14px; /* Scaled down padding */
            border-radius: 10px;
            border: 1px solid var(--input-border);
            background: var(--input-bg);
            color: var(--text-main);
            font-size: 13px; /* Scaled down text */
            transition: all 0.3s;
            outline: none;
        }

        .input-group input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(163, 230, 53, 0.2);
        }

        .submit-btn {
            width: 100%;
            background: var(--primary);
            color: #1e293b;
            border: none;
            padding: 12px; /* Scaled down */
            border-radius: 10px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
            margin-top: 5px;
        }

        .submit-btn:hover { background: var(--primary-hover); transform: translateY(-2px); }

        .login-link {
            text-align: center;
            margin-top: 15px;
            font-size: 13px;
            color: var(--text-muted);
        }

        .login-link a {
            color: var(--text-main); font-weight: 600;
            text-decoration: none; border-bottom: 2px solid var(--primary);
            padding-bottom: 1px; transition: color 0.3s;
        }

        .login-link a:hover { color: var(--primary); }

    </style>
</head>
<body>

    <nav>
        <a href="index.jsp" class="logo">CareerSync</a>
        <label class="theme-switch" title="Toggle Theme">
            <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
            <span class="slider"></span>
        </label>
    </nav>

    <div class="container">
        <!-- Left Side: Visuals -->
        <div class="visual-section">
            <div class="abstract-orb"></div>
            
            <div class="info-card">
                <div class="badge-float badge-1">🚀 10,000+ Jobs</div>
                
                <h2>Start your journey<br>with us today.</h2>
                <p>Join the fastest-growing network of tech professionals. Whether you are looking for your dream job or hunting for top talent, we bridge the gap.</p>
                
                <div class="badge-float badge-2">✨ Top Recruiters</div>
            </div>
        </div>

        <!-- Right Side: Registration Form -->
        <div class="form-section">
            <h3>Create an Account</h3>
            <p>Select your account type and fill in your details.</p>

            <form action="register" method="POST">
                
                <div class="role-selector">
                    <label class="role-option">
                        <input type="radio" name="role" value="JOB_SEEKER" checked>
                        <div class="role-card">
                            <span>👨‍💻</span>
                            Job Seeker
                        </div>
                    </label>
                    <label class="role-option">
                        <input type="radio" name="role" value="RECRUITER">
                        <div class="role-card">
                            <span>🏢</span>
                            Recruiter
                        </div>
                    </label>
                </div>

                <div class="input-group">
                    <label>Full Name</label>
                    <input type="text" name="name" placeholder="John Doe" required>
                </div>

                <div class="input-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="john@example.com" required>
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Create a strong password" required>
                </div>

                <button type="submit" class="submit-btn">Create Account</button>

                <div class="login-link">
                    Already have an account? <a href="login.jsp">Log in here</a>
                </div>
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