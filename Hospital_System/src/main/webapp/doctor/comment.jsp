<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
/* Background Image Overlay */
.backImg {
    background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                url("../img/hospital.jpg");
    height: 20vh;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Card Styling */
.paint-card {
    background: linear-gradient(135deg, #ffffff, #f9f9f9); /* Soft gradient */
    border-radius: 12px;
    padding: 20px;
    transition: all 0.3s ease-in-out;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2); /* Soft shadow */
}

/* Form Styling */
.form-control {
    border-radius: 8px;
    border: 1px solid #0077b6;
    transition: all 0.3s ease-in-out;
}

.form-control:focus {
    border-color: #00b4d8;
    box-shadow: 0 0 8px rgba(0, 180, 216, 0.5);
}

/* Textarea Styling */
textarea {
    border-radius: 8px;
    border: 1px solid #0077b6;
    transition: all 0.3s ease-in-out;
}

textarea:focus {
    border-color: #00b4d8;
    box-shadow: 0 0 8px rgba(0, 180, 216, 0.5);
}

/* Buttons */
.btn {
    border-radius: 8px;
    font-weight: bold;
    transition: 0.3s ease-in-out;
}

.btn-primary {
    background: linear-gradient(135deg, #0077b6, #00b4d8);
    border: none;
}

.btn-primary:hover {
    background: linear-gradient(135deg, #00b4d8, #0077b6);
    transform: scale(1.05);
}

/* Card Hover Effect */
.paint-card:hover {
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.25);
    transform: translateY(-3px);
}

/* Animated Heading */
.fs-4 {
    font-weight: bold;
    position: relative;
    display: inline-block;
}

.fs-4::after {
    content: "";
    display: block;
    width: 100%;
    height: 3px;
    background: linear-gradient(90deg, #0077b6, #00b4d8);
    transition: all 0.3s ease-in-out;
    margin-top: 5px;
}

.fs-4:hover::after {
    width: 120%;
}

/* Responsive Fixes */
@media screen and (max-width: 768px) {
    .paint-card {
        padding: 15px;
    }

    .fs-4 {
        font-size: 1.5rem;
    }

    .btn {
        font-size: 0.9rem;
        padding: 8px 12px;
    }
}

</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());

						Appointment ap = dao.getAppointmentById(id);
						%>
						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly
									value="<%=ap.getFullName()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Age</label> <input type="text" value="<%=ap.getAge()%>"
									readonly class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Mob No</label> <input type="text" readonly
									value="<%=ap.getPhNo()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Diseases</label> <input type="text" readonly
									value="<%=ap.getDiseases()%>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comm" class="form-control" row="3"
									cols=""></textarea>
							</div>
							<input type="hidden" name="id" value="<%=ap.getId()%>">
							 
							 <input type="hidden" name="did" value="<%=ap.getDoctorId()%>">

							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br> <br>
	
<%@include file="../component/footer.jsp" %>

</body>
</html>