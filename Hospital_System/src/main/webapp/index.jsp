<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="component/allcss.jsp" %>



<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 1200px;
        margin: 50px auto;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 30px;
        padding: 20px;
    }

    .features {
        flex: 1;
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }

    .card {
        background: #ffffff;
        width: 280px;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s, background 0.3s;
        text-align: center;
        border-top: 4px solid #228B22;
    }

    .card i {
        font-size: 40px;
        color: #228B22;
        margin-bottom: 15px;
    }

    .card:hover {
        background: #228B22;
        color: white;
        transform: scale(1.05);
    }

    .card:hover i {
        color: white;
    }

    .doctor-image {
        flex: 1;
        display: flex;
        justify-content: center;
    }

    .doctor-image img {
        max-width: 400px;
        width: 100%;
        border-radius: 10px;
    }

    h2 {
        text-align: center;
        color: #228B22;
        margin-top: 50px;
    }

    @media (max-width: 900px) {
        .container {
            flex-direction: column;
            text-align: center;
        }

        .doctor-image img {
            max-width: 300px;
        }
    }

    /* Our Team Section */
    .team-container {
        max-width: 1200px;
        margin: 50px auto;
        text-align: center;
    }

    .team {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }

    .team-card {
        background: #ffffff;
        width: 250px;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s;
        text-align: center;
    }

    .team-card img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        object-fit: cover;
        border: 3px solid #228B22;
    }

    .team-card h4 {
        margin: 15px 0 5px;
        color: #228B22;
    }

    .team-card p {
        color: #555;
        font-size: 14px;
    }

    .team-card:hover {
        transform: scale(1.05);
    }

</style>
</head>
<body>

<%@include file="component/navbar.jsp" %>

<% Connection conn = DBConnect.getConn(); 

out.print(conn);

%>

<!-- Carousel -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/travel.jpg" class="d-block w-100" alt="..." height="400px">
    </div>
    <div class="carousel-item">
      <img src="img/travel.jpg" class="d-block w-100" alt="..." height="400px">
    </div>
    <div class="carousel-item">
      <img src="img/travel.jpg" class="d-block w-100" alt="..." height="400px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- Key Features Section -->
<h2>Key Features of Our Hospital</h2>
<div class="container">
    <div class="features">
        <div class="card">
            <i class="fas fa-user-md"></i>
            <h3>Expert Doctors</h3>
            <p>Highly experienced doctors providing the best medical care.</p>
        </div>

        <div class="card">
            <i class="fas fa-ambulance"></i>
            <h3>24/7 Emergency</h3>
            <p>Round-the-clock emergency services for critical care.</p>
        </div>

        <div class="card">
            <i class="fas fa-heartbeat"></i>
            <h3>Advanced Facilities</h3>
            <p>State-of-the-art medical technology for precise diagnosis.</p>
        </div>

        <div class="card">
            <i class="fas fa-procedures"></i>
            <h3>Comfortable Wards</h3>
            <p>Hygienic and comfortable patient wards for recovery.</p>
        </div>

        <div class="card">
            <i class="fas fa-flask"></i>
            <h3>Modern Labs</h3>
            <p>Advanced diagnostic labs for accurate test results.</p>
        </div>

        <div class="card">
            <i class="fas fa-hand-holding-medical"></i>
            <h3>Compassionate Care</h3>
            <p>Personalized care ensuring the best patient experience.</p>
        </div>
    </div>

    <div class="doctor-image">
        <img src="img/doctor.jpg" alt="Doctor">
    </div>
</div>

<!-- Our Team Section -->
<h2>Meet Our Team</h2>
<div class="team-container">
    <div class="team">
        <div class="team-card">
            <img src="img/doctor1.jpg" alt="Doctor 1">
            <h4>Dr. John Smith</h4>
            <p>Cardiologist</p>
        </div>

        <div class="team-card">
            <img src="img/doctor2.jpg" alt="Doctor 2">
            <h4>Dr. Emily Brown</h4>
            <p>Neurologist</p>
        </div>

        <div class="team-card">
            <img src="img/doctor3.jpg" alt="Doctor 3">
            <h4>Dr. Alex Johnson</h4>
            <p>Orthopedic Surgeon</p>
        </div>

        <div class="team-card">
            <img src="img/doctor4.jpg" alt="Doctor 4">
            <h4>Dr. Sarah Williams</h4>
            <p>Pediatrician</p>
        </div>
    </div>
</div>


<%@include  file="component/footer.jsp" %>

</body>
</html>
