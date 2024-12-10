<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PlaceNet</title>
<link rel="icon" type="image/x-icon" href="img/R_Letter.svg">
<%@ include file="all_components/all_css.jsp" %>

<style type="text/css">
.back-img{
background:url("img/JobPortalHome.jpg");
width:100%;
height:100vh;
background-repeat:no-repeat;
background-size:cover;
}
</style>

</head>


<body>
<%@ include file="all_components/navbar.jsp" %>

<div class="container-fuild back-img">

<div class="text-center">
<h1 class="text-dark p-5">
PlaceNet - Create your Opportunity 
</h1>
</div>

</div>
<%@ include file="all_components/Footer.jsp" %>

</body>
</html>