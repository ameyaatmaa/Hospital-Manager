<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page isELIgnored="false"%>    
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDAO"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Doctor"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment Form</title>
<%@include file="component/allcss.jsp" %>

<style>
.point-card {
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    background: #fff;
    padding: 20px;
}

.point-card h3 {
    font-weight: bold;
    color: #007bff;
    text-align: center;
    margin-bottom: 20px;
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-end">
        <div class="col-md-6">
            <div class="card point-card">
                <h3>Book an Appointment</h3>
                
                  <c:if test="${not empty errorMsg}">
                        <p class="text-centre text-danger fs-3">${errorMsg}</p>
                       <c:remove var="errorMsg" scope="session"/>
                        </c:if>
                        
                         <c:if test="${not empty succMsg}">
                        <p class="text-centre text-success fs-3">${succMsg}</p>
                       <c:remove var="succMsg" scope="session"/>
                        </c:if>
                
                
                <form action="addAppointment" method="post">
                   <input type="hidden" name="userid" value="${userObj.id }">
                   
                    <div class="row mb-3">
                        <label class="col-md-4 col-form-label">Full Name</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="fullName" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-4 col-form-label">Gender</label>
                        <div class="col-md-8">
                            <select class="form-select" name="gender" required>
                                <option value="">Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-4 col-form-label">Age</label>
                        <div class="col-md-8">
                            <input type="number" class="form-control" name="age" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-4 col-form-label">Appointment Date</label>
                        <div class="col-md-8">
                            <input type="date" class="form-control" name="appointmentDate" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-4 col-form-label">Email</label>
                        <div class="col-md-8">
                            <input type="email" class="form-control" name="email" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-4 col-form-label">Phone No</label>
                        <div class="col-md-8">
                            <input type="tel" class="form-control" name="phoneNo" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-4 col-form-label">Diseases</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="diseases">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-4 col-form-label">Select Doctor</label>
                        <div class="col-md-8">
                            <select class="form-select" name="doctor" required>
                        <option value="">--select--</option>
                        
                        <%  DoctorDAO dao= new DoctorDAO(DBConnect.getConn());
						 List<Doctor> list=	dao.getAllDoctor();
                        for(Doctor d:list)
                        {%>
                        
                        <option value="<%= d.getId() %>"><%= d.getFullName() %> (<%= d.getSpecialist() %>)</option>

                        
                        	
                       <% }
                        
                        
                        
                        
                        
                        %>
                        
                        
                        
                            </select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Full Address</label>
                        <textarea class="form-control" name="address" rows="3" required></textarea>
                    </div>
                    
                    <c:if test="${empty userObj }">
                    <a href="user_login.jsp" class="btn btn-primary w-100">Book Appointment</a>
                    
                    </c:if>
                    
                     <c:if test="${ not empty userObj }">
                    
                      <button type="submit" class="btn btn-primary w-100">Book Appointment</button>
                    </c:if>
                    
                    

                  
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
