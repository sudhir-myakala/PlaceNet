<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Admin Page</title>
  <%@ include file="all_components/all_css.jsp" %>
  <style>
    .card-img-top {
      height: 250px; /* Ensure all images have the same height */
      object-fit: cover; /* Makes sure the image covers the area without stretching */
    }
    .card-container {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      gap: 40px;
      flex-wrap: wrap;
    }
    .card {
      width: 18rem;
      height: 100%; /* Ensure all cards have the same height */
      display: flex;
      flex-direction: column;
    }
    .card-body {
      flex-grow: 1; /* Ensures the body takes the available space, keeping card size uniform */
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
  </style>
</head>
<body>

<!-- Redirect if the user is not an Admin -->
<c:if test="${userobj.role ne 'Admin'}">
  <c:redirect url="Login.jsp" />
</c:if>

<%@ include file="all_components/navbar.jsp" %>

<div class="container-fluid mt-3">
  <div class="row">
    <div class="col-12 text-center">
      <h1 class="text-dark p-2">Welcome, Admin</h1>
    </div>
  </div>
  
  <div class="container text-center">
    <!-- Using a flex container to center the cards -->
    <div class="card-container">
      <!-- First Card -->
      <div class="card border border-3 border-success">
        <img src="img/post_job.jpeg" class="card-img-top" alt="Post Job">
        <div class="card-body">
          <p class="card-text">Click here to add the new Job Opportunities according to the requirements</p>
          <a href="PostJob.jsp" class="btn btn-success">Post Job</a>
        </div>
      </div>

      <!-- Second Card -->
      <div class="card border border-3 border-success">
        <img src="img/view_job.jpeg" class="card-img-top" alt="View Job">
        <div class="card-body">
          <p class="card-text">Click here to view the Job Opportunities posted and also update the Job Details</p>
          <a href="ViewJobs.jsp" class="btn btn-success">View Job</a>
        </div>
      </div>
    </div>
  </div>
</div>

<div style="margin-top:69px;">
    <%@ include file="all_components/Footer.jsp" %>
  </div>

</body>
</html>
