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
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
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
    transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
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
    transition: background 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
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
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<!-- Add Doctor Form -->
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Edit Doctor Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<% 
						int  id=Integer.parseInt(request.getParameter("id"));
						
						DoctorDAO dao2= new DoctorDAO(DBConnect.getConn());
						
						Doctor d =dao2.getDoctorById(id);
						
						
						%>
						
						
						
						
						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> 
								<input type="text" required name="fullName" class="form-control" value="<%=d.getFullName() %>" >
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> 
								<input type="date" required name="dob" class="form-control" value="<%=d.getDob() %>" >
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> 
								<input required name="qualification" type="text" class="form-control" value="<%=d.getQualification() %>" >
							</div>
							
							<div class="mb-3">
								<label class="form-label">Specialist</label> 
								<select name="spec" required class="form-control"  >
									<option><%=d.getSpecialist() %></option>
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
								<input type="email" required name="email" class="form-control"  value="<%=d.getEmail() %>">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No</label> 
								<input type="text" required name="mobNo" class="form-control"  value="<%=d.getMobNo() %>">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> 
								<input required name="password" type="password" class="form-control"  value="<%= d.getPassword() %>">
							</div>
							<input type="hidden" name="id" value="<%= d.getId() %>">
							

							<button type="submit" class="btn btn-primary w-100 col md-12">Update</button>
						</form>
					</div>
				</div>
			</div>

	

		</div>
	</div>
</body>
</html>
