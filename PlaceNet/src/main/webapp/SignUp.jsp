<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <%@ include file="all_components/all_css.jsp" %>
  <title>Sign-Up Page</title>
</head>
<body>
  <%@ include file="all_components/navbar.jsp" %>

  <div class="container-fluid p-5">
    <div class="row justify-content-center">
      <div class="col-md-4">
        <div class="card border border-primary border-3">
          <div class="card-body">
            <div class="text-center mb-4">
              <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
              <h5>Sign-Up Page</h5>
            </div>

            <!-- Success Message -->
            <c:if test="${not empty succMsg}">
              <h4 class="text-center text-success">${succMsg}</h4>
              <c:remove var="succMsg"/>
            </c:if>

            <!-- Form -->
            <form action="add_user" method="post">

              <!-- Name Input -->
              <div class="mb-3">
                <label for="exampleInputName" class="form-label">Enter Username</label>
                <input 
                  type="text" 
                  class="form-control" 
                  id="exampleInputName" 
                  name="name" 
                  required>
              </div>

              <!-- Qualification Input -->
              <div class="mb-3">
                <label for="exampleInputQualification" class="form-label">Enter Qualification</label>
                <input 
                  type="text" 
                  class="form-control" 
                  id="exampleInputQualification" 
                  name="qua" 
                  required>
              </div>

              <!-- Email Input -->
              <div class="mb-3">
                <label for="exampleInputEmail" class="form-label">Email</label>
                <input 
                  type="email" 
                  class="form-control" 
                  id="exampleInputEmail" 
                  name="email" 
                  required>
              </div>

              <!-- Password Input -->
              <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Enter Password</label>
                <input 
                  type="password" 
                  class="form-control" 
                  id="exampleInputPassword1" 
                  name="ps" 
                  required>
              </div>

              <!-- Submit Button -->
              <div class="text-center">
                <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <div class="mt-5">
    <%@ include file="all_components/Footer.jsp" %>
  </div>
</body>
</html>
