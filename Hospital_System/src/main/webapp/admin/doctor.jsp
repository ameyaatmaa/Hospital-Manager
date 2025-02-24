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
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	border-radius: 8px;
}

.table-container {
	max-height: 400px;
	overflow-y: auto;
}

.table th, .table td {
	vertical-align: middle;
	text-align: center;
}

.table th {
	background-color: #343a40;
	color: white;
}

.action-buttons a {
	margin: 2px;
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
