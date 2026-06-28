<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	width: 90%;
	margin: auto;
}

.job-card {
	background: white;
	padding: 25px;
	margin-bottom: 20px;
	border-radius: 15px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	transition: 0.3s;
}

.job-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

.job-title {
	color: #2563eb;
	margin-bottom: 10px;
}

body {
	background: #f1f5f9;
	font-family: Poppins, sans-serif;
}



.withdraw-btn{

    background:#ef4444;

    color:white;

    border:none;

    padding:10px 18px;

    border-radius:10px;

    cursor:pointer;

    margin-top:10px;

    font-weight:600;

    transition:.3s;
}

.withdraw-btn:hover{

    background:#dc2626;

    transform:translateY(-2px);
}


.back-btn{

    text-decoration:none;

    background:#2563eb;

    color:white;

    padding:12px 20px;

    border-radius:12px;

    font-weight:600;

    display:inline-block;

    margin-bottom:25px;

    transition:.3s;
}

.back-btn:hover{

    transform:translateY(-2px);

    background:#1d4ed8;
}


</style>
</head>
<body>

<div class="top-bar">

    <a href="user-dashboard.jsp"
       class="back-btn">

       ← Back To Dashboard

    </a>

</div>


	

	<div class="container">

<c:forEach var="a" items="${applications}">

<div class="job-card">

    <h2 class="job-title">
        ${a.job.title}
    </h2>

    <p>${a.job.description}</p>

    <p>
        📍 ${a.job.location}
    </p>

    <p>
        💰 ₹ ${a.job.salary}
    </p>

    <!-- STATUS BADGE HERE -->
    
    <c:choose>

    <c:when test="${a.status=='ACCEPTED'}">

        <span style="
        background:#dcfce7;
        color:#166534;
        padding:8px 15px;
        border-radius:20px;
        font-weight:bold;">

        🟢 ACCEPTED

        </span>

    </c:when>

    <c:when test="${a.status=='REJECTED'}">

        <span style="
        background:#fee2e2;
        color:#991b1b;
        padding:8px 15px;
        border-radius:20px;
        font-weight:bold;">

        🔴 REJECTED

        </span>

    </c:when>

    <c:otherwise>

        <span style="
        background:#fef9c3;
        color:#854d0e;
        padding:8px 15px;
        border-radius:20px;
        font-weight:bold;">

        🟡 APPLIED

        </span>

    </c:otherwise>

</c:choose>

<div class="status-badge">
    ${a.status}
</div>

<c:if test="${a.status == 'APPLIED'}">

<form action="withdrawapplication"
      onsubmit="return confirm('Withdraw this application?')">

    <input type="hidden"
           name="applicationId"
           value="${a.id}">

    <button class="withdraw-btn">
        Withdraw Application
    </button>

</form>

</c:if>

</div>

</c:forEach>

</div>

<c:if test="${param.msg=='withdrawn'}">
    <p class="success-msg">
        Application Withdrawn Successfully
    </p>
</c:if>

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
<title>Track Applications | OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    /* CORE THEME INTEGRATION SYSTEM */
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
        --header-bg: rgba(255, 255, 255, 0.6);
        --header-border: rgba(255, 255, 255, 0.5);
        --nav-active-bg: rgba(255, 255, 255, 0.8);
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
        --header-bg: rgba(15, 23, 42, 0.4);
        --header-border: rgba(255, 255, 255, 0.03);
        --nav-active-bg: rgba(255, 255, 255, 0.07);
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

    /* BACKGROUND DECORATIVE ELEMENTS */
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

    /* FULL-WIDTH STATIC APP HEADER */
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
        transition: 0.4s;
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

    /* Navigation Capsule Controls */
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
    .nav-link:hover { color: var(--text-main); }
    
    .nav-link.active {
        background: var(--nav-active-bg);
        color: var(--text-main);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        border: 1px solid var(--glass-border);
    }

    .nav-right-actions {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    /* THEME TOGGLE SWITCH */
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
    }

    /* TRACKER CONTENT BOARD WRAPPER */
    .tracker-container {
        max-width: 1000px;
        width: 90%;
        margin: 40px auto;
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .page-title-block {
        margin-bottom: 10px;
    }
    .page-title-block h1 {
        font-size: 32px;
        font-weight: 800;
        letter-spacing: -1px;
    }
    .page-title-block p {
        font-size: 14px;
        color: var(--text-muted);
    }

    /* SYSTEM PIPELINE PROFILE CARDS */
    .job-card {
        background: var(--card-bg);
        border: 1px solid var(--glass-border);
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0 10px 25px var(--shadow-color);
        transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        display: grid;
        grid-template-columns: 1fr auto;
        align-items: center;
        gap: 20px;
    }

    .job-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 15px 35px var(--shadow-color);
    }

    .job-card-details h2 {
        font-size: 22px;
        font-weight: 700;
        color: var(--text-main);
        letter-spacing: -0.5px;
        margin-bottom: 6px;
    }

    .job-card-details p {
        font-size: 14px;
        color: var(--text-muted);
        line-height: 1.5;
        margin-bottom: 12px;
    }

    .meta-tags-row {
        display: flex;
        gap: 12px;
        align-items: center;
    }

    .meta-tag {
        font-size: 12px;
        font-weight: 600;
        color: var(--text-muted);
        background: rgba(255, 255, 255, 0.3);
        border: 1px solid var(--glass-border);
        padding: 4px 12px;
        border-radius: 8px;
    }

    /* STATUS HOOK PLACEMENTS */
    .pipeline-status {
        display: inline-flex;
        align-items: center;
        padding: 6px 14px;
        border-radius: 10px;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        width: fit-content;
    }

    .status-accepted { background: rgba(34, 197, 94, 0.15); color: #166534; [data-theme="dark"] & { color: #4ade80; } }
    .status-rejected { background: rgba(239, 68, 68, 0.15); color: #991b1b; [data-theme="dark"] & { color: #fca5a5; } }
    .status-applied { background: rgba(234, 179, 8, 0.15); color: #854d0e; [data-theme="dark"] & { color: #fde047; } }

    /* ACTION MANAGEMENT HOOKS */
    .action-control-panel {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        gap: 15px;
    }

    .withdraw-btn {
        background: rgba(239, 68, 68, 0.1);
        border: 1px solid rgba(239, 68, 68, 0.2);
        color: #ef4444;
        padding: 10px 18px;
        border-radius: 10px;
        cursor: pointer;
        font-size: 13px;
        font-weight: 700;
        transition: 0.2s;
    }

    .withdraw-btn:hover {
        background: #ef4444;
        color: white;
        box-shadow: 0 4px 15px rgba(239, 68, 68, 0.2);
        transform: translateY(-1px);
    }

    /* SYSTEM NOTIFICATIONS CONTROLS */
    .success-alert {
        background: rgba(34, 197, 94, 0.15);
        border: 1px solid rgba(34, 197, 94, 0.3);
        color: #15803d;
        [data-theme="dark"] & { color: #4ade80; }
        padding: 14px 20px;
        border-radius: 14px;
        font-weight: 600;
        font-size: 14px;
        text-align: center;
        margin-bottom: 10px;
    }
</style>
</head>
<body>

    <div class="abstract-orb orb-1"></div>
    <div class="abstract-orb orb-2"></div>

    <!-- INTEGRATED HEADER SECTION -->
    <header>
        <div class="header-container">
            <a href="user-dashboard.jsp" class="logo">CareerSync</a>
            
            <div class="nav-links-container">
                <a href="user-dashboard.jsp" class="nav-link">Dashboard</a>
                <a href="viewjob" class="nav-link">Explore Jobs</a>
                <a href="#" class="nav-link active">Track Applications</a>
            </div>
            
            <div class="nav-right-actions">
                <label class="theme-switch" title="Toggle Theme">
                    <input type="checkbox" id="themeToggle" onclick="toggleTheme()">
                    <span class="slider"></span>
                </label>
                <a href="logout" class="logout-btn">Log out</a>
            </div>
        </div>
    </header>

    <!-- CORE INTERFACE WRAPPER -->
    <div class="tracker-container">
        
        <div class="page-title-block">
            <h1>Application Pipeline</h1>
            <p>Monitor your submission history, tracking updates and recruitment phases.</p>
        </div>

        <!-- Success Notification Bar -->
        <c:if test="${param.msg=='withdrawn'}">
            <div class="success-alert">
                ✓ Application parameters withdrawn successfully from data registries.
            </div>
        </c:if>

        <c:forEach var="a" items="${applications}">
            <div class="job-card">
                
                <div class="job-card-details">
                    <h2>${a.job.title}</h2>
                    <p>${a.job.description}</p>
                    
                    <div class="meta-tags-row">
                        <span class="meta-tag">📍 ${a.job.location}</span>
                        <span class="meta-tag">₹ ${a.job.salary}</span>
                        <span class="meta-tag">OJPMS Network</span>
                    </div>
                </div>

                <div class="action-control-panel">
                    <!-- Status Badge Matrix Evaluation -->
                    <c:choose>
                        <c:when test="${a.status=='ACCEPTED'}">
                            <div class="pipeline-status status-accepted">🟢 Accepted</div>
                        </c:when>
                        <c:when test="${a.status=='REJECTED'}">
                            <div class="pipeline-status status-rejected">🔴 Rejected</div>
                        </c:when>
                        <c:otherwise>
                            <div class="pipeline-status status-applied">🟡 Pending Review</div>
                        </c:otherwise>
                    </c:choose>

                    <!-- Safe Conditional Action Interface Injection -->
                    <c:if test="${a.status == 'APPLIED'}">
                        <form action="withdrawapplication" method="POST" onsubmit="return confirm('Withdraw this entry parameters?')">
                            <input type="hidden" name="applicationId" value="${a.id}">
                            <button type="submit" class="withdraw-btn">Withdraw Application</button>
                        </form>
                    </c:if>
                </div>

            </div>
        </c:forEach>
    </div>

    <!-- System UI Architecture Scripting -->
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