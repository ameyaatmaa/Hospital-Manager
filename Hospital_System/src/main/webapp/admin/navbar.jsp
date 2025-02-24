<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
  
    <!-- Left-aligned links -->
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-square-h"></i> Medico</a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!-- Left-aligned navigation links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"> <i class="fa-brands fa-black-tie"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="doctor.jsp"> <i class="fa-solid fa-user-doctor"></i> Doctor</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="all_patient.jsp"> <i class="fa-regular fa-calendar-check"></i> Patient</a>
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
            <li><a class="dropdown-item text-danger" href="../adminLogout"><i class="fa-solid fa-sign-out-alt"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
      
    </div>
  </div>
</nav>
