<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDAO"%>
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
/* Card Styling */
.paint-card {
    background: linear-gradient(135deg, #f9f9f9, #ffffff); 
    border-radius: 12px;
    padding: 20px;
    transition: all 0.3s ease-in-out;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2); 
}


.form-control {
    border-radius: 8px;
    border: 1px solid #0077b6;
    transition: all 0.3s ease-in-out;
}

.form-control:focus {
    border-color: #00b4d8;
    box-shadow: 0 0 8px rgba(0, 180, 216, 0.5);
}

/* Buttons */
.btn {
    border-radius: 8px;
    font-weight: bold;
    transition: 0.3s ease-in-out;
}

.btn-success {
    background: linear-gradient(135deg, #00b894, #0984e3);
    border: none;
}

.btn-success:hover {
    background: linear-gradient(135deg, #0984e3, #00b894);
    transform: scale(1.05);
}

.btn-primary {
    background: linear-gradient(135deg, #0077b6, #00b4d8);
    border: none;
}

.btn-primary:hover {
    background: linear-gradient(135deg, #00b4d8, #0077b6);
    transform: scale(1.05);
}

/* Animation: Subtle Glow on Hover */
.paint-card:hover {
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.25);
    transform: translateY(-3px);
}

/* Animated Headings */
.fs-3 {
    font-weight: bold;
    position: relative;
    display: inline-block;
}

.fs-3::after {
    content: "";
    display: block;
    width: 100%;
    height: 3px;
    background: linear-gradient(90deg, #0077b6, #00b4d8);
    transition: all 0.3s ease-in-out;
    margin-top: 5px;
}

.fs-3:hover::after {
    width: 120%;
}

/* Responsive Fixes */
@media screen and (max-width: 768px) {
    .paint-card {
        padding: 15px;
    }

    .fs-3 {
        font-size: 1.5rem;
    }

    .btn {
        font-size: 0.9rem;
        padding: 8px 12px;
    }
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

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctorChangePassword" method="post">
						
							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
						
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

						
							<input type="hidden" value="${doctorObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3">Edit Profile</p>
					<c:if test="${not empty succMsgd }">
						<p class="text-center text-success fs-3">${succMsgd}</p>
						<c:remove var="succMsgd" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgd }">
						<p class="text-center text-danger fs-5">${errorMsgd}</p>
						<c:remove var="errorMsgd" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="${doctorObj.fullName }">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control"
									value="${doctorObj.dob }">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control"
									value="${doctorObj.qualification }">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>${doctorObj.specialist }</option>

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
								<label class="form-label">Email</label> <input type="text"
									readonly required name="email" class="form-control"
									value="${doctorObj.email }">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control"
									value="${doctorObj.mobNo }">
							</div>
							<input type="hidden" name="id" value="${doctorObj.id }">
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<%@include file="../component/footer.jsp" %>
</body>
</html>