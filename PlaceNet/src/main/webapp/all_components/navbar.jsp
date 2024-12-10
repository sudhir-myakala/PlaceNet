<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-custom text-light">
  <div class="container-fluid">
    <a class="navbar-brand fs-2 text-light" href="index.jsp">PlaceNet</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 fs-4 gap-3">
        <li class="nav-item">
          <a href="index.jsp" class="nav-link active" aria-current="page"><i class="fa-solid fa-house"></i> Home</a>
        </li>
        <c:if test="${userobj.role eq 'Admin'}">
          <li class="nav-item">
            <a class="nav-link" href="PostJob.jsp"><i class="fa-regular fa-circle-up"></i> Post Job</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ViewJobs.jsp"><i class="fa-solid fa-briefcase"></i> View Job</a>
          </li>
        </c:if>
      </ul>
      <form class="d-flex gap-2">
        <c:if test="${userobj.role eq 'Admin'}">
          <a href="Login.jsp" class="btn btn-light"><i class="fa-solid fa-user"></i> Admin</a>
          <a href="logout" class="btn btn-light"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
        </c:if>
        <c:if test="${userobj.role eq 'user'}">
          <a href="#" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-user"></i> ${userobj.name}</a>
          <a href="logout" class="btn btn-light"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
        </c:if>
        <c:if test="${empty userobj}">
          <a href="Login.jsp" class="btn btn-light"><i class="fa-solid fa-user"></i> Login</a>
          <a href="SignUp.jsp" class="btn btn-light"><i class="fa-regular fa-circle-user"></i> Sign In</a>
        </c:if>
      </form>
    </div>
  </div>
</nav>



<!-- Modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <!-- Modal Body -->
      <div class="modal-body">
        <div class="card border border-3 border-success">
          <div class="card-body">
            <div class="text-center text-primary mb-3">
              <i class="fas fa-user-circle fa-3x"></i>
            </div>
            <table class="table">
              <tbody>
                <tr>
                  <th scope="row">Name</th>
                  <td>${userobj.name}</td>
                </tr>
                <tr>
                  <th scope="row">Qualification</th>
                  <td>${userobj.password}</td>
                  
                </tr>
                <tr>
                  <th scope="row">Email</th>
                  <td>${userobj.qualification}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Modal Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="edit_profile.jsp" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i>  Edit</a>
      </div>
    </div>
  </div>
</div>

