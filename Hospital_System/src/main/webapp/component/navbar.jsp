

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"  > <i class="fa-solid fa-square-h"></i>  Medico</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
       
       <c:if test="${empty userObj }">
       
       <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin_login.jsp"> <i class="fa-brands fa-black-tie"></i> Admin</a>
        
        </li>
        
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="doctor_login.jsp"> <i class="fa-solid fa-user-doctor"></i> Doctor</a>
        
        </li>
        
       
       
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_appointment.jsp"> <i class="fa-regular fa-calendar-check"></i> Appointment</a>
        
        </li>
        

     
        
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_login.jsp"> <i class="fa-solid fa-user-large"></i> User</a>
        </li>
       
       
       
       
       
       </c:if>
              
        
        
                
        <c:if test="${not empty userObj }">
        
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_appointment.jsp">Appointment</a>
        </li>
        
        
           <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="view_appointment.jsp">  View Appointment</a>
        </li>

     <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        <i class="fa-solid fa-user"></i> ${userObj.fullname}
    </a>
    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
        <li><a class="dropdown-item" href="userLogout">Logout</a></li> <!-- Replace with actual logout URL -->
    </ul>
</li>


        
        </c:if>
        
        
    
        
        
        

      </ul>
      
    </div>
  </div>
</nav>