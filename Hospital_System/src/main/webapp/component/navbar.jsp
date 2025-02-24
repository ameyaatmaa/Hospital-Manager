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

/* Button Styling */
.custom-navbar .btn {
    background-color: #ff6b6b;
    color: white;
    border-radius: 25px;
    transition: all 0.3s ease-in-out;
    padding: 5px 15px;
    font-size: 1rem;
}

.custom-navbar .btn:hover {
    background-color: #ff4d4d;
    transform: scale(1.1);
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
    <a class="navbar-brand" href="index.jsp"> <i class="fa-solid fa-square-h"></i> Medico</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <!-- Show if user is not logged in -->
        <c:if test="${empty userObj}">
          <li class="nav-item">
            <a class="nav-link" href="admin_login.jsp"> <i class="fa-brands fa-black-tie"></i> Admin</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="doctor_login.jsp"> <i class="fa-solid fa-user-doctor"></i> Doctor</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="user_appointment.jsp"> <i class="fa-regular fa-calendar-check"></i> Appointment</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="user_login.jsp"> <i class="fa-solid fa-user-large"></i> User</a>
          </li>
        </c:if>

        <!-- Show if user is logged in -->
        <c:if test="${not empty userObj}">
          <li class="nav-item">
            <a class="nav-link" href="user_appointment.jsp">Appointment</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="view_appointment.jsp">View Appointment</a>
          </li>

          <!-- User Profile Dropdown -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              <i class="fa-solid fa-user"></i> ${userObj.fullname}
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
              <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
              <li><a class="dropdown-item" href="userLogout">Logout</a></li>
            </ul>
          </li>
        </c:if>

      </ul>
    </div>
  </div>
</nav>


