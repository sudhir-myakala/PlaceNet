<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.dao.JobDAO" %>
<%@page import="com.entity.Jobs" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>User: Home</title>
  <%@ include file="all_components/all_css.jsp" %>
</head>
<body>
<%@ include file="all_components/navbar.jsp" %>

<c:if test="${empty userobj}">
  <c:redirect url="Login.jsp" />
</c:if>

<div class="container py-4 ">
  <div class="row">
    <div class="col-md-12">
      <h5 class="text-center text-primary fs-2">All Avaliable Active Jobs</h5>

      <!-- Success Message -->
      <c:if test="${not empty succMsg}">
        <h4 class="text-center text-danger">${succMsg}</h4>
        <c:remove var="succMsg" />
      </c:if>

      <!-- Filter Form -->
      <div class="card mt-3 border border-3 border-success">
        <div class="card-body">
          <form class="row g-3 align-items-center" action="more_view.jsp" method="get">
            <div class="col-md-4">
              <label for="locationSelect" class="form-label">Location</label>
              <select name="loc" class="form-select" id="locationSelect">
                <option selected value="lo">Choose...</option>
                <option value="Delhi">Delhi</option>
                <option value="Hyderabad">Hyderabad</option>
                <option value="Chennai">Chennai</option>
                <option value="Bangalore">Bangalore</option>
                <option value="Kolkata">Kolkata</option>
                <option value="Odisha">Odisha</option>
                <option value="Mumbai">Mumbai</option>
              </select>
            </div>

            <div class="col-md-4">
              <label for="categorySelect" class="form-label">Category</label>
              <select name="cat" class="form-select" id="categorySelect">
                <option value="ca" selected>Choose...</option>
                <option value="IT">IT</option>
                <option value="Developer">Developer</option>
                <option value="Banking">Banking</option>
                <option value="Engineering">Engineering</option>
                <option value="Tester">Tester</option>
              </select>
            </div>

            <div class="col-md-4 d-flex align-items-end">
              <button class="btn btn-success w-75 ">Submit</button>
            </div>
          </form>
        </div>
      </div>

      <!-- Jobs List -->
      <% 
        JobDAO dao = new JobDAO(DBConnect.getConn());
        List<Jobs> list = dao.getAllJobsForUser();
        for (Jobs j : list) {
      %>
      <div class="card mt-4 border border-3 border-success">
        <div class="card-body">
          <div class="text-center text-primary">
            <i class="far fa-clipboard fa-2x"></i>
          </div>
          <h6><%= j.getTitle() %></h6>

          <p>
            <%= j.getDescription().length() > 120 
                ? j.getDescription().substring(0, 120) + "..." 
                : j.getDescription() 
            %>
          </p>

          <div class="row g-3 mt-2">
            <div class="col-md-4">
              <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
            </div>
            <div class="col-md-4">
              <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
            </div>
          </div>

          <h6 class="mt-3">Published Date: <%= j.getPdate().toString() %></h6>

          <div class="text-center mt-3">
            <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-sm btn-success text-white"><i class="fa-solid fa-circle-info"></i>  View More</a>
          </div>
        </div>
      </div>
      <% } %>
    </div>
  </div>
</div>

<div style="margin-top: 94px;">
  <%@ include file="all_components/Footer.jsp" %>
</div>
</body>
</html>
