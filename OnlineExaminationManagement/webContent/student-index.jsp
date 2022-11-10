<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="com.student.model.Student" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
		String userName = (String) session.getAttribute("userNameLogin");
		String fName = (String) session.getAttribute("firstNameLogin");
		if(session.getAttribute("userNameLogin") == null)
			response.sendRedirect("index.jsp");
	%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<title>Student Dashboard</title>
<link rel="stylesheet" href="${contextPath}/css/bootstrap.css">	
<link rel="stylesheet" href="${contextPath}/styles.css">	
<link rel="stylesheet" href="css/admin.css">
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
    <ul class="navbar-nav m-auto mb-2">
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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ul>
    <div class="carousel-inner" style="height:600px;">
        <div class="carousel-item active" style="height:550px;" data-bs-interval="10">
            <img class="d-block w-100" src="Images/exams.jpg" alt="First slide" style="object-fit: cover; height:550px;">
        </div>
        <div class="carousel-item" style="height:500px;" data-bs-interval="10">
            <img class="d-block w-100" src="Images/quote1.jpg" alt="Second slide" style="object-fit: cover; height:550px;">
        </div>
        <div class="carousel-item" style="height:500px;" data-bs-interval="10">
            <img class="d-block w-100" src="Images/quote2.webp" alt="Third slide" style="object-fit: cover; height:550px;">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon"></span>
        <span class="sr-only">Next</span>
    </a>
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


<script type="text/javascript" src="${contextPath}/js/bootstrap.bundle.js" ></script>
</body>
</html>