<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="com.student.model.Student" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<title>Student Dashboard</title>
<link rel="stylesheet" href="${contextPath}/css/bootstrap.css">	
<link rel="stylesheet" href="${contextPath}/styles.css">	
</head>
<body>
<% 
HttpSession ses = request.getSession();
Student s1=new Student();
s1=(Student)ses.getAttribute("student");
int uid=s1.getUser_id();
String sid=s1.getSID();
String sname=s1.getSname();
String address=s1.getAddress();
String dob=s1.getDOB();
String nic=s1.getNIC();
String cid=s1.getCID();
String email=s1.getEmail();  
%>     
<nav class="navbar navbar-expand-lg bg-light">
<div class="container-fluid">
    <a class="navbar-brand" href="#"><img src="Images/Logo.png" alt="Logo" width="160"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link active" href="student-index.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="std-modules.jsp">Modules</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="exam-view.jsp">Exam</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="std-results.jsp">Results</a>
        </li>
    </ul>
    </div>
        <form action="Logout" method="post">
            <input type="submit" class="btn btn-primary" value="Logout">
    	</form>
</div>
</nav>
<br>

<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" style="height: 500px;">
      <img src="Images/exams.webp" class="d-block w-100" alt="exam" style="height: 500px;">
    </div>
    <div class="carousel-item" style="height: 500px;">
      <img src="Images/quote1.png" class="d-block w-100" alt="quote" style="height: 500px;">
    </div>
    <div class="carousel-item" style="height: 500px;">
      <img src="Images/quote1.png" class="d-block w-100" alt="quote" >
    </div>
  </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


<h2 align="center">Welcome <%out.println(sname);%></h2>
<div class="container-fluid" align="right"><a href="std-feedback.jsp" style="text-decoration:none;"><button class="btn btn-primary">Feedback</button></a></div>
 
<br>
<div class="container-fluid" align="center">
<div class="card"  style="width:80%">
<h4 class="card-header">Student Profile</h4>
 <div class="card-body">
<table class="table table-borderless" style="width:80%;  margin-left: auto; margin-right: auto;border:hidden;">
    <tr>
    <td colspan="2" style="text-align:right;">
    <a href="edit-student.jsp" style="text-decoration:none;"><button class="btn btn-primary">Edit</button></a>
    </td>
    </tr>
    <tr>
        <th>Student ID</th>
        <td><%out.println(sid);%></td>
    </tr>
    <tr>
        <th>Student Name</th>
        <td><%out.println(sname);%></td>
    </tr>
    <tr>
        <th>Address</th>
        <td><%out.println(address);%></td>
    </tr>
    <tr>
        <th>Date Of Birth</th>
        <td><%out.println(dob);%></td>
    </tr>
    <tr>
        <th>NIC</th>
        <td><%out.println(nic);%></td>
    </tr>
    <tr>
        <th>Enrolled Course</th>
        <td><%out.println(cid);%></td>
    </tr>
    <tr>
        <th>E-mail</th>
        <td><%out.println(email);%></td>
    </tr>
</table>
</div>
</div>
</div>


<script type="text/javascript" src="${contextPath}/js/bootstrap.bundle.js" >
</body>
</html>