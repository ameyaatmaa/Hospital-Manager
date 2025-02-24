<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page isELIgnored="false"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>

<%@include file="component/allcss.jsp" %>

<style>
    /* Light Background */
    body {
        background: #f8f9fa; /* Soft light gray */
        font-family: 'Poppins', sans-serif;
    }

    /* Centering the Login Card */
    .login-container {
        min-height: 80vh; /* Keeps proper spacing with navbar & footer */
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Card Styling */
    .card {
        background: linear-gradient(135deg, #ffffff, #e3f2fd); /* Light pastel blue */
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        padding: 30px;
        width: 100%;
        max-width: 420px;
        transition: all 0.3s ease-in-out;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    }

    /* Title */
    .card-title {
        font-size: 24px;
        font-weight: 600;
        color: #333;
        text-transform: uppercase;
        margin-bottom: 15px;
        text-align: center;
    }

    /* Form Fields */
    .form-group {
        text-align: left;
        margin-bottom: 15px;
    }

    .form-label {
        font-weight: 500;
        color: #333;
        margin-bottom: 5px;
        display: block;
    }

    .form-control {
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 10px;
        font-size: 16px;
        width: 100%;
        transition: all 0.3s ease-in-out;
    }

    .form-control:focus {
        border-color: #64b5f6; /* Light blue focus */
        box-shadow: 0 0 8px rgba(100, 181, 246, 0.3);
    }

    /* Login Button */
    .btn-login {
        background: #64b5f6; /* Light blue */
        color: white;
        border: none;
        padding: 12px;
        font-size: 18px;
        font-weight: bold;
        border-radius: 8px;
        width: 100%;
        transition: all 0.3s ease-in-out;
    }

    .btn-login:hover {
        background: #42a5f5;
        box-shadow: 0 4px 10px rgba(100, 181, 246, 0.3);
    }

    /* Messages */
    .message {
        font-size: 16px;
        font-weight: bold;
        padding: 10px;
        border-radius: 8px;
        text-align: center;
    }

    .text-success {
        background-color: rgba(72, 202, 228, 0.2);
        color: #0077b6;
    }

    .text-danger {
        background-color: rgba(255, 0, 0, 0.2);
        color: #b30000;
    }

    /* Sign-up Link */
    .signup-link {
        display: block;
        text-align: center;
        margin-top: 10px;
        font-size: 14px;
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s ease-in-out;
    }

    .signup-link:hover {
        color: #0056b3;
        text-decoration: underline;
    }
</style>

</head>
<body>

<%@include file="component/navbar.jsp" %>

<!-- Login Form Wrapper -->
<div class="container login-container">
    <div class="card">
        <p class="card-title">User Login</p>

        <!-- Success Message -->
        <c:if test="${not empty succMsg}">
            <p class="message text-success">${succMsg}</p>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty errorMsg}">
            <p class="message text-danger">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session"/>
        </c:if>

        <form action="userLogin" method="post">
            <div class="form-group">
                <label class="form-label">Email Address</label>
                <input required name="email" type="email" class="form-control">
            </div>
            <div class="form-group">
                <label class="form-label">Password</label>
                <input required name="password" type="password" class="form-control">
            </div>
            <button type="submit" class="btn btn-login">Login</button>
        </form>

        <!-- Sign-up Link -->
        <a href="signup.jsp" class="signup-link">Don't have an account? Create one</a>
    </div>
</div>

<%@include file="component/footer.jsp" %>

</body>
</html>
