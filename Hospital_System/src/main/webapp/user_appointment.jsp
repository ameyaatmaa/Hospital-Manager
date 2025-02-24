<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page isELIgnored="false"%>    
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDAO"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Doctor"%>    

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Book an Appointment</title>
<%@include file="component/allcss.jsp" %>

<style>
/* Main Container */
.appointment-container {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 85vh;
    gap: 40px;
}

/* Left Side - Image */
.appointment-image {
    width: 45%;
    max-height: 500px;
    object-fit: cover;
    border-radius: 12px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
}

/* Right Side - Appointment Form */
.appointment-card {
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    border-radius: 12px;
    background: #f0f9ff; /* Light Soothing Blue */
    padding: 30px;
    width: 50%;
    color: #333;
}

/* Form Title */
.appointment-card h3 {
    font-weight: bold;
    text-align: center;
    margin-bottom: 20px;
    font-size: 1.8rem;
    color: #0077b6;
}

/* Form Inputs */
.appointment-card .form-control, .appointment-card .form-select {
    border-radius: 8px;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #bde0fe; /* Light Blue Border */
}

/* Button Styling */
.appointment-card .btn-primary {
    background-color: #72bcd4; /* Soothing Pastel Blue */
    border: none;
    border-radius: 25px;
    padding: 10px;
    font-size: 1.1rem;
    transition: 0.3s;
    width: 100%;
    color: white;
}

.appointment-card .btn-primary:hover {
    background-color: #5fa8d3; /* Slightly Darker Blue */
    transform: scale(1.05);
}

/* Responsive */
@media (max-width: 992px) {
    .appointment-container {
        flex-direction: column;
        text-align: center;
    }
    .appointment-image {
        width: 90%;
    }
    .appointment-card {
        width: 90%;
    }
}
</style>
</head>
<body>

<%@include file="component/navbar.jsp" %> <br>

<div class="container appointment-container">
    
    <!-- Left Side - Image -->
    <img src="img/sinless.jpg" alt="Appointment Image" class="appointment-image">

    <!-- Right Side - Appointment Form -->
    <div class="appointment-card">
        <h3>Book an Appointment</h3>

        <!-- Success and Error Messages -->
        <c:if test="${not empty errorMsg}">
            <p class="text-center text-danger fs-5">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty succMsg}">
            <p class="text-center text-success fs-5">${succMsg}</p>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <!-- Appointment Form -->
        <form action="addAppointment" method="post">
            <input type="hidden" name="userid" value="${userObj.id}">

            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-control" name="fullName" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Gender</label>
                <select class="form-select" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Age</label>
                <input type="number" class="form-control" name="age" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Appointment Date</label>
                <input type="date" class="form-control" name="appointmentDate" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone No</label>
                <input type="tel" class="form-control" name="phoneNo" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Diseases</label>
                <input type="text" class="form-control" name="diseases">
            </div>

            <div class="mb-3">
                <label class="form-label">Select Doctor</label>
                <select class="form-select" name="doctor" required>
                    <option value="">-- Select --</option>
                    <% 
                        DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
                        List<Doctor> list = dao.getAllDoctor();
                        for (Doctor d : list) { 
                    %>
                        <option value="<%= d.getId() %>"><%= d.getFullName() %> (<%= d.getSpecialist() %>)</option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Full Address</label>
                <textarea class="form-control" name="address" rows="3" required></textarea>
            </div>

            <!-- Button Based on Login Status -->
            <c:if test="${empty userObj}">
                <a href="user_login.jsp" class="btn btn-primary">Book Appointment</a>
            </c:if>

            <c:if test="${not empty userObj}">
                <button type="submit" class="btn btn-primary">Book Appointment</button>
            </c:if>
        </form>
    </div>

</div>

<br>
<%@include file="component/footer.jsp" %>
</body>
</html>
