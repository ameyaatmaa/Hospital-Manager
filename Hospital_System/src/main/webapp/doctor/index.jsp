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

<style type="text/css">
.point-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.5);
       
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

<div class="container mt-5">
    <div class="row row-cols-1 row-cols-md-4 g-4 text-center">

        <!-- Doctor Card -->
        <div class="col">
            <div class="card shadow-sm border-0 p-4 text-center h-100">
                <div class="card-body">
                    <i class="fas fa-user-md fa-3x text-primary"></i>
                    <p class="fs-5 fw-bold mt-3">Doctor <br> <%=dao.countDoctor() %></p>
                </div>
            </div>
        </div>

       

        <!-- Appointments Card -->
        <div class="col">
            <div class="card shadow-sm border-0 p-4 text-center h-100">
                <div class="card-body">
                    <i class="fas fa-calendar-check fa-3x text-danger"></i>
                    <p class="fs-5 fw-bold mt-3">Appointments <br> <%= dao.countAppointmentByDoctorId(d.getId()) %> </p>
                </div>
            </div>
        </div>

        <!-- Reports Card -->
        <div class="col">
            <div class="card shadow-sm border-0 p-4 text-center h-100">
                <div class="card-body">
                    <i class="fas fa-file-medical fa-3x text-warning"></i>
                    <p class="fs-5 fw-bold mt-3">Reports</p>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
