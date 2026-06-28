<%-- <%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="border: 2px solid black; margin: 10px; padding: 10px">
  Id : ${user.getId() }
  Name : ${user.name } <br>
  Email : ${user.email } <br>
  Role : ${user.role } <br>
  
  
  
  <form action="editprofile">
  		<input type="text" hidden="" name="userId" value="${user.getId() }"><br>
  		<input type="submit" value="Edit">
  </form>
  
</div>

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
<title>My Profile | OJPMS</title>

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
    background:#f5f7fb;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* Profile Card */

.profile-card{
    width:500px;
    background:white;
    border-radius:25px;
    overflow:hidden;

    box-shadow:
    0 20px 50px rgba(0,0,0,.08);
}

/* Top Banner */

.banner{
    height:130px;
    background:linear-gradient(
    135deg,
    #2563eb,
    #4f46e5);
}

/* Avatar */

.avatar{
    width:120px;
    height:120px;

    border-radius:50%;

    background:white;

    margin:-60px auto 15px;

    display:flex;
    justify-content:center;
    align-items:center;

    font-size:40px;
    font-weight:700;

    color:#2563eb;

    border:6px solid white;
}

.profile-body{
    padding:25px;
    text-align:center;
}

.profile-name{
    font-size:28px;
    font-weight:700;
    color:#111827;
}

.role{
    color:#2563eb;
    font-weight:600;
    margin-top:5px;
}

.info{
    margin-top:30px;
    text-align:left;
}

.info-item{
    background:#f8fafc;
    padding:15px 20px;
    border-radius:15px;
    margin-bottom:15px;
}

.label{
    color:#6b7280;
    font-size:13px;
}

.value{
    color:#111827;
    font-weight:600;
    margin-top:4px;
}

/* Buttons */

.actions{
    margin-top:30px;
    display:flex;
    gap:15px;
}

.actions form{
    flex:1;
}

.btn{
    width:100%;
    border:none;
    padding:14px;
    border-radius:14px;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.edit-btn{
    background:#2563eb;
    color:white;
}

.edit-btn:hover{
    background:#1d4ed8;
    transform:translateY(-3px);
}

.back-btn{
    background:#eef2ff;
    color:#2563eb;
}

.back-btn:hover{
    transform:translateY(-3px);
}

</style>

</head>
<body>

<div class="profile-card">

    <div class="banner"></div>

    <div class="avatar">
        ${user.name.substring(0,1)}
    </div>

    <div class="profile-body">

        <div class="profile-name">
            ${user.name}
        </div>

        <div class="role">
            ${user.role}
        </div>

        <div class="info">

            <div class="info-item">
                <div class="label">User ID</div>
                <div class="value">${user.id}</div>
            </div>

            <div class="info-item">
                <div class="label">Email Address</div>
                <div class="value">${user.email}</div>
            </div>

            <div class="info-item">
                <div class="label">Account Type</div>
                <div class="value">${user.role}</div>
            </div>

        </div>

        <div class="actions">

            <form action="editprofile">
                <input type="hidden"
                       name="userId"
                       value="${user.id}">
                <button class="btn edit-btn">
                    Edit Profile
                </button>
            </form>

            <button class="btn back-btn"
                onclick="history.back()">
                Back
            </button>

        </div>

    </div>

</div>

<script src="js/theme.js"></script>
</body>
</html>  --%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile | OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    :root {
        --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
        --text-main: #1e293b;
        --text-muted: #475569;
        --surface: #ffffff;
        --glass-bg: rgba(255, 255, 255, 0.45);
        --glass-border: rgba(255, 255, 255, 0.7);
        --primary: #a3e635; 
        --primary-hover: #84cc16;
        --shadow-color: rgba(0, 0, 0, 0.05);
        --orb-color: linear-gradient(135deg, #93c5fd, #a7f3d0);
        --info-card-bg: rgba(255, 255, 255, 0.6);
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
        --info-card-bg: rgba(15, 23, 42, 0.4);
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

    /* FLOATING GLASS BACKGROUND ELEMENTS */
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

    /* WIDE SPLIT LAYOUT PANEL */
    .main-container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px 20px;
    }

    .profile-window {
        width: 100%;
        max-width: 800px; /* Widened for a professional dashboard look */
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
        border-radius: 32px; /* Smooth squircle shape */
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

    /* RIGHT CONTENT SECTION */
    .content-panel {
        padding: 40px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
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

    .info-grid {
        display: grid;
        grid-template-columns: 1fr;
        gap: 16px;
    }

    .info-row {
        background: var(--info-card-bg);
        border: 1px solid var(--glass-border);
        padding: 16px 22px;
        border-radius: 16px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        transition: 0.3s ease;
    }
    .info-row:hover {
        border-color: var(--primary);
        transform: scale(1.01);
    }

    .info-meta .label {
        font-size: 11px;
        color: var(--text-muted);
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 2px;
    }

    .info-meta .value {
        font-size: 15px;
        color: var(--text-main);
        font-weight: 600;
    }

    .info-icon {
        font-size: 20px;
        opacity: 0.7;
    }

    /* COMPACT BUTTON ROW */
    .action-row {
        margin-top: 35px;
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
        text-decoration: none;
        transition: 0.3s;
    }

    .btn-edit {
        background: var(--primary);
        color: #1e293b;
        box-shadow: 0 8px 20px rgba(163, 230, 53, 0.2);
    }
    .btn-edit:hover {
        background: var(--primary-hover);
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(163, 230, 53, 0.35);
    }

    .btn-back {
        background: rgba(255, 255, 255, 0.15);
        border: 1px solid var(--glass-border);
        color: var(--text-main);
    }
    .btn-back:hover {
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
                <div class="avatar-glowing">⚡</div>
                <div class="user-tag">
                    <h2>${user.name}</h2>
                    <span class="role-badge">${user.role}</span>
                </div>
            </div>

            <!-- RIGHT PANEL CONTENT -->
            <div class="content-panel">
                <div>
                    <h3 class="panel-title">Account Security Profile</h3>
                    
                    <div class="info-grid">
                        <div class="info-row">
                            <div class="info-meta">
                                <div class="label">User Unique Identification</div>
                                <div class="value">#${user.id}</div>
                            </div>
                            <div class="info-icon">🆔</div>
                        </div>

                        <div class="info-row">
                            <div class="info-meta">
                                <div class="label">Verified Email Address</div>
                                <div class="value">${user.email}</div>
                            </div>
                            <div class="info-icon">✉️</div>
                        </div>

                        <div class="info-row">
                            <div class="info-meta">
                                <div class="label">System Access Level</div>
                                <div class="value">${user.role}</div>
                            </div>
                            <div class="info-icon">🛡️</div>
                        </div>
                    </div>
                </div>

                <!-- ACTION BUTTONS -->
                <div class="action-row">
                    <form action="editprofile" method="GET" style="flex: 1;">
                        <input type="hidden" name="userId" value="${user.id}">
                        <button type="submit" class="btn btn-edit">📝 Modify Settings</button>
                    </form>

                    <button class="btn btn-back" onclick="history.back()">↩️ Return</button>
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