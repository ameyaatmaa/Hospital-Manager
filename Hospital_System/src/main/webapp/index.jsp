<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="component/allcss.jsp" %>

<style>
    /* General Styles */
    body {
        font-family: 'Poppins', sans-serif;
        background: #f0f9ff;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        color: #0077b6;
        margin-top: 50px;
        font-size: 26px;
        font-weight: bold;
        text-transform: uppercase;
    }

    /* Cards Section */
    .container {
        max-width: 1200px;
        margin: 50px auto;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 30px;
        padding: 20px;
    }

    .card {
        background: white;
        width: 300px;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s, background 0.3s;
        text-align: center;
        border-top: 5px solid #0077b6;
    }

    .card i {
        font-size: 42px;
        color: #0077b6;
        margin-bottom: 15px;
    }

    .card:hover {
        background: linear-gradient(135deg, #0077b6, #48cae4);
        color: white;
        transform: scale(1.05);
    }

    .card:hover i {
        color: white;
    }

    /* Team Section */
    .team-container {
        max-width: 1200px;
        margin: 50px auto;
        text-align: center;
        padding: 20px;
    }

    .team {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 30px;
    }

    .team-card {
        background: white;
        width: 250px;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
        text-align: center;
        border-top: 5px solid #0077b6;
    }

    .team-card img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        object-fit: cover;
        border: 3px solid #0077b6;
    }

    .team-card h4 {
        margin: 15px 0 5px;
        color: #0077b6;
        font-size: 18px;
        font-weight: bold;
    }

    .team-card p {
        color: #555;
        font-size: 14px;
    }

    .team-card:hover {
        transform: scale(1.05);
        background: linear-gradient(135deg, #0077b6, #48cae4);
        color: white;
    }

    .team-card:hover h4 {
        color: white;
    }

    .team-card:hover p {
        color: #e0f7ff;
    }
</style>

</head>
<body>

<%@include file="component/navbar.jsp" %>

<!-- Carousel -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/doc1.png" class="d-block w-100" alt="..." height="400px">
    </div>
    <div class="carousel-item">
      <img src="img/doc2.png" class="d-block w-100" alt="..." height="400px">
    </div>
    <div class="carousel-item">
      <img src="img/doc3.png" class="d-block w-100" alt="..." height="400px">
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

<h2>Key Features of Our Hospital</h2>
<div class="container">
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

<h2>Meet Our Team</h2>
<div class="team-container">
    <div class="team">
        <div class="team-card">
            <img src="img/jon.jpg" alt="Doctor 1">
            <h4>Dr. John Smith</h4>
            <p>Cardiologist</p>
        </div>

        <div class="team-card">
            <img src="img/juli.jpg" alt="Doctor 2">
            <h4>Dr. Emily Brown</h4>
            <p>Neurologist</p>
        </div>

        <div class="team-card">
            <img src="img/smith.jpg" alt="Doctor 3">
            <h4>Dr. Alex Johnson</h4>
            <p>Orthopedic Surgeon</p>
        </div>

        <div class="team-card">
            <img src="img/sarah.jpg" alt="Doctor 4">
            <h4>Dr. Sarah Williams</h4>
            <p>Pediatrician</p>
        </div>
    </div>
</div>

<%@include file="component/footer.jsp" %>

</body>
</html>
