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
		<form action="reset">
			Email : <input type="email" name="email" placeholder="Enter Existing email.."><br>
			Password : <input type="password" name="password" placeholder="Enter New Password"><br>
			<input type="submit" value="RESET PASSWORD">
		</form>
		
		<p style="color: red">${msg }</p> <br>
		<a href="register.jsp">Register</a>
		
</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password | OJPMS</title>

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
    width:450px;
    background:white;
    border-radius:24px;
    overflow:hidden;
    box-shadow:0 20px 50px rgba(0,0,0,.08);
}

/* TOP */

.top{
    height:120px;
    background:linear-gradient(
    135deg,
    #2563eb,
    #4f46e5);
}

.content{
    padding:35px;
}

.logo{
    width:90px;
    height:90px;

    margin:-65px auto 15px;

    background:white;

    border-radius:50%;

    display:flex;
    justify-content:center;
    align-items:center;

    font-size:30px;
    font-weight:700;

    color:#2563eb;

    border:5px solid white;
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
    margin-top:8px;
}

/* FORM */

.form-group{
    margin-bottom:20px;
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

/* BUTTON */

.btn{
    width:100%;

    border:none;

    padding:15px;

    border-radius:12px;

    background:#2563eb;

    color:white;

    font-size:15px;
    font-weight:600;

    cursor:pointer;

    transition:.3s;
}

.btn:hover{
    background:#1d4ed8;
    transform:translateY(-3px);
}

/* MESSAGE */

.msg{
    text-align:center;
    margin-top:18px;
    color:red;
    font-weight:500;
}

/* LINKS */

.links{
    margin-top:25px;
    text-align:center;
}

.links a{
    text-decoration:none;
    color:#2563eb;
    font-weight:600;
}

.links a:hover{
    text-decoration:underline;
}

</style>
</head>
<body>

<div class="card">

    <div class="top"></div>

    <div class="content">

        <div class="logo">
            CareerSync
        </div>

        <div class="heading">
            <h2>Reset Password</h2>
            <p>Enter your registered email and a new password</p>
        </div>

        <form action="reset">

            <div class="form-group">
                <label>Email Address</label>
                <input type="email"
                       name="email"
                       placeholder="Enter registered email"
                       required>
            </div>

            <div class="form-group">
                <label>New Password</label>
                <input type="password"
                       name="password"
                       placeholder="Enter new password"
                       required>
            </div>

            <button class="btn">
                Reset Password
            </button>

        </form>

        <p class="msg">${msg}</p>

        <div class="links">
            <a href="login.jsp">Back to Login</a>
            &nbsp; | &nbsp;
            <a href="register.jsp">Create Account</a>
        </div>

    </div>

</div>


<script src="js/theme.js"></script>

</body>
</html>