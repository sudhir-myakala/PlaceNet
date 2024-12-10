<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.dao.JobDAO" %>
<%@ page import="com.entity.Jobs" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Job Details</title>
  <%@ include file="all_components/all_css.jsp" %>
</head>
<body>
<%@ include file="all_components/navbar.jsp" %>

<!-- Redirect if user is not logged in -->
<c:if test="${empty userobj}">
  <c:redirect url="Login.jsp" />
</c:if>

<div class="container my-5">
  <div class="row">
    <div class="col-md-12">
      <%
        int id = Integer.parseInt(request.getParameter("id"));
        JobDAO dao = new JobDAO(DBConnect.getConn());
        Jobs j = dao.getJobById(id);
      %>

      <!-- Job Card -->
      <div class="card mt-2 border border-3 border-success">
        <div class="card-body">
          <div class="text-center text-primary mb-3">
            <i class="far fa-clipboard fa-3x"></i>
          </div>
          <h4 class="text-center"><%= j.getTitle() %></h4>
          <p class="mt-3"><%= j.getDescription() %></p>

          <div class="row mt-4">
            <div class="col-md-6">
              <label class="form-label">Location:</label>
              <input type="text" class="form-control" value="<%= j.getLocation() %>" readonly />
            </div>
            <div class="col-md-6">
              <label class="form-label">Category:</label>
              <input type="text" class="form-control" value="<%= j.getCategory() %>" readonly />
            </div>
          </div>

          <h6 class="mt-4">Published Date: <%= j.getPdate().toString() %></h6>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<div style="margin-top: 191px;">
  <%@ include file="all_components/Footer.jsp" %>
</div>
</body>
</html>
