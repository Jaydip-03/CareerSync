<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Applicants</h1>

<c:forEach var="a"
           items="${applications}">

    <div
    style="border:1px solid black;
           padding:10px;
           margin:10px;">

        <h3>${a.user.name}</h3>

        <p>Email :
           ${a.user.email}</p>

        <p>Status :
           ${a.status}</p>

    </div>
    
    <form action="updateapplicationstatus">
    <input type="hidden"
           name="applicationId"
           value="${a.id}">
           
           <input type="hidden"
           name="jobId"
           value="${a.job.id}">

    <input type="hidden"
           name="status"
           value="ACCEPTED">

    <button>
        ✅ Accept
    </button>
</form>

<form action="updateapplicationstatus">
    <input type="hidden"
           name="applicationId"
           value="${a.id}">
           
            <input type="hidden"
           name="jobId"
           value="${a.job.id}">

    <input type="hidden"
           name="status"
           value="REJECTED">

    <button>
        ❌ Reject
    </button>
</form>

</c:forEach>

</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Job Applicants | OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    /* SAAS RECRUITMENT UI PALETTE */
    :root {
        --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
        --text-main: #1e293b;
        --text-muted: #475569;
        --surface: #ffffff;
        --glass-bg: rgba(255, 255, 255, 0.45);
        --glass-border: rgba(255, 255, 255, 0.7);
        --primary: #a3e635; /* Neon Lime */
        --primary-hover: #84cc16;
        --shadow-color: rgba(0, 0, 0, 0.04);
        --orb-color: linear-gradient(135deg, #93c5fd, #a7f3d0);
        --card-bg: rgba(255, 255, 255, 0.55);
        --header-bg: rgba(255, 255, 255, 0.6);
        --header-border: rgba(255, 255, 255, 0.5);
        --nav-active-bg: rgba(255, 255, 255, 0.8);
        --tag-bg: rgba(255, 255, 255, 0.5);
        --tray-bg: rgba(255, 255, 255, 0.35);
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
        --card-bg: rgba(15, 23, 42, 0.45);
        --header-bg: rgba(15, 23, 42, 0.4);
        --header-border: rgba(255, 255, 255, 0.03);
        --nav-active-bg: rgba(255, 255, 255, 0.07);
        --tag-bg: rgba(15, 23, 42, 0.25);
        --tray-bg: rgba(15, 23, 42, 0.2);
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

    /* GRADIENT ANIMATING FLOATING BACKGROUNDS */
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
        50% { transform: scale(1.1) translate(20px, 20px); }
        100% { transform: scale(1) translate(0, 0); }
    }

    /* FULL SCREEN HEADER COMPONENT STYLE */
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

    /* THEME SLIDER TOGGLER */
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
    .logout-btn:hover { background: #ef4444; color: white !important; }

    /* CORE GRID CANVAS INTERFACE SPACE */
    .workspace-container {
        max-width: 1400px;
        width: 95%;
        margin: 40px auto;
        display: flex;
        flex-direction: column;
        gap: 30px;
        padding: 0 20px;
    }

    .workspace-header h1 {
        font-size: 32px;
        font-weight: 800;
        letter-spacing: -1px;
    }
    .workspace-header p {
        font-size: 14px;
        color: var(--text-muted);
    }

    /* 2-COLUMN PREMIUM WORKSPACE GRID */
    .applicants-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 25px;
        width: 100%;
    }

    @media (max-width: 992px) {
        .applicants-grid { grid-template-columns: 1fr; }
    }

    /* ELITE BENTO STYLE APP CARD FRAME */
    .applicant-card {
        background: var(--card-bg);
        border: 1px solid var(--glass-border);
        border-radius: 24px;
        box-shadow: 0 12px 30px var(--shadow-color);
        transition: 0.35s cubic-bezier(0.4, 0, 0.2, 1);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        min-height: 250px;
        overflow: hidden;
    }
    .applicant-card:hover {
        transform: translateY(-4px);
        border-color: var(--primary);
        box-shadow: 0 20px 40px var(--shadow-color);
    }

    .card-body-segment {
        padding: 30px;
        display: flex;
        gap: 24px;
        align-items: flex-start;
    }

    /* GLOW SQUIRCLE GRAPHICAL BADGES AVATAR */
    .avatar-squircle {
        width: 64px;
        height: 64px;
        border-radius: 18px;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 26px;
        box-shadow: 0 8px 16px var(--shadow-color);
        position: relative;
        flex-shrink: 0;
    }

    .applicant-details-meta {
        flex: 1;
    }

    .card-top-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 8px;
    }

    .applicant-details-meta h2 {
        font-size: 22px;
        font-weight: 700;
        color: var(--text-main);
        letter-spacing: -0.5px;
    }

    /* PIPELINE EVALUATION COLORED STATUS LABELS */
    .status-badge {
        font-size: 11px;
        font-weight: 700;
        text-transform: uppercase;
        padding: 4px 12px;
        border-radius: 8px;
        letter-spacing: 0.5px;
    }
    .status-badge.accepted { background: rgba(34, 197, 94, 0.15); color: #166534; [data-theme="dark"] & { color: #4ade80; } }
    .status-badge.rejected { background: rgba(239, 68, 68, 0.15); color: #991b1b; [data-theme="dark"] & { color: #fca5a5; } }
    .status-badge.applied { background: rgba(234, 179, 8, 0.15); color: #854d0e; [data-theme="dark"] & { color: #fde047; } }

    .applicant-email {
        font-size: 14px;
        color: var(--text-muted);
        font-weight: 500;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .info-pill-tray {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
    }

    .bento-pill {
        font-size: 12px;
        font-weight: 600;
        color: var(--text-muted);
        background: var(--tag-bg);
        border: 1px solid var(--glass-border);
        padding: 4px 12px;
        border-radius: 8px;
    }

    /* BOTTOM DESIGN PROFILE FORM CONTROL TRAY */
    .controls-hub-segment {
        display: flex;
        gap: 12px;
        background: var(--tray-bg);
        border-top: 1px solid var(--glass-border);
        padding: 18px 30px;
    }

    .controls-hub-segment form {
        flex: 1;
    }

    .action-btn {
        width: 100%;
        border: none;
        padding: 11px 16px;
        font-size: 13px;
        font-weight: 700;
        border-radius: 12px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 6px;
        transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .btn-accept {
        background: var(--primary);
        color: #1e293b;
        box-shadow: 0 4px 12px rgba(163, 230, 53, 0.2);
    }
    .btn-accept:hover {
        background: var(--primary-hover);
        transform: translateY(-1px);
        box-shadow: 0 6px 15px rgba(163, 230, 53, 0.3);
    }

    .btn-reject {
        background: rgba(239, 68, 68, 0.06);
        border: 1px solid rgba(239, 68, 68, 0.15);
        color: #ef4444;
    }
    .btn-reject:hover {
        background: #ef4444;
        color: white;
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(239, 68, 68, 0.2);
    }

    .empty-state-banner {
        grid-column: 1 / -1;
        text-align: center;
        padding: 80px 20px;
        color: var(--text-muted);
        background: var(--glass-bg);
        border: 1px solid var(--glass-border);
        border-radius: 24px;
    }
</style>
</head>
<body>

    <div class="abstract-orb orb-1"></div>
    <div class="abstract-orb orb-2"></div>

    <!-- MAIN APP STATIC LOGICAL HEADER -->
    <header>
        <div class="header-container">
            <a href="recruiter-dashboard.jsp" class="logo">CareerSync</a>
            
            <div class="nav-links-container">
                <a href="recruiter-dashboard.jsp" class="nav-link">Dashboard</a>
                <a href="myjobs" class="nav-link">Manage Postings</a>
                <a href="#" class="nav-link active">Applicants</a>
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

    <!-- CORE RECRUITER SPACE PANEL -->
    <div class="workspace-container">
        
        <div class="workspace-header">
            <h1>Candidate Submissions</h1>
            <p>Review incoming processing logs, evaluate structural profiles, and check active applicant pipelines.</p>
        </div>

        <!-- TWO COLUMN HIGH-DENSITY PROFILE MATRIX -->
        <div class="applicants-grid">
            <c:if test="${empty applications}">
                <div class="empty-state-banner">
                    <h2 style="font-size: 22px; font-weight: 700; margin-bottom: 5px;">No Applications Received Yet</h2>
                    <p style="font-size: 13px;">Incoming candidate data for this specific configuration will render inside this canvas profile zone.</p>
                </div>
            </c:if>

            <c:forEach var="a" items="${applications}">
                <div class="applicant-card">
                    
                    <div class="card-body-segment">
                        <div class="avatar-squircle">👨‍💻</div>
                        
                        <div class="applicant-details-meta">
                            <div class="card-top-row">
                                <h2>${a.user.name}</h2>
                                
                                <c:choose>
                                    <c:when test="${a.status == 'ACCEPTED'}">
                                        <span class="status-badge accepted">✓ Accepted</span>
                                    </c:when>
                                    <c:when test="${a.status == 'REJECTED'}">
                                        <span class="status-badge rejected">✕ Rejected</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-badge applied">● Pending</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            
                            <div class="applicant-email">✉ ${a.user.email}</div>
                            
                            <!-- Modern Bento Style tags to fill up empty space visually -->
                            <div class="info-pill-tray">
                                <span class="bento-pill">Role: Candidate</span>
                                <span class="bento-pill">Verified Profile</span>
                                <span class="bento-pill">OJPMS ID: #${a.id}</span>
                            </div>
                        </div>
                    </div>

                    <!-- RECRUITMENT PROCESSING CONTROLS PLATFORM TRAY -->
                    <div class="controls-hub-segment">
                        <form action="updateapplicationstatus" method="POST">
                            <input type="hidden" name="applicationId" value="${a.id}">
                            <input type="hidden" name="jobId" value="${a.job.id}">
                            <input type="hidden" name="status" value="ACCEPTED">
                            <button type="submit" class="action-btn btn-accept">✅ Accept Profile</button>
                        </form>

                        <form action="updateapplicationstatus" method="POST">
                            <input type="hidden" name="applicationId" value="${a.id}">
                            <input type="hidden" name="jobId" value="${a.job.id}">
                            <input type="hidden" name="status" value="REJECTED">
                            <button type="submit" class="action-btn btn-reject">❌ Reject Profile</button>
                        </form>
                    </div>

                </div>
            </c:forEach>
        </div>

    </div>

    <!-- UI Core Automation Engine -->
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
