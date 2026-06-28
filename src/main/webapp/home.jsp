<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJPMS - Modern Job Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* CSS VARIABLES FOR LIGHT & DARK THEMES */
        :root {
            --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
            --text-main: #1e293b;
            --text-muted: #475569;
            --surface: #ffffff;
            --glass-bg: rgba(255, 255, 255, 0.5);
            --glass-border: rgba(255, 255, 255, 0.8);
            --primary: #a3e635; /* Lime green */
            --primary-hover: #84cc16;
            --nav-btn-bg: #0f172a;
            --nav-btn-text: #ffffff;
            --banner-bg: rgba(255, 255, 255, 0.3);
            --logo-color: #475569;
            --shadow-color: rgba(0, 0, 0, 0.08);
            --orb-color: linear-gradient(135deg, #93c5fd, #c4b5fd);
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
            --banner-bg: rgba(30, 41, 59, 0.4);
            --logo-color: #cbd5e1;
            --shadow-color: rgba(0, 0, 0, 0.3);
            --orb-color: linear-gradient(135deg, #3b82f6, #8b5cf6);
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

        /* NAVBAR */
        nav {
            max-width: 1400px;
            margin: 0 auto;
            padding: 30px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 28px;
            font-weight: 800;
            color: var(--text-main);
            letter-spacing: -1px;
        }

        .nav-links {
            display: flex;
            gap: 40px;
            align-items: center;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text-muted);
            font-weight: 500;
            font-size: 15px;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: var(--text-main);
        }

        /* THEME TOGGLE */
        .theme-switch {
            position: relative;
            width: 50px;
            height: 26px;
            display: inline-block;
        }
        .theme-switch input { opacity: 0; width: 0; height: 0; }
        .slider {
            position: absolute; cursor: pointer;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: var(--surface);
            border: 1px solid var(--glass-border);
            transition: .4s; border-radius: 34px;
        }
        .slider:before {
            position: absolute; content: "☀️";
            height: 18px; width: 18px; left: 3px; bottom: 3px;
            background-color: transparent;
            transition: .4s; font-size: 14px;
            display: flex; justify-content: center; align-items: center;
        }
        input:checked + .slider:before {
            transform: translateX(24px);
            content: "🌙";
        }

        .auth-btn {
            background: var(--nav-btn-bg);
            color: var(--nav-btn-text);
            padding: 12px 30px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .auth-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px var(--shadow-color);
        }

        /* HERO SECTION */
        .hero {
            max-width: 1400px;
            margin: 40px auto;
            padding: 0 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 50px;
        }

        .hero-content {
            flex: 1;
            max-width: 600px;
        }

        .hero h1 {
            font-size: 72px;
            line-height: 1.1;
            font-weight: 800;
            margin-bottom: 24px;
            letter-spacing: -2px;
            color: var(--text-main);
        }

        .hero p {
            font-size: 18px;
            color: var(--text-muted);
            margin-bottom: 40px;
            line-height: 1.6;
        }

        /* SEARCH BAR */
        .search-box {
            display: flex;
            background: var(--surface);
            padding: 10px;
            border-radius: 16px;
            box-shadow: 0 20px 40px var(--shadow-color);
            gap: 15px;
            border: 1px solid var(--glass-border);
        }

        .search-input {
            flex: 1; display: flex; align-items: center;
            padding: 0 20px; border-right: 1px solid var(--glass-border);
        }

        .search-input input {
            border: none; outline: none; width: 100%;
            font-size: 15px; color: var(--text-main);
            background: transparent;
        }

        .search-select {
            padding: 0 20px; display: flex; align-items: center;
        }

        .search-select select {
            border: none; outline: none; font-size: 15px;
            color: var(--text-main); background: transparent; cursor: pointer;
        }

        .search-btn {
            background: var(--primary);
            color: #1e293b;
            border: none; padding: 15px 40px; border-radius: 12px;
            font-weight: 600; font-size: 16px; cursor: pointer;
            transition: background 0.3s;
        }
        .search-btn:hover { background: var(--primary-hover); }

        /* VISUAL ELEMENTS */
        .hero-visuals {
            flex: 1; position: relative; height: 500px;
            display: flex; justify-content: center; align-items: center;
        }

        /* Replaced square block with a modern glowing orb */
        .abstract-orb {
            width: 350px; height: 350px;
            background: var(--orb-color);
            border-radius: 50%;
            filter: blur(60px);
            opacity: 0.6;
            position: absolute;
            animation: pulse 8s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 0.7; }
        }

        /* Floating Cards */
        .float-card {
            position: absolute;
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 24px;
            border-radius: 20px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 20px 40px var(--shadow-color);
            animation: float 6s ease-in-out infinite;
        }

        .card-role {
            top: 40px; left: 20px;
            display: flex; align-items: center; gap: 15px;
            padding: 15px 25px;
        }
        
        .card-role-icon {
            width: 45px; height: 45px;
            background: var(--surface);
            border-radius: 12px; display: flex; justify-content: center; align-items: center;
            font-size: 20px; box-shadow: 0 5px 15px var(--shadow-color);
        }

        .card-role-text h4 { font-size: 16px; color: var(--text-main); margin-bottom: 2px;}
        .card-role-text p { font-size: 12px; color: var(--text-muted); margin: 0;}

        .card-salary {
            bottom: 60px; right: 20px;
            background: #d9f99d; /* Keeps the lime accent regardless of theme */
            animation-delay: 1.5s;
        }

        .card-salary .label {
            font-size: 13px; font-weight: 600; color: #4d7c0f;
            margin-bottom: 8px; display: flex; align-items: center; gap: 8px;
        }

        .card-salary .amount {
            font-size: 28px; font-weight: 800; color: #1e293b; margin-bottom: 20px;
        }

        /* Simulated slider */
        .slider-track {
            height: 6px; background: rgba(0,0,0,0.1); border-radius: 3px;
            position: relative; width: 220px;
        }
        .slider-fill {
            position: absolute; height: 100%; background: #4d7c0f;
            width: 60%; left: 20%; border-radius: 3px;
        }
        .slider-knob {
            width: 20px; height: 20px; background: white; border-radius: 50%;
            position: absolute; top: -7px; box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        /* REDESIGNED COMPANY BANNER (Glassmorphism instead of solid black) */
        .company-banner {
            background: var(--banner-bg);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            margin: 20px auto 60px auto;
            padding: 35px 0;
            border-radius: 24px;
            max-width: 1300px;
            box-shadow: 0 10px 30px var(--shadow-color);
        }

        .company-logos {
            display: flex; justify-content: space-around; align-items: center;
            max-width: 1100px; margin: 0 auto;
        }

        .company-logos span {
            color: var(--logo-color); font-size: 28px; font-weight: 800;
            letter-spacing: -1px; opacity: 0.7; transition: 0.3s;
        }
        
        .company-logos span:hover {
            opacity: 1; transform: scale(1.05); cursor: pointer;
        }

    </style>
</head>
<body>

    <nav>
        <div class="logo">OJPMS.</div>
        <div class="nav-links">
            <a href="#">Jobs</a>
            <a href="#">Companies</a>
            <a href="#">Assessments</a>
            
            <!-- Dark Mode Toggle -->
            <label class="theme-switch" title="Toggle Theme">
                <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
                <span class="slider"></span>
            </label>

            <a href="login.jsp" class="auth-btn">Log in</a>
        </div>
    </nav>

    <section class="hero">
        <div class="hero-content">
            <h1>Finding the<br>job beyond<br>borders</h1>
            <p>Discover top tech roles, connect with recruiters, and launch your career as a system engineer or developer.</p>

            <div class="search-box">
                <div class="search-input">
                    <span style="margin-right: 10px;">🔍</span>
                    <input type="text" placeholder="Search role (e.g. Java Developer)">
                </div>
                <div class="search-select">
                    <select>
                        <option>Location</option>
                        <option>Pune</option>
                        <option>Remote</option>
                    </select>
                </div>
                <button class="search-btn">Search</button>
            </div>
        </div>

        <div class="hero-visuals">
            <!-- Glowing Orb Background -->
            <div class="abstract-orb"></div>

            <!-- Top Left Floating Card -->
            <div class="float-card card-role">
                <div class="card-role-icon">☕</div>
                <div class="card-role-text">
                    <h4>Java Backend</h4>
                    <p>83 New Roles</p>
                </div>
            </div>

            <!-- Top Right Floating Card -->
            <div class="float-card card-role" style="top: 120px; right: 10px; animation-delay: 2.5s;">
                <div class="card-role-icon">💻</div>
                <div class="card-role-text">
                    <h4>Assoc. System Engineer</h4>
                    <p>Actively Hiring</p>
                </div>
            </div>

            <!-- Bottom Floating Salary Card -->
            <div class="float-card card-salary">
                <div class="label">💼 Base Salary</div>
                <div class="amount">₹6,00,000+</div>
                <div class="slider-track">
                    <div class="slider-fill"></div>
                    <div class="slider-knob" style="left: 20%;"></div>
                    <div class="slider-knob" style="left: 80%;"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Refined Company Banner -->
    <div class="company-banner">
        <div class="company-logos">
            <span>TCS</span>
            <span>Cognizant</span>
            <span>IBM</span>
            <span>EY</span>
            <span>Mastercard</span>
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
    <title>TAMS - Modern Job Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* CSS VARIABLES */
        :root {
            --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
            --text-main: #1e293b;
            --text-muted: #475569;
            --surface: #ffffff;
            --glass-bg: rgba(255, 255, 255, 0.5);
            --glass-border: rgba(255, 255, 255, 0.8);
            --primary: #a3e635; 
            --primary-hover: #84cc16;
            --nav-btn-bg: #0f172a;
            --nav-btn-text: #ffffff;
            --banner-bg: rgba(255, 255, 255, 0.3);
            --logo-color: #475569;
            --shadow-color: rgba(0, 0, 0, 0.08);
            --orb-color: linear-gradient(135deg, #93c5fd, #c4b5fd);
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
            --banner-bg: rgba(30, 41, 59, 0.4);
            --logo-color: #cbd5e1;
            --shadow-color: rgba(0, 0, 0, 0.3);
            --orb-color: linear-gradient(135deg, #3b82f6, #8b5cf6);
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

        /* NAVBAR (Balanced Size) */
        nav {
            max-width: 1300px;
            margin: 0 auto;
            padding: 25px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 26px;
            font-weight: 800;
            color: var(--text-main);
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
            font-size: 15px;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: var(--text-main);
        }

        /* THEME TOGGLE */
        .theme-switch { position: relative; width: 48px; height: 26px; display: inline-block; }
        .theme-switch input { opacity: 0; width: 0; height: 0; }
        .slider {
            position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0;
            background-color: var(--surface); border: 1px solid var(--glass-border);
            transition: .4s; border-radius: 34px;
        }
        .slider:before {
            position: absolute; content: "☀️"; height: 18px; width: 18px; left: 3px; bottom: 3px;
            background-color: transparent; transition: .4s; font-size: 13px;
            display: flex; justify-content: center; align-items: center;
        }
        input:checked + .slider:before { transform: translateX(22px); content: "🌙"; }

        .auth-btn {
            background: var(--nav-btn-bg);
            color: var(--nav-btn-text);
            padding: 12px 28px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .auth-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px var(--shadow-color);
        }

        /* HERO SECTION */
        .hero {
            max-width: 1300px;
            margin: 30px auto;
            padding: 0 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 40px;
        }

        .hero-content {
            flex: 1;
            max-width: 580px;
        }

        .hero h1 {
            font-size: 62px; /* Perfect middle ground */
            line-height: 1.1;
            font-weight: 800;
            margin-bottom: 22px;
            letter-spacing: -1.5px;
            color: var(--text-main);
        }

        .hero p {
            font-size: 16px;
            color: var(--text-muted);
            margin-bottom: 35px;
            line-height: 1.6;
        }

        /* SEARCH BAR */
        .search-box {
            display: flex;
            background: var(--surface);
            padding: 10px;
            border-radius: 16px;
            box-shadow: 0 15px 35px var(--shadow-color);
            gap: 12px;
            border: 1px solid var(--glass-border);
        }

        .search-input {
            flex: 1; display: flex; align-items: center;
            padding: 0 18px; border-right: 1px solid var(--glass-border);
        }

        .search-input input {
            border: none; outline: none; width: 100%;
            font-size: 15px; color: var(--text-main);
            background: transparent;
        }

        .search-select {
            padding: 0 18px; display: flex; align-items: center;
        }

        .search-select select {
            border: none; outline: none; font-size: 15px;
            color: var(--text-main); background: transparent; cursor: pointer;
        }

        .search-btn {
            background: var(--primary);
            color: #1e293b;
            border: none; padding: 14px 35px; border-radius: 12px;
            font-weight: 600; font-size: 15px; cursor: pointer;
            transition: background 0.3s;
        }
        .search-btn:hover { background: var(--primary-hover); }

        /* VISUAL ELEMENTS */
        .hero-visuals {
            flex: 1; position: relative; height: 460px;
            display: flex; justify-content: center; align-items: center;
        }

        /* Glowing orb */
        .abstract-orb {
            width: 320px; height: 320px;
            background: var(--orb-color);
            border-radius: 50%;
            filter: blur(60px);
            opacity: 0.6;
            position: absolute;
            animation: pulse 8s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 0.7; }
        }

        /* Floating Cards - Fixed the stretching issue */
        .float-card {
            position: absolute;
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 20px;
            border-radius: 18px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 15px 35px var(--shadow-color);
            animation: float 6s ease-in-out infinite;
            width: max-content; /* This prevents the stretching bug! */
            max-width: 300px;
        }

        .card-role {
            display: flex; align-items: center; gap: 15px;
            padding: 15px 22px;
        }
        
        .card-role-icon {
            width: 40px; height: 40px;
            background: var(--surface);
            border-radius: 12px; display: flex; justify-content: center; align-items: center;
            font-size: 18px; box-shadow: 0 5px 15px var(--shadow-color);
            flex-shrink: 0;
        }

        .card-role-text h4 { font-size: 15px; color: var(--text-main); margin-bottom: 2px;}
        .card-role-text p { font-size: 12px; color: var(--text-muted); margin: 0;}

        /* Card Positions */
        .card-1 { top: 30px; left: -10px; }
        .card-2 { top: 110px; right: -20px; animation-delay: 2.5s; }

        .card-salary {
            bottom: 40px; right: 20px;
            background: #d9f99d; 
            animation-delay: 1.5s;
        }

        .card-salary .label {
            font-size: 12px; font-weight: 600; color: #4d7c0f;
            margin-bottom: 8px; display: flex; align-items: center; gap: 8px;
        }

        .card-salary .amount {
            font-size: 26px; 
            font-weight: 800; color: #1e293b; margin-bottom: 18px;
        }

        /* Simulated slider */
        .slider-track {
            height: 5px; background: rgba(0,0,0,0.1); border-radius: 3px;
            position: relative; width: 200px;
        }
        .slider-fill {
            position: absolute; height: 100%; background: #4d7c0f;
            width: 60%; left: 20%; border-radius: 3px;
        }
        .slider-knob {
            width: 18px; height: 18px; background: white; border-radius: 50%;
            position: absolute; top: -6.5px; box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }

        /* COMPANY BANNER */
        .company-banner {
            background: var(--banner-bg);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            margin: 20px auto 50px auto;
            padding: 30px 0;
            border-radius: 22px;
            max-width: 1200px;
            box-shadow: 0 10px 30px var(--shadow-color);
        }

        .company-logos {
            display: flex; justify-content: space-around; align-items: center;
            max-width: 1000px; margin: 0 auto;
        }

        .company-logos span {
            color: var(--logo-color); font-size: 26px; 
            font-weight: 800;
            letter-spacing: -1px; opacity: 0.7; transition: 0.3s;
        }
        
        .company-logos span:hover {
            opacity: 1; transform: scale(1.05); cursor: pointer;
        }

    </style>
</head>
<body>

    <nav>
        <div class="logo">CareerSync</div>
        <div class="nav-links">
            <a href="#">Jobs</a>
            <a href="#">Companies</a>
            <a href="#">Assessments</a>
            
            <!-- Dark Mode Toggle -->
            <label class="theme-switch" title="Toggle Theme">
                <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
                <span class="slider"></span>
            </label>

            <a href="login.jsp" class="auth-btn">Log in</a>
        </div>
    </nav>

    <section class="hero">
        <div class="hero-content">
            <h1>Finding the<br>job beyond<br>borders</h1>
            <p>Discover top tech roles, connect with recruiters, and launch your career as a system engineer or developer.</p>

            <div class="search-box">
                <div class="search-input">
                    <span style="margin-right: 10px; font-size: 15px;">🔍</span>
                    <input type="text" placeholder="Search role (e.g. Java)">
                </div>
                <div class="search-select">
                    <select>
                        <option>Location</option>
                        <option>Pune</option>
                        <option>Remote</option>
                    </select>
                </div>
                <button class="search-btn">Search</button>
            </div>
        </div>

        <div class="hero-visuals">
            <!-- Glowing Orb Background -->
            <div class="abstract-orb"></div>

            <!-- Top Left Floating Card -->
            <div class="float-card card-role card-1">
                <div class="card-role-icon">☕</div>
                <div class="card-role-text">
                    <h4>Java Backend</h4>
                    <p>83 New Roles</p>
                </div>
            </div>

            <!-- Top Right Floating Card (Fixed Stretching Bug) -->
            <div class="float-card card-role card-2">
                <div class="card-role-icon">💻</div>
                <div class="card-role-text">
                    <h4>Assoc. System Engineer</h4>
                    <p>Actively Hiring</p>
                </div>
            </div>

            <!-- Bottom Floating Salary Card -->
            <div class="float-card card-salary">
                <div class="label">💼 Base Salary</div>
                <div class="amount">₹6,00,000+</div>
                <div class="slider-track">
                    <div class="slider-fill"></div>
                    <div class="slider-knob" style="left: 20%;"></div>
                    <div class="slider-knob" style="left: 80%;"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Company Banner -->
    <div class="company-banner">
        <div class="company-logos">
            <span>TCS</span>
            <span>Cognizant</span>
            <span>IBM</span>
            <span>EY</span>
            <span>Mastercard</span>
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
</html>
