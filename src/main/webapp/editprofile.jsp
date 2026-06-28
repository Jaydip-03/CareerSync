<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="edituserprofile" method="post">
   Id : <input type="number" name="id" value="${user.getId() }" readonly="readonly"><br>
   Name : <input type="text" name="name" value="${user.name }"> <br>
   Email : <input type="text" name="email" value="${user.email }"> <br>
   password : <input type="password" name="password" placeholder="Enter new password"> <br>
              <input type="text" name="role" hidden="" value="${user.role }">
   
   <input type="submit" value="EDIT_PROFILE">
   </form>

</body>
</html> --%>

<%-- 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile | OJPMS</title>

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

    background:#f5f7fb;
}

/* CARD */

.card{
    width:500px;
    background:white;
    border-radius:25px;
    overflow:hidden;

    box-shadow:
    0 20px 50px rgba(0,0,0,.08);
}

/* TOP */

.top{
    height:120px;
    background:linear-gradient(
    135deg,
    #2563eb,
    #4f46e5);
}

.avatar{

    width:110px;
    height:110px;

    background:white;

    border-radius:50%;

    display:flex;
    justify-content:center;
    align-items:center;

    margin:-55px auto 15px;

    font-size:40px;
    font-weight:700;

    color:#2563eb;

    border:5px solid white;
}

.content{
    padding:25px;
}

.heading{
    text-align:center;
    margin-bottom:30px;
}

.heading h2{
    color:#111827;
}

.heading p{
    color:#6b7280;
    margin-top:5px;
}

/* INPUTS */

.form-group{
    margin-bottom:18px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
    color:#374151;
}

.form-group input{
    width:100%;
    padding:14px;

    border:1px solid #d1d5db;
    border-radius:12px;

    outline:none;

    transition:.3s;
}

.form-group input:focus{
    border-color:#2563eb;
    box-shadow:0 0 0 4px rgba(37,99,235,.15);
}

/* BUTTONS */

.btns{
    display:flex;
    gap:15px;
    margin-top:25px;
}

.btn{
    flex:1;

    border:none;

    padding:14px;

    border-radius:12px;

    font-size:15px;
    font-weight:600;

    cursor:pointer;

    transition:.3s;
}

.save-btn{
    background:#2563eb;
    color:white;
}

.save-btn:hover{
    background:#1d4ed8;
    transform:translateY(-3px);
}

.cancel-btn{
    background:#eef2ff;
    color:#2563eb;
}

.cancel-btn:hover{
    transform:translateY(-3px);
}

</style>

</head>
<body>

<div class="card">

    <div class="top"></div>

    <div class="avatar">
        ${user.name.substring(0,1)}
    </div>

    <div class="content">

        <div class="heading">
            <h2>Edit Profile</h2>
            <p>Update your account information</p>
        </div>

        <form action="edituserprofile" method="post">

            <div class="form-group">
                <label>User ID</label>
                <input type="number"
                       name="id"
                       value="${user.id}"
                       readonly>
            </div>

            <div class="form-group">
                <label>Full Name</label>
                <input type="text"
                       name="name"
                       value="${user.name}">
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email"
                       name="email"
                       value="${user.email}">
            </div>

            <div class="form-group">
                <label>New Password</label>
                <input type="password"
                       name="password"
                       placeholder="Leave blank to keep current password">
            </div>

            <input type="hidden"
                   name="role"
                   value="${user.role}">

            <div class="btns">

                <button type="submit"
                        class="btn save-btn">
                    Save Changes
                </button>

                <button type="button"
                        class="btn cancel-btn"
                        onclick="history.back()">
                    Cancel
                </button>

            </div>

        </form>

    </div>

</div>

<script src="js/theme.js"></script>
</body>
</html> --%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile | OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
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
        --input-bg: rgba(255, 255, 255, 0.6);
        --placeholder-color: rgba(30, 41, 59, 0.4);
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
        --input-bg: rgba(15, 23, 42, 0.4);
        --placeholder-color: rgba(248, 250, 252, 0.4);
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
        50% { transform: scale(1.1) translate(30px, 20px); }
        100% { transform: scale(1) translate(0, 0); }
    }

    /* GLASS HEADER */
    nav {
        max-width: 1400px;
        width: 95%;
        margin: 0 auto;
        padding: 25px 40px;
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

    /* LAYOUT CONTAINER */
    .main-container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 30px 20px;
    }

    .profile-window {
        width: 100%;
        max-width: 800px; /* Matched flawlessly with your profile view layout */
        background: var(--glass-bg);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        border-radius: 28px;
        border: 1px solid var(--glass-border);
        box-shadow: 0 25px 50px var(--shadow-color);
        display: grid;
        grid-template-columns: 280px 1fr;
        overflow: hidden;
    }

    /* LEFT SIDEBAR SECTION */
    .sidebar-panel {
        background: rgba(255, 255, 255, 0.25);
        [data-theme="dark"] & { background: rgba(0, 0, 0, 0.15); }
        border-right: 1px solid var(--glass-border);
        padding: 40px 25px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
    }

    .avatar-glowing {
        width: 110px;
        height: 110px;
        border-radius: 32px;
        background: var(--surface);
        border: 2px solid var(--glass-border);
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 44px;
        box-shadow: 0 15px 30px var(--shadow-color);
        position: relative;
        margin-bottom: 20px;
    }
    
    .avatar-glowing::after {
        content: '';
        position: absolute;
        inset: -4px;
        border-radius: 36px;
        border: 2px solid var(--primary);
        opacity: 0.6;
    }

    .user-tag h2 {
        font-size: 22px;
        font-weight: 800;
        letter-spacing: -0.5px;
        color: var(--text-main);
    }

    .role-badge {
        display: inline-block;
        margin-top: 8px;
        padding: 4px 14px;
        background: var(--primary);
        color: #1e293b;
        font-size: 11px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 1px;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(163, 230, 53, 0.3);
    }

    /* RIGHT CONTENT SECTION (FORM) */
    .content-panel {
        padding: 40px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .panel-title {
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 25px;
        letter-spacing: -0.5px;
        position: relative;
    }
    .panel-title::before {
        content: '';
        position: absolute;
        bottom: -6px;
        left: 0;
        width: 40px;
        height: 3px;
        background: var(--primary);
        border-radius: 2px;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr;
        gap: 16px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
    }

    .form-group label {
        font-size: 11px;
        color: var(--text-muted);
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 6px;
    }

    .form-group input {
        width: 100%;
        padding: 12px 18px;
        border-radius: 12px;
        border: 1px solid var(--glass-border);
        background: var(--input-bg);
        color: var(--text-main);
        font-size: 14px;
        font-weight: 500;
        outline: none;
        transition: 0.3s ease;
    }

    .form-group input::placeholder {
        color: var(--placeholder-color);
        opacity: 1;
    }

    .form-group input:focus {
        border-color: var(--primary);
        background: var(--surface);
        box-shadow: 0 0 0 3px rgba(163, 230, 53, 0.15);
    }

    .form-group input[readonly] {
        cursor: not-allowed;
        opacity: 0.7;
        background: rgba(0,0,0,0.03);
        [data-theme="dark"] & { background: rgba(255,255,255,0.02); }
    }

    /* ACTION BUTTONS BUTTONS */
    .action-row {
        margin-top: 30px;
        display: flex;
        gap: 14px;
    }

    .btn {
        flex: 1;
        border: none;
        padding: 14px;
        font-size: 14px;
        font-weight: 700;
        border-radius: 12px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 8px;
        transition: 0.3s;
    }

    .btn-save {
        background: var(--primary);
        color: #1e293b;
        box-shadow: 0 8px 20px rgba(163, 230, 53, 0.2);
    }
    .btn-save:hover {
        background: var(--primary-hover);
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(163, 230, 53, 0.35);
    }

    .btn-cancel {
        background: rgba(255, 255, 255, 0.15);
        border: 1px solid var(--glass-border);
        color: var(--text-main);
    }
    .btn-cancel:hover {
        background: var(--surface);
        transform: translateY(-2px);
    }

</style>
</head>
<body>

    <div class="abstract-orb orb-1"></div>
    <div class="abstract-orb orb-2"></div>

    <nav>
        <a href="index.jsp" class="logo">CareerSync</a>
        <label class="theme-switch" title="Toggle Theme">
            <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
            <span class="slider"></span>
        </label>
    </nav>

    <div class="main-container">
        <div class="profile-window">
            
            <!-- LEFT PANEL SIDEBAR -->
            <div class="sidebar-panel">
                <!-- Swapped substring letter with a solid safe icon to ensure it never crashes -->
                <div class="avatar-glowing">⚙️</div>
                <div class="user-tag">
                    <h2>${user.name}</h2>
                    <span class="role-badge">${user.role}</span>
                </div>
            </div>

            <!-- RIGHT PANEL FORM CONTENT -->
            <div class="content-panel">
                <h3 class="panel-title">Update Account Information</h3>
                
                <form action="edituserprofile" method="post">
                    <div class="form-grid">
                        <div class="form-group">
                            <label>User ID</label>
                            <input type="number" name="id" value="${user.id}" readonly>
                        </div>

                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" name="name" value="${user.name}" required>
                        </div>

                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" name="email" value="${user.email}" required>
                        </div>

                        <div class="form-group">
                            <label>New Password</label>
                            <input type="password" name="password" placeholder="Leave blank to keep current password">
                        </div>
                    </div>

                    <!-- Hidden fields to retain state -->
                    <input type="hidden" name="role" value="${user.role}">

                    <!-- ACTION ROW -->
                    <div class="action-row">
                        <button type="submit" class="btn btn-save">💾 Save Changes</button>
                        <button type="button" class="btn btn-cancel" onclick="history.back()">❌ Cancel</button>
                    </div>
                </form>

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