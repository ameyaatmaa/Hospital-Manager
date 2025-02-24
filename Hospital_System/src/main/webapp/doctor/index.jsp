<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page isELIgnored="false"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Doctor"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<%@include file="../component/allcss.jsp" %>

<style>
/* General Card Styling */
.point-card {
    background: rgba(255, 255, 255, 0.2); /* Light Transparent Background */
    backdrop-filter: blur(10px); /* Glassmorphism Effect */
    border: 2px solid rgba(255, 255, 255, 0.2); 
    border-radius: 15px;
    padding: 20px;
    transition: all 0.3s ease-in-out;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

/* Hover Effect */
.point-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.3);
}

/* Icons */
.card-body i {
    font-size: 3.5rem; /* Bigger Icons */
    transition: 0.3s ease-in-out;
}

/* Icon Colors */
.icon-doctor { color: #0077b6; } /* Blue */
.icon-appointments { color: #d00000; } /* Red */
.icon-reports { color: #ffba08; } /* Yellow */

/* Card Text */
.card-body p {
    font-size: 1.4rem;
    font-weight: bold;
    color: #ffffff;
}

/* Background Gradients */
.bg-doctor {
    background: linear-gradient(135deg, #0077b6, #48cae4); /* Blue Gradient */
}
.bg-appointments {
    background: linear-gradient(135deg, #d00000, #ff4d4d); /* Red Gradient */
}
.bg-reports {
    background: linear-gradient(135deg, #ffba08, #ffdd57); /* Yellow Gradient */
}
</style>


</head>
<body>

<c:if test="${ empty doctorObj }">
    <c:redirect url="../doctor_login.jsp" />
</c:if>

<%@include file="navbar.jsp" %>

<% 
DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
Doctor d = (Doctor) session.getAttribute("doctorObj"); 
%>

<!-- Updated Cards -->
<div class="container mt-5">
    <div class="row row-cols-1 row-cols-md-3 g-4 text-center">

        <!-- Doctor Card -->
        <div class="col">
            <div class="card point-card bg-doctor h-100">
                <div class="card-body">
                    <i class="fas fa-user-md icon-doctor"></i>
                    <p>Doctor <br> <%=dao.countDoctor() %></p>
                </div>
            </div>
        </div>

        <!-- Appointments Card -->
        <div class="col">
            <div class="card point-card bg-appointments h-100">
                <div class="card-body">
                    <i class="fas fa-calendar-check icon-appointments"></i>
                    <p>Appointments <br> <%= dao.countAppointmentByDoctorId(d.getId()) %></p>
                </div>
            </div>
        </div>

        <!-- Reports Card -->
        <div class="col">
            <div class="card point-card bg-reports h-100">
                <div class="card-body">
                    <i class="fas fa-file-medical icon-reports"></i>
                    <p>Reports</p>
                </div>
            </div>
        </div>

    </div>
</div>
<br>
<br>
<br>
<%@include file="../component/footer.jsp" %>
</body>
</html>
