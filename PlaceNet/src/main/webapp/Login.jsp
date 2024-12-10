<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>User Login</title>
  <%@ include file="all_components/all_css.jsp" %>
  <style>
    .btn-center {
      display: flex;
      justify-content: center;
    }
  </style>
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
              <h5>Login Page</h5>
            </div>

            <c:if test="${not empty succMsg}">
              <h4 class="text-center text-danger">${succMsg}</h4>
              <c:remove var="succMsg"/>
            </c:if>

            <form action="Login" method="post">
              <!-- Username/Email Input -->
              <div class="mb-3">
                <label for="emailInput" class="form-label">Enter Username / Email:</label>
                <input 
                  type="email" 
                  class="form-control" 
                  id="emailInput" 
                  name="email" 
                  required
                >
              </div>

              <!-- Password Input -->
              <div class="mb-3">
                <label for="passwordInput" class="form-label">Enter Password:</label>
                <input 
                  type="password" 
                  class="form-control" 
                  id="passwordInput" 
                  name="password" 
                  required
                >
              </div>

              <!-- Submit Button -->
              <div class="text-center">
                <button type="submit" class="btn btn-primary btn-block">Login</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

 <div style="margin-top:139px;">
    <%@ include file="all_components/Footer.jsp" %>
  </div>
</body>
</html>
