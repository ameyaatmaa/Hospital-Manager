<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page isELIgnored="false"%>

<!-- Custom CSS for Styling -->
<style>
/* Navbar Styling */
.custom-navbar {
    background: linear-gradient(135deg, #0077b6, #48cae4); /* Gradient Blue */
    padding: 10px 15px;
    transition: all 0.3s ease-in-out;
}

.custom-navbar .navbar-brand {
    font-size: 1.8rem;
    font-weight: bold;
    color: #fff !important;
    transition: 0.3s;
}

.custom-navbar .navbar-brand:hover {
    transform: scale(1.1);
    color: #f8f9fa !important;
}

.custom-navbar .nav-link {
    font-size: 1.2rem;
    font-weight: 500;
    color: #fff !important;
    transition: all 0.3s ease-in-out;
}

.custom-navbar .nav-link:hover {
    color: #f8f9fa !important;
    text-shadow: 1px 1px 6px rgba(255, 255, 255, 0.6);
}

/* Dropdown Styling */
.navbar .dropdown-menu {
    background: #ffffff;
    border: none;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    animation: fadeIn 0.3s ease-in-out;
}

/* Dropdown Hover Effect */
.navbar .dropdown-item {
    color: #0077b6;
    font-weight: 500;
    transition: 0.3s;
}

.navbar .dropdown-item:hover {
    background-color: #0077b6;
    color: #fff;
}

/* Doctor Name Button Styling (Only Changed This) */
.doctor-btn {
    background: #ff6b6b; /* Red color */
    border: none;
    color: #fff !important;
    padding: 8px 18px;
    border-radius: 25px;
    font-size: 1rem;
    font-weight: 600;
    transition: all 0.3s ease-in-out;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
}

.doctor-btn:hover {
    background-color: #ff4d4d;
    transform: scale(1.05);
}

/* Animations */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg custom-navbar">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-square-h"></i> Medico</a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!-- Left-aligned Navigation Links (Patient Button is Here) -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">
            <i class="fa-brands fa-black-tie"></i> Home
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="patient.jsp">
            <i class="fa-regular fa-calendar-check"></i> Patient
          </a>
        </li>
      </ul>

      <!-- Right-aligned Doctor Profile Dropdown -->
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle doctor-btn" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown"
            aria-expanded="false">
            <i class="fa-solid fa-user-shield"></i> ${doctorObj.fullName}
          </a>

          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="adminDropdown">
            <li><a class="dropdown-item" href="edit_profile.jsp">
              <i class="fa-solid fa-user-edit"></i> Edit Profile
            </a></li>

            <li><hr class="dropdown-divider"></li>

            <li><a class="dropdown-item text-danger" href="../doctorLogout">
              <i class="fa-solid fa-sign-out-alt"></i> Logout
            </a></li>
          </ul>
        </li>
      </ul>
      
    </div>
  </div>
</nav>
