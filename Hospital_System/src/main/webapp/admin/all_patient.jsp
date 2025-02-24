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
<style type="text/css">
/* General Page Styling */
body {
    background: linear-gradient(to right, #f7f9fc, #eef2f3);
    font-family: 'Poppins', sans-serif;
}

/* Card Styling */
.paint-card {
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

.paint-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

/* Table Container */
.table-container {
    max-height: 500px;
    overflow-y: auto;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Table Styling */
.table {
    border-radius: 10px;
    overflow: hidden;
    text-align: center;
}

.table th {
    background-color: #4A90E2;
    color: white;
    padding: 15px;
    font-weight: 600;
}

.table td {
    background-color: white;
    color: #2c3e50;
    padding: 12px;
    font-size: 15px;
    vertical-align: middle;
}

/* Table Row Hover Effect */
.table-hover tbody tr:hover {
    background-color: #E3F2FD;
    transition: all 0.3s ease-in-out;
}

/* Status Column Styling */
td:last-child {
    font-weight: bold;
}

/* Pending Status */
td:contains("Pending") {
    color: #d9534f;
}

/* Approved Status */
td:contains("Approved") {
    color: #28a745;
}

/* Declined Status */
td:contains("Declined") {
    color: #dc3545;
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
						</tr>
					</thead>
					<tbody>
						<%
						AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
						DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
						List<Appointment> list = dao.getAllAppointment();
						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorById(ap.getDoctorId());
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
						</tr>
						<%
						}
						%>


					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>