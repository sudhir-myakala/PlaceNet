<%@page import="com.dao.JobDAO" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@page import="com.entity.Jobs" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Jobs</title>
<%@ include file="all_components/all_css.jsp" %>
</head>
<body>

<c:if test="${userobj.role ne 'Admin'}">
  <c:redirect url="Login.jsp"></c:redirect>
</c:if> 

<%@ include file="all_components/navbar.jsp" %>
<div class="container">

  <div class="row py-3">
    <div class="col-md-12">
      <h5 class="text-center text-success fs-2">Available Jobs</h5>
      <c:if test="${not empty succMsg}">
        <div class="alert alert-success" role="alert">${succMsg}</div>
        <c:remove var="succMsg"/>
      </c:if>

      <% 
        JobDAO dao = new JobDAO(DBConnect.getConn());
        List<Jobs> list = dao.getAllJobs();
        for (Jobs j : list) { 
      %>
      <div class="card mt-3 border border-3 border-success">
        <div class="card-body">
          <div class="text-center text-success"> 
            <i class="far fa-clipboard fa-2x"></i>
          </div>
          <h6><%= j.getTitle() %></h6>
          <p><%= j.getDescription() %></p>
          
          <div class="row g-3">
            <div class="col-md-4">
              <input type="text" class="form-control form-control-sm" 
                     value="Location: <%= j.getLocation() %>" readonly>
            </div>
            <div class="col-md-4">
              <input type="text" class="form-control form-control-sm" 
                     value="Category: <%= j.getCategory() %>" readonly>
            </div>
            <div class="col-md-4">
              <input type="text" class="form-control form-control-sm" 
                     value="Status: <%= j.getStatus() %>" readonly>
            </div>
          </div>

          <h6 class="mt-3">Publish Date: <%= j.getPdate() %></h6>

          <div class="text-center mt-3">
            <a href="edit_job.jsp?id=<%= j.getId() %>" 
               class="btn btn-sm btn-success"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
            <a href="delete?id=<%= j.getId() %>" 
               class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>  Delete</a>
          </div>
        </div>
      </div>
      <% } %>
    </div>
  </div>

</div>

<%@ include file="all_components/Footer.jsp" %>
</body>
</html>
