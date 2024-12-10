<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Job</title>
<%@ include file="all_components/all_css.jsp" %>
</head>
<body>
<c:if test="${userobj.role ne 'Admin'}">
  <c:redirect url="Login.jsp"></c:redirect>
</c:if>
<%@ include file="all_components/navbar.jsp" %>

<div class="container py-3">
  <div class="col-md-10 offset-md-1">
    <div class="card border-4 border-success">
      <div class="card-body">
        <div class="text-center text-success">
          <i class="fa fa-user-friends fa-3x"></i>

          <c:if test="${not empty succMsg}">
            <div class="alert alert-success" role="alert">${succMsg}</div>
            <c:remove var="succMsg"/>
          </c:if>

          <h5>Add Jobs</h5>
        </div>

        <form action="add_job" method="post">
          <!-- Title -->
          <div class="mb-3">
            <label for="titleInput" class="form-label">Enter Title</label>
            <input type="text" name="title" required class="form-control" id="titleInput">
          </div>

          <!-- Form Row -->
          <div class="row g-3">
            <!-- Location -->
            <div class="col-md-4">
              <label for="locationSelect" class="form-label">Location</label>
              <select name="location" class="form-select" id="locationSelect">
                <option selected>Choose...</option>
                <option value="Odisha">Odisha</option>
                <option value="Hyderabad">Hyderabad</option>
                <option value="Chennai">Chennai</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Pune">Pune</option>
                <option value="Nagpur">Nagpur</option>
                <option value="Delhi">Delhi</option>
                <option value="Kochi">Kochi</option>
                <option value="Kolkata">Kolkata</option>
              </select>
            </div>

            <!-- Category -->
            <div class="col-md-4">
              <label for="categorySelect" class="form-label">Category</label>
              <select class="form-select" id="categorySelect" name="category">
                <option selected>Choose...</option>
                <option value="IT">IT</option>
                <option value="Developer">Developer</option>
                <option value="Tester">Tester</option>
                <option value="Administration">Administration</option>
                <option value="Banking">Banking</option>
                <option value="Training">Training</option>
              </select>
            </div>

            <!-- Status -->
            <div class="col-md-4">
              <label for="statusSelect" class="form-label">Status</label>
              <select class="form-select" id="statusSelect" name="status">
                <option value="Active">Active</option>
                <option value="Inactive">Inactive</option>
              </select>
            </div>
          </div>

          <!-- Description -->
          <div class="my-3">
            <label for="descriptionTextarea" class="form-label">Enter Description</label>
            <textarea required rows="6" name="desc" class="form-control" id="descriptionTextarea"></textarea>
          </div>

          <!-- Submit Button -->
          <button class="btn btn-success">Post Job</button>
        </form>
      </div>
    </div>
  </div>
</div>

<%@ include file="all_components/Footer.jsp" %>
</body>
</html>
