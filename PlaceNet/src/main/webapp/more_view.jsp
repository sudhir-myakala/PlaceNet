<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.dao.JobDAO" %>
<%@ page import="com.entity.Jobs" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>All Jobs</title>
  <%@ include file="all_components/all_css.jsp" %>
</head>
<body>
<%@ include file="all_components/navbar.jsp" %>

<!-- Redirect if user is not logged in -->
<c:if test="${empty userobj}">
  <c:redirect url="Login.jsp" />
</c:if>

<div class="container py-4">
  <div class="row">
    <div class="col-md-12">
      <h5 class="text-center text-primary fs-2">All Jobs</h5>

      <% 
        String loc = request.getParameter("loc");
        String cat = request.getParameter("cat");
        String msg = "";

        JobDAO dao = new JobDAO(DBConnect.getConn());
        List<Jobs> list = null;

        if ("lo".equals(loc) && "ca".equals(cat)) {
          list = new ArrayList<Jobs>();
          msg = "Job Not Available";
        } else if ("lo".equals(loc) || "ca".equals(cat)) {
          list = dao.getJobsORLocationAndCate(cat, loc);
        } else {
          list = dao.getJobsAndLocationAndCate(cat, loc);
        }

        if (list.isEmpty()) {
      %>
      <h4 class="text-center text-danger">Job Not Available</h4>
      <% } 
        if (list != null) { 
          for (Jobs j : list) { 
      %>

      <!-- Job Card -->
      <div class="card mt-3 border border-3 border-success">
        <div class="card-body">
          <div class="text-center text-primary">
            <i class="far fa-clipboard fa-2x"></i>
          </div>
          <h6><%= j.getTitle() %></h6>
          <p><%= j.getDescription() %></p>

          <div class="row mt-2">
            <div class="col-md-6">
              <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly />
            </div>
            <br>
            <div class="col-md-6">
              <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly />
            </div>
          </div>

          <h6 class="mt-3">Publish Date: <%= j.getPdate().toString() %></h6>

          <div class="text-center mt-3">
            <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-success btn-sm text-white"><i class="fa-solid fa-circle-info"></i>  View More</a>
          </div>
        </div>
      </div>
      <% 
          } 
        } else { 
      %>
      <h4 class="text-center text-danger"><%= msg %></h4>
      <% } %>
    </div>
  </div>
</div>

<!-- Footer -->
<div style="margin-top: 188px;">
  <%@ include file="all_components/Footer.jsp" %>
</div>
</body>
</html>
