<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Posted Jobs | OJPMS</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    /* COMPREHENSIVE UI DESIGN VARIABLE PLATFORM */
    :root {
        --bg-gradient: linear-gradient(135deg, #e0f2fe 0%, #dcfce7 100%);
        --text-main: #1e293b;
        --text-muted: #475569;
        --surface: #ffffff;
        --glass-bg: rgba(255, 255, 255, 0.45);
        --glass-border: rgba(255, 255, 255, 0.7);
        --primary: #a3e635; /* Neon Lime Green */
        --primary-hover: #84cc16;
        --shadow-color: rgba(0, 0, 0, 0.04);
        --orb-color: linear-gradient(135deg, #93c5fd, #a7f3d0);
        --card-bg: rgba(255, 255, 255, 0.55);
        --header-bg: rgba(255, 255, 255, 0.6);
        --header-border: rgba(255, 255, 255, 0.5);
        --nav-active-bg: rgba(255, 255, 255, 0.8);
        --tag-bg: rgba(255, 255, 255, 0.5);
        --tray-bg: rgba(255, 255, 255, 0.4);
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
        --tag-bg: rgba(15, 23, 42, 0.3);
        --tray-bg: rgba(15, 23, 42, 0.25);
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

    /* GLASSMorphic FIXED BACKGROUND ORBS */
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

    /* HOMEPAGE-STYLE INTEGRATED HEADER NAVIGATION */
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

    /* THEME SWITCH SLIDER */
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

    /* CORE MANAGEMENT PANEL LAYOUT */
    .workspace-container {
        max-width: 1400px;
        width: 95%;
        margin: 40px auto;
        display: flex;
        flex-direction: column;
        gap: 30px;
        padding: 0 20px;
    }

    .workspace-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
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

    .total-counter-badge {
        background: var(--glass-bg);
        border: 1px solid var(--glass-border);
        padding: 8px 18px;
        border-radius: 12px;
        font-size: 13px;
        font-weight: 700;
        box-shadow: 0 4px 15px var(--shadow-color);
    }
    .total-counter-badge span { color: #2563eb; [data-theme="dark"] & { color: var(--primary); } }

    /* GRID LAYOUT GRID BOARD DESIGN */
    .jobs-grid-layout {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 25px;
        width: 100%;
    }

    @media (max-width: 1200px) {
        .jobs-grid-layout { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    }
    @media (max-width: 768px) {
        .jobs-grid-layout { grid-template-columns: 1fr; }
    }

    /* PREMIUM GRID CARD PLATFORM */
    .job-bento-card {
        background: var(--card-bg);
        border: 1px solid var(--glass-border);
        border-radius: 24px;
        box-shadow: 0 12px 30px var(--shadow-color);
        transition: 0.35s cubic-bezier(0.4, 0, 0.2, 1);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        min-height: 340px;
        overflow: hidden; /* Houses the tray perfectly */
    }
    .job-bento-card:hover {
        transform: translateY(-6px);
        border-color: var(--primary);
        box-shadow: 0 20px 45px var(--shadow-color);
    }

    /* CARD CORE INTERIOR CONTENTS */
    .card-body-segment {
        padding: 25px 25px 15px 25px;
        flex: 1;
    }

    .card-top-block {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 18px;
    }

    .work-icon-avatar {
        width: 42px;
        height: 42px;
        border-radius: 12px;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 18px;
        box-shadow: 0 4px 10px var(--shadow-color);
    }

    .live-indicator {
        font-size: 11px;
        font-weight: 700;
        text-transform: uppercase;
        color: #16a34a;
        [data-theme="dark"] & { color: #4ade80; }
        background: rgba(22, 163, 74, 0.12);
        padding: 4px 12px;
        border-radius: 8px;
        letter-spacing: 0.5px;
        display: inline-flex;
        align-items: center;
        gap: 5px;
    }

    .job-bento-card h2 {
        font-size: 20px;
        font-weight: 700;
        color: var(--text-main);
        letter-spacing: -0.5px;
        margin-bottom: 6px;
    }

    .job-bento-card p {
        font-size: 13px;
        color: var(--text-muted);
        line-height: 1.6;
        margin-bottom: 20px;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .meta-tags-container {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
    }

    .meta-tag {
        font-size: 11px;
        font-weight: 600;
        color: var(--text-muted);
        background: var(--tag-bg);
        border: 1px solid var(--glass-border);
        padding: 4px 10px;
        border-radius: 6px;
    }
    
    /* FIX: Correct Rupee Symbol Setup with Glowing Green Boundaries */
    .meta-tag.salary-highlight {
        color: #16a34a;
        [data-theme="dark"] & { color: #4ade80; }
        background: rgba(22, 163, 74, 0.05);
    }

    /* PREMIUM UNIFIED BUTTON CONTROL TRAY */
    .controls-hub-segment {
        display: flex;
        gap: 8px;
        background: var(--tray-bg);
        border-top: 1px solid var(--glass-border);
        padding: 18px 25px 22px 25px;
    }

    .action-btn {
        border: none;
        padding: 10px 12px;
        font-size: 12px;
        font-weight: 700;
        border-radius: 10px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 4px;
        transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        text-decoration: none;
    }

    .btn-applicants {
        flex: 1.4;
        background: var(--primary);
        color: #1e293b;
        box-shadow: 0 4px 12px rgba(163, 230, 53, 0.25);
    }
    .btn-applicants:hover {
        background: var(--primary-hover);
        transform: translateY(-1px);
        box-shadow: 0 6px 15px rgba(163, 230, 53, 0.35);
    }

    .btn-edit {
        flex: 1;
        background: var(--surface);
        border: 1px solid var(--glass-border);
        color: var(--text-main);
    }
    .btn-edit:hover {
        background: var(--surface);
        border-color: var(--text-main);
        transform: translateY(-1px);
    }

    .btn-delete {
        flex: 1;
        background: rgba(239, 68, 68, 0.08);
        border: 1px solid rgba(239, 68, 68, 0.15);
        color: #ef4444;
    }
    .btn-delete:hover {
        background: #ef4444;
        color: white;
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(239, 68, 68, 0.2);
    }

    .empty-state-banner {
        grid-column: 1 / -1;
        text-align: center;
        padding: 75px 20px;
        color: var(--text-muted);
        background: var(--glass-bg);
        border: 1px solid var(--glass-border);
        border-radius: 22px;
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
                <a href="post-job.jsp" class="nav-link">Post a Job</a>
                <a href="myjobs" class="nav-link active">Manage Postings</a>
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

    <!-- CONTAINER SPACE BOARD -->
    <div class="workspace-container">
        
        <div class="workspace-header">
            <div>
                <h1>Position Management</h1>
                <p>Review active corporate listings, update constraints, and process incoming candidates.</p>
            </div>
            <div class="total-counter-badge">
                Active Listings: <span>${jobs.size()}</span>
            </div>
        </div>

        <!-- CORE BENTO STYLE GRID CONTAINER -->
        <div class="jobs-grid-layout">
            <c:if test="${empty jobs}">
                <div class="empty-state-banner">
                    <h2 style="font-size: 22px; font-weight: 700; margin-bottom: 5px;">No Positions Published Yet</h2>
                    <p style="font-size: 13px;">Create a new posting configuration inside the portal to initialize recruitment.</p>
                </div>
            </c:if>

            <c:forEach var="j" items="${jobs}">
                <div class="job-bento-card">
                    
                    <!-- Content Interior Card Shell -->
                    <div class="card-body-segment">
                        <div class="card-top-block">
                            <div class="work-icon-avatar">💼</div>
                            <span class="live-indicator">● Live</span>
                        </div>

                        <h2>${j.title}</h2>
                        <p>${j.description}</p>
                        
                        <div class="meta-tags-container">
                            <span class="meta-tag">📍 ${j.location}</span>
                            <span class="meta-tag salary-highlight">₹ ${j.salary}</span>
                        </div>
                    </div>

                    <!-- BOTTOM INTEGRATED TRANSLUCENT ACTION HUB TRAY -->
                    <div class="controls-hub-segment">
                        <form action="viewapplicants" method="GET">
                            <input type="hidden" name="jobId" value="${j.id}">
                            <button type="submit" class="action-btn btn-applicants">👥 Candidates</button>
                        </form>

                        <form action="editjob" method="GET">
                            <input type="hidden" name="jobId" value="${j.id}">
                            <button type="submit" class="action-btn btn-edit">✏️ Edit</button>
                        </form>

                        <form action="deletejob" method="POST" onsubmit="return confirm('Permanently remove this job parameters?')">
                            <input type="hidden" name="jobId" value="${j.id}">
                            <button type="submit" class="action-btn btn-delete">🗑️ Delete</button>
                        </form>
                    </div>

                </div>
            </c:forEach>
        </div>

    </div>

    <!-- Theme Automation Switch Engine -->
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