<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page isELIgnored="false"%>    
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="../component/allcss.jsp" %>
<style>
/* General Styling */
body {
    background: #f8f9fa; /* Light background */
    font-family: 'Poppins', sans-serif;
    color: #333;
}

/* Container Styling */
.container {
    max-width: 1100px;
}

/* Dashboard Heading */
p.text-center.fs-3 {
    font-weight: bold;
    color: #0077b6; /* Light blue color for title */
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* Success & Error Messages */
.text-centre.text-success {
    color: #28a745;
    font-weight: bold;
}

.text-centre.text-danger {
    color: #dc3545;
    font-weight: bold;
}

/* Point Cards */
.point-card {
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    height: 150px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
}

/* Hover Effect */
.point-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

/* Icons */
.point-card i {
    transition: transform 0.3s ease-in-out;
}

.point-card:hover i {
    transform: rotate(10deg) scale(1.1);
}

/* Card Text */
.point-card p {
    margin-top: 10px;
    font-size: 18px;
    font-weight: 600;
}

/* Colors for Icons */
.text-primary {
    color: #0077b6 !important;
}

.text-danger {
    color: #e63946 !important;
}

.text-warning {
    color: #ffb703 !important;
}

.text-info {
    color: #219ebc !important;
}

/* Modal Styling */
.modal-content {
    border-radius: 15px;
    background: #ffffff;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
}

.modal-header {
    background: #0077b6;
    color: white;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
}

.modal-footer {
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
}

/* Buttons */
.btn-primary {
    background: #0077b6;
    border: none;
    font-weight: bold;
    transition: background 0.3s ease-in-out, transform 0.2s;
}

.btn-primary:hover {
    background: #005f86;
    transform: scale(1.05);
}

.btn-secondary {
    background: #adb5bd;
    border: none;
    transition: background 0.3s ease-in-out, transform 0.2s;
}

.btn-secondary:hover {
    background: #868e96;
    transform: scale(1.05);
}

/* Form Input */
.form-control {
    border-radius: 8px;
    border: 1px solid #ced4da;
    transition: border 0.3s ease-in-out;
}

.form-control:focus {
    border-color: #0077b6;
    box-shadow: 0 0 8px rgba(0, 119, 182, 0.3);
}

}
</style>

<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body>

<%@include file="navbar.jsp" %>

 <c:if test="${ empty adminObj }">
      <c:redirect url="../admin_login.jsp"></c:redirect>
                        </c:if>

<div class="container p-5">
<p class="text-center fs-3" >Admin Dashboard</p>

 <c:if test="${not empty succMsg}">
                        <p class="text-centre text-success fs-3">${succMsg}</p>
                       <c:remove var="succMsg" scope="session"/>
                        </c:if>
                        
                         <c:if test="${not empty errorMsg}">
                        <p class="text-centre text-danger fs-3">${errorMsg}</p>
                       <c:remove var="errorMsg" scope="session"/>
                        </c:if>


<% DoctorDAO dao= new DoctorDAO(DBConnect.getConn()); %>


    <div class="row row-cols-1 row-cols-md-4 g-4">
        <!-- Users -->
        <div class="col">
            <div class="card point-card text-center p-4">
                <div class="card-body">
                    <i class="fas fa-user-plus fa-3x text-primary"></i> 
                    <p class="fs-5 mt-2">Doctor <br> <%=dao.countDoctor() %>  </p>
                </div>
            </div>
        </div>

        <!-- Total Appointments -->
        <div class="col">
            <div class="card point-card text-center p-4">
                <div class="card-body">
                    <i class="fas fa-calendar-check fa-3x text-danger"></i> 
                    <p class="fs-5 mt-2">Total Appointments<br> <%=dao.countAppointment() %>  </p>
                </div>
            </div>
        </div>

        <!-- Total Doctors -->
        <div class="col">
            <div class="card point-card text-center p-4">
                <div class="card-body">
                    <i class="fas fa-user-md fa-3x text-warning"></i> 
                    <p class="fs-5 mt-2">Users <br> <%=dao.countUser() %> </p>
                </div>
            </div>
        </div>

        <!-- Total Specialists -->
        <div class="col" data-bs-toggle="modal" data-bs-target="#exampleModal". >
            <div class="card point-card text-center p-4">
                <div class="card-body">
                    <i class="fas fa-stethoscope fa-3x text-info"></i> 
                    <p class="fs-5 mt-2">Specialists <br> <%=dao.countSpecialist() %> </p>
                </div>
            </div>
        </div>
    </div>
</div>






<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
        <form action="../addSpecialist" method="post">
       <div class="form-group"></div>
       <label>Enter Specialist Name</label>
       
       <input type="text" name="specName" class ="form-control">
       
       <div class="text-center mt-3">
       <button type="submit" class="btn btn-primary">Add</button>
       </div>
       
       </form>
      
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>

<!-- FontAwesome for Icons -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<%@include file="../component/footer.jsp" %>

</body>
</html>
