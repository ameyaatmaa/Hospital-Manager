<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style>

.paint-card {
    background: linear-gradient(135deg, #f9f9f9, #ffffff); 
    border-radius: 15px;
    padding: 20px;
    transition: all 0.3s ease-in-out;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1); 
}


.table {
    border-radius: 10px;
    overflow: hidden;
}

.table thead {
    background: linear-gradient(135deg, #0077b6, #00b4d8); 
    color: white;
    font-size: 1rem;
    text-transform: uppercase;
}

.table tbody tr {
    transition: 0.3s ease-in-out;
}

.table tbody tr:hover {
    background-color: rgba(0, 183, 255, 0.1); 
}


.btn-success {
    background: linear-gradient(135deg, #00b894, #0984e3); 
    border: none;
    padding: 8px 12px;
    transition: 0.3s ease-in-out;
    font-weight: bold;
    border-radius: 8px;
}

.btn-success:hover {
    background: linear-gradient(135deg, #0984e3, #00b894);
    transform: scale(1.05);
}

.btn-sm.disabled {
    background: #b2bec3 !important;
    cursor: not-allowed;
}


@media screen and (max-width: 768px) {
    .table {
        font-size: 0.9rem;
    }
    .btn {
        font-size: 0.8rem;
        padding: 6px 10px;
    }
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
							<th scope="col" >Action</th>
						</tr>
					</thead>
					<tbody>
						<%
					
						AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
						DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
						Doctor d=(Doctor)session.getAttribute("doctorObj");
						List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
						for (Appointment ap : list) {
							
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=ap.getAddress()%></td>
							<td><%=ap.getStatus()%></td>
							<td>
							
							<%
							
							if("Pending".equals(ap.getStatus())){%>
								
								<a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-small">Comment</a>
								
							<%}else{%>
								
								<a href="#" class="btn btn-success btn-sm disabled">Comment</a>
								
								
							<%}
							
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
	<br>
	<%@include file="../component/footer.jsp" %>
</body>
</html>