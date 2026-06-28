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
      <h1>Welcome to login page</h1>
		<form action="login" method="post">
		   	Email : <input type="email" name="email" required="required">
			         <br>
			Password : <input type="password" name="password">
			        <br>
			        <input type="submit" value="Login">
		</form>
		<br>
		
		<a href="reset.jsp">forget Password</a>
		
		<p style="color: red;">${error}</p>
		
		<p style="color: green"> ${msg }</p>

</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - OJPMS</title>
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
            --error-bg: #fee2e2;
            --error-text: #b91c1c;
            --success-bg: #dcfce7;
            --success-text: #15803d;
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
            --error-bg: rgba(185, 28, 28, 0.2);
            --error-text: #fca5a5;
            --success-bg: rgba(21, 128, 61, 0.2);
            --success-text: #86efac;
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
            overflow: hidden;
        }

        /* MINIMAL NAVBAR */
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

        /* MAIN CONTAINER */
        .container {
            display: flex;
            flex: 1;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        /* BACKGROUND ORBS */
        .abstract-orb {
            width: 350px; height: 350px;
            background: var(--orb-color);
            border-radius: 50%;
            filter: blur(70px);
            opacity: 0.5;
            position: absolute;
            animation: pulse 8s ease-in-out infinite;
            z-index: 1;
        }
        .orb-1 { top: -50px; left: -50px; }
        .orb-2 { bottom: -50px; right: -50px; animation-delay: 3s; }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.4; }
            50% { transform: scale(1.1); opacity: 0.6; }
        }

        /* LOGIN CARD */
        .card {
            width: 100%;
            max-width: 400px; /* Perfectly compact */
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 40px;
            border-radius: 24px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 20px 40px var(--shadow-color);
            position: relative;
            z-index: 10;
        }

        .card h1 {
            font-size: 26px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: var(--text-muted);
            font-size: 13px;
            margin-bottom: 30px;
        }

        /* MESSAGES (EL EXPRESSIONS) */
        .alert {
            padding: 10px 15px;
            border-radius: 10px;
            font-size: 13px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
            display: none; /* Hidden by default, shown if content exists */
        }

        .alert:not(:empty) {
            display: block;
        }

        .alert-error {
            background: var(--error-bg);
            color: var(--error-text);
            border: 1px solid rgba(185, 28, 28, 0.3);
        }

        .alert-success {
            background: var(--success-bg);
            color: var(--success-text);
            border: 1px solid rgba(21, 128, 61, 0.3);
        }

        /* INPUTS */
        .input-group {
            margin-bottom: 18px;
        }

        .input-group label {
            display: block;
            margin-bottom: 6px;
            color: var(--text-main);
            font-weight: 600;
            font-size: 13px;
        }

        .input-group input {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid var(--input-border);
            border-radius: 12px;
            font-size: 14px;
            background: var(--input-bg);
            color: var(--text-main);
            transition: 0.3s;
            outline: none;
        }

        .input-group input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(163, 230, 53, 0.2);
        }

        /* BUTTON */
        .submit-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: var(--primary);
            color: #1e293b;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(163, 230, 53, 0.3);
        }

        /* FOOTER LINKS */
        .footer {
            text-align: center;
            margin-top: 25px;
            font-size: 13px;
            color: var(--text-muted);
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .footer a {
            text-decoration: none;
            color: var(--text-main);
            font-weight: 600;
            transition: 0.3s;
        }

        .footer a:hover {
            color: var(--primary);
        }

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
        <div class="abstract-orb orb-1"></div>
        <div class="abstract-orb orb-2"></div>

        <div class="card">
            <h1>Welcome Back</h1>
            <p class="subtitle">Sign in to continue your career journey.</p>

            <div class="alert alert-error">${error}</div>
            <div class="alert alert-success">${msg}</div>

            <form action="login" method="post">
                <div class="input-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="name@example.com" required>
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Enter your password" required>
                </div>

                <button type="submit" class="submit-btn">Log in</button>
            </form>

            <div class="footer">
                <div>
                    Don't have an account? <a href="register.jsp">Register here</a>
                </div>
                <div>
                    <a href="reset.jsp" style="color: var(--text-muted); font-weight: 500; text-decoration: underline;">Forgot Password?</a>
                </div>
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