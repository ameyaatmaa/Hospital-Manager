<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<meta charset="ISO-8859-1">
<title>Add Doctor</title>
<%@include file="../component/allcss.jsp"%>
<style>
/* General Styles */
/* General Styles */
body {
    background: linear-gradient(to right, #f7f9fc, #eef2f3);
    font-family: 'Poppins', sans-serif;
}

/* Card Styling */
.paint-card {
    background: #ffffff;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    border-radius: 12px;
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

.paint-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

/* Form Container */
.card-body p {
    font-weight: bold;
    color: #34495e;
}

/* Form Fields */
.form-control {
    border-radius: 8px;
    border: 1px solid #d1d9e6;
    background: #f8f9fa;
    transition: all 0.3s ease-in-out;
}

.form-control:focus {
    border-color: #4A90E2;
    box-shadow: 0 0 10px rgba(74, 144, 226, 0.3);
    background: white;
}

/* Labels */
.form-label {
    font-weight: 500;
    color: #2c3e50;
}

/* Dropdown Styling */
select.form-control {
    appearance: none;
    background: #ffffff url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18"><path fill="%234A90E2" d="M7 10l5 5 5-5H7z"/></svg>') no-repeat right 10px center;
    background-size: 18px;
}

/* Buttons */
.btn-primary {
    background-color: #4A90E2;
    border-color: #4A90E2;
    border-radius: 8px;
    padding: 12px;
    font-weight: 500;
    transition: all 0.3s ease-in-out;
}

.btn-primary:hover {
    background-color: #357ABD;
    border-color: #357ABD;
    transform: scale(1.05);
}

/* Doctor Details Table */
.table-container {
    max-height: 450px;
    overflow-y: auto;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.table {
    border-radius: 10px;
    overflow: hidden;
}

.table th {
    background-color: #4A90E2;
    color: white;
    padding: 15px;
}

.table td {
    background-color: white;
    color: #333;
    padding: 12px;
    font-size: 15px;
}

.table-hover tbody tr:hover {
    background-color: #E3F2FD;
    transition: all 0.3s ease-in-out;
}

/* Responsive Design */
@media (max-width: 768px) {
    .paint-card {
        margin-bottom: 20px;
    }

    .table-container {
        max-height: 300px;
    }
}

body {
    background: linear-gradient(to right, #f9f9f9, #eef2f3);
    font-family: 'Poppins', sans-serif;
}

/* Card Styling */
.paint-card {
    background: #ffffff;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

.paint-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
}

/* Form Styling */
.form-control {
    border-radius: 8px;
    border: 1px solid #ddd;
    transition: all 0.3s ease-in-out;
}

.form-control:focus {
    border-color: #4A90E2;
    box-shadow: 0 0 10px rgba(74, 144, 226, 0.3);
}

/* Buttons */
.btn-primary {
    background-color: #4A90E2;
    border-color: #4A90E2;
    border-radius: 8px;
    padding: 10px;
    font-weight: 500;
    transition: all 0.3s ease-in-out;
}

.btn-primary:hover {
    background-color: #357ABD;
    border-color: #357ABD;
    transform: scale(1.05);
}

.btn-danger {
    background-color: #E74C3C;
    border-color: #E74C3C;
    border-radius: 8px;
    transition: all 0.3s ease-in-out;
}

.btn-danger:hover {
    background-color: #C0392B;
    border-color: #C0392B;
    transform: scale(1.05);
}

/* Table Styling */
.table-container {
    max-height: 450px;
    overflow-y: auto;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.table {
    border-radius: 10px;
    overflow: hidden;
}

.table th {
    background-color: #4A90E2;
    color: white;
    padding: 15px;
}

.table td {
    background-color: white;
    color: #333;
    padding: 12px;
    font-size: 15px;
}

.table-hover tbody tr:hover {
    background-color: #E3F2FD;
    transition: all 0.3s ease-in-out;
}

/* Action Buttons */
.action-buttons a {
    margin: 5px;
    display: inline-block;
    transition: transform 0.3s ease-in-out;
}

.action-buttons a:hover {
    transform: scale(1.1);
}

/* Responsive Design */
@media (max-width: 768px) {
    .paint-card {
        margin-bottom: 20px;
    }

    .table-container {
        max-height: 300px;
    }
}

</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<!-- Add Doctor Form -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Add Doctor</p>
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
	
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> 
								<input type="text" required name="fullName" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> 
								<input type="date" required name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> 
								<input required name="qualification" type="text" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Specialist</label> 
								<select name="spec" required class="form-control">
									<option>--select--</option>
									<%
									SpecialistDAO dao = new SpecialistDAO(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> 
								<input type="email" required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No</label> 
								<input type="text" required name="mobNo" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> 
								<input required name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary w-100">Add Doctor</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Doctor Details Panel -->
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Details</p>
						<div class="table-container">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th scope="col">Name</th>
										<th scope="col">DOB</th>
										<th scope="col">Qualification</th>
										<th scope="col">Specialist</th>
										<th scope="col">Email</th>
										<th scope="col">Mobile No</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									
									<%
									DoctorDAO dao2= new DoctorDAO(DBConnect.getConn());
									 List<Doctor> duki = dao2.getAllDoctor();
									for(Doctor d: duki)
									{%>
									<tr>
									<td><%=d.getFullName()%></td>
										<td><%=d.getDob()%></td>
										<td><%=d.getQualification()%></td>
										<td><%=d.getSpecialist()%></td>
										<td><%=d.getEmail()%></td>
										<td><%=d.getMobNo()%></td>
										<td>
										
										<a href="edit_doctor.jsp?id=<%=d.getId()  %>" class="btn btn-sm btn-primary">Edit</a>
										<a href="../deleteDoctor?id=<%= d.getId() %>" class="btn btn-sm btn-danger">Delete</a>

										</td>
									
									
									
									
									</tr>
									
										
									
									
									<%}
									
									%>
									
								</tbody>
							</table>
						</div> <!-- End of table-container -->
					</div>
				</div>
			</div> <!-- End of Doctor Details Panel -->

		</div>
	</div>
</body>
</html>
