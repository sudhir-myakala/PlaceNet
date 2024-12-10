<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Edit Profile</title>
  <%@ include file="all_components/all_css.jsp" %>
</head>
<body>
<%@ include file="all_components/navbar.jsp" %>

<!-- Redirect if user is not logged in -->
<c:if test="${empty userobj}">
  <c:redirect url="Login.jsp" />
</c:if>

<div class="container-fluid my-5">
  <div class="row p-4">
    <div class="col-md-6 offset-md-3">
      <div class="card">
        <div class="card-body">
          <div class="text-center mb-4">
            <i class="fa fa-user-plus fa-3x text-primary" aria-hidden="true"></i>
            <h5 class="mt-2">Edit Profile</h5>
          </div>

          <form action="update_profile" method="post">
            <!-- Hidden User ID -->
            <input type="hidden" name="id" value="${userobj.id}">

            <!-- Full Name -->
            <div class="mb-3">
              <label for="name" class="form-label">Enter Full Name</label>
              <input type="text" id="name" name="name" class="form-control" required value="${userobj.name}">
            </div>

            <!-- Qualification -->
            <div class="mb-3">
              <label for="qualification" class="form-label">Enter Qualification</label>
              <input type="text" id="qualification" name="qua" class="form-control" required value="${userobj.qualification}">
            </div>

            <!-- Email -->
            <div class="mb-3">
              <label for="email" class="form-label">Enter Email</label>
              <input type="email" id="email" name="email" class="form-control" required value="${userobj.email}">
            </div>

            <!-- Password -->
            <div class="mb-3">
              <label for="password" class="form-label">Enter Password</label>
              <input type="password" id="password" name="ps" class="form-control" required value="${userobj.password}">
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary w-100">Update</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="all_components/Footer.jsp" %>
</body>
</html>
