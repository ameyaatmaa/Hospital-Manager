<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<%@include file="component/allcss.jsp"%>

<style>
/* Card Styling */
.paint-card {
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    border-radius: 12px;
    background: #f0f9ff; /* Light soothing blue */
    padding: 20px;
}

/* Input Fields */
.form-control {
    border-radius: 8px;
    padding: 10px;
    border: 1px solid #72bcd4;
    transition: 0.3s;
}

.form-control:focus {
    border-color: #5fa8d3;
    box-shadow: 0px 0px 8px rgba(95, 168, 211, 0.5);
}

/* Success & Error Messages */
.text-success, .text-danger {
    font-size: 16px;
    font-weight: bold;
}

/* Button Styling */
.btn-primary {
    background-color: #5fa8d3 !important; /* Theme blue */
    border-radius: 8px;
    padding: 10px;
    font-weight: bold;
    transition: 0.3s;
}

.btn-primary:hover {
    background-color: #4c9ac3 !important;
    transform: scale(1.05);
}
</style>
</head>

<body>

<%@include file="component/navbar.jsp"%>

<c:if test="${ empty userObj }">
    <c:redirect url="user_login.jsp"></c:redirect>
</c:if>

<div class="container p-4">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card paint-card">
                <p class="text-center fs-3 text-primary fw-bold">Change Password</p>

                <!-- Success Message -->
                <c:if test="${not empty succMsg }">
                    <p class="text-center text-success">${succMsg}</p>
                    <c:remove var="succMsg" scope="session" />
                </c:if>

                <!-- Error Message -->
                <c:if test="${not empty errorMsg }">
                    <p class="text-center text-danger">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session" />
                </c:if>

                <div class="card-body">
                    <form action="userChangePassword" method="post">
                        
                        <!-- Old Password -->
                        <div class="mb-3">
                            <label class="fw-bold">Enter Old Password</label>
                            <input type="password" name="oldPassword" class="form-control" required>
                        </div>

                        <!-- New Password -->
                        <div class="mb-3">
                            <label class="fw-bold">Enter New Password</label>
                            <input type="password" name="newPassword" class="form-control" required>
                        </div>

                        <input type="hidden" value="${userObj.id}" name="uid">
                        
                        <!-- Submit Button -->
                        <button class="btn btn-primary col-md-12">Change Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
