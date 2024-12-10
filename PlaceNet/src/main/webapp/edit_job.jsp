<%@page import="com.dao.JobDAO" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.Jobs" %>
<%@page import="java.sql.Connection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Edit Jobs</title>
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

          <% 
            int id = Integer.parseInt(request.getParameter("id"));
            JobDAO dao = new JobDAO(DBConnect.getConn()); 
            Jobs j = dao.getJobById(id);
          %>

          <h5>Edit Jobs</h5>
        </div>

        <form action="update" method="post">
          <input type="hidden" value="<%= j.getId() %>" name="id">

          <!-- Title -->
          <div class="mb-3">
            <label for="titleInput" class="form-label">Enter Title</label>
            <input type="text" id="titleInput" name="title" required class="form-control" value="<%= j.getTitle() %>">
          </div>

          <!-- Location, Category, Status -->
          <div class="row g-3">
            <div class="col-md-4">
              <label for="locationSelect" class="form-label">Location</label>
              <select name="location" class="form-select" id="locationSelect">
                <option value="<%= j.getLocation() %>"><%= j.getLocation() %></option>
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

            <div class="col-md-4">
              <label for="categorySelect" class="form-label">Category</label>
              <select name="category" class="form-select" id="categorySelect">
                <option value="<%= j.getCategory() %>"><%= j.getCategory() %></option>
                <option value="IT">IT</option>
                <option value="Developer">Developer</option>
                <option value="Tester">Tester</option>
                <option value="Administration">Administration</option>
                <option value="Banking">Banking</option>
                <option value="Training">Training</option>
              </select>
            </div>

            <div class="col-md-4">
              <label for="statusSelect" class="form-label">Status</label>
              <select name="status" class="form-select" id="statusSelect">
                <option value="<%= j.getStatus() %>"><%= j.getStatus() %></option>
                <option value="Active">Active</option>
                <option value="Inactive">Inactive</option>
              </select>
            </div>
          </div>

          <!-- Description -->
          <div class="mb-3 mt-4">
            <label for="descriptionTextarea" class="form-label">Enter Description</label>
            <textarea id="descriptionTextarea" name="desc" required rows="6" class="form-control"><%= j.getDescription() %></textarea>
          </div>

          <!-- Submit Button -->
          <button class="btn btn-success">Update Job</button>
        </form>

      </div>
    </div>
  </div>
</div>

<%@ include file="all_components/Footer.jsp" %>
</body>
</html>
