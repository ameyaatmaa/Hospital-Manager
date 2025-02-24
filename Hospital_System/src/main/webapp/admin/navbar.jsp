<nav class="navbar navbar-expand-lg custom-navbar">
  <div class="container-fluid">
  
    <!-- Left-aligned links -->
    <a class="navbar-brand" href="index.jsp">
      <i class="fa-solid fa-square-h"></i> Medico
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!-- Left-aligned navigation links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">
            <i class="fa-brands fa-black-tie"></i> Home
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="doctor.jsp">
            <i class="fa-solid fa-user-doctor"></i> Doctor
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="all_patient.jsp">
            <i class="fa-regular fa-calendar-check"></i> Patient
          </a>
        </li>
      </ul>

      <!-- Right-aligned dropdown for Admin + Logout -->
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-solid fa-user-shield"></i> Admin
          </a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="adminDropdown">
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item text-danger logout-link" href="../adminLogout">
              <i class="fa-solid fa-sign-out-alt"></i> Logout</a>
            </li>
          </ul>
        </li>
      </ul>
      
    </div>
  </div>
</nav>

<style>
/* Custom Navbar Styling */
.custom-navbar {
   background: linear-gradient(135deg, #0077b6, #48cae4); /* Gradient Blue */
    padding: 10px 15px;
    transition: all 0.3s ease-in-out;
}

.custom-navbar:hover {
  background: linear-gradient(135deg, #005792, #0096c7);
}

.custom-navbar .navbar-brand {
  font-size: 1.8rem;
    font-weight: bold;
    color: #fff !important;
    transition: 0.3s;
}

.custom-navbar .navbar-brand:hover {
  color: #ffcc00;
  transform: scale(1.1);
}

/* Navigation Links */
.custom-navbar .nav-link {
  color: white !important;
  font-weight: 500;
  transition: all 0.3s ease-in-out;
}

.custom-navbar .nav-link:hover {
  color: #ffcc00 !important;
  transform: translateY(-2px);
  text-shadow: 2px 2px 6px rgba(255, 255, 255, 0.6);
}

/* Dropdown Menu */
.animated-dropdown {
  border-radius: 10px;
  border: none;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  animation: fadeIn 0.3s ease-in-out;
}

/* Dropdown Animation */
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

/* Admin Button */
.admin-btn {
  background: #ff6b6b;
  padding: 8px 18px;
  border-radius: 25px;
  font-size: 1rem;
  font-weight: 600;
  transition: all 0.3s ease-in-out;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
}

.admin-btn:hover {
  background-color: #ff4d4d;
  transform: scale(1.05);
}

/* Logout Button */
.logout-link {
  font-weight: bold;
  transition: all 0.3s ease-in-out;
}

.logout-link:hover {
  background: rgba(255, 0, 0, 0.1);
  color: red !important;
}

</style>
