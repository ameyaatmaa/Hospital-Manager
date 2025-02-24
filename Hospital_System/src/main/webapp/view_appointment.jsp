<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Appointment List</title>
<%@include file="component/allcss.jsp"%>

<style>


/* Card Styling */
.paint-card {
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    border-radius: 12px;
    background: #f0f9ff; /* Light Soothing Blue */
    padding: 20px;
}

/* Table Styling */
.table {
    border-radius: 12px;
    overflow: hidden;
}

.table th {
    background-color: #72bcd4;
    color: white;
    text-align: center;
}

.table td, .table th {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* Button Styling */
.btn-warning {
    background-color: #f7c948 !important; /* Soft Yellow */
    border: none;
    padding: 6px 12px;
    font-weight: bold;
    border-radius: 6px;
    transition: 0.3s;
    color: black;
}

.btn-warning:hover {
    background-color: #f0b429 !important;
    transform: scale(1.05);
}

.btn-success {
    background-color: #5fa8d3 !important; /* Soothing Blue */
    border-radius: 6px;
}

/* Right Side Image */
.side-image {
    width: 100%;
    border-radius: 12px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
}

/* Responsive */
@media (max-width: 992px) {
    .backImg {
        height: 15vh;
    }
}
</style>
</head>

<body>

<c:if test="${empty userObj}">
    <c:redirect url="user_login.jsp"></c:redirect>
</c:if>

<%@include file="component/navbar.jsp"%>

<!-- Background Image -->
<div class="container-fluid backImg p-5"></div>

<!-- Main Content -->
<div class="container p-3">
    <div class="row">
        
        <!-- Left Side - Appointment List -->
        <div class="col-md-9">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-4 fw-bold text-center text-primary">Appointment List</p>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Appoint Date</th>
                                <th>Diseases</th>
                                <th>Doctor Name</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            User user = (User) session.getAttribute("userObj");
                            AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                            DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
                            List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
                            for (Appointment ap : list) {
                                Doctor d = dao2.getDoctorById(ap.getDoctorId());
                            %>
                            <tr>
                                <td><%=ap.getFullName()%></td>
                                <td><%=ap.getGender()%></td>
                                <td><%=ap.getAge()%></td>
                                <td><%=ap.getAppoinDate()%></td>
                                <td><%=ap.getDiseases()%></td>
                                <td><%=d.getFullName()%></td>
                                <td>
                                    <%
                                    if ("Pending".equals(ap.getStatus())) {
                                    %> 
                                    <a href="#" class="btn btn-sm btn-warning">Pending</a> 
                                    <% 
                                    } else { 
                                    %> 
                                    <span class="btn btn-sm btn-success"><%=ap.getStatus()%></span> 
                                    <% 
                                    } 
                                    %>
                                </td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Right Side - Image -->
        <div class="col-md-3 p-3">
            <img src="img/sarah.jpg" alt="Doctor Image" class="side-image">
        </div>
    </div>
</div>

</body>
</html>
