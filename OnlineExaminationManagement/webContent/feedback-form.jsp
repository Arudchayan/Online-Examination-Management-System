<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="com.student.model.Student" %>
<%@page import="com.student.model.Student" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Feedback Form</title>
<link rel="stylesheet" href="${contextPath}/css/bootstrap.css">	
<link rel="stylesheet" href="${contextPath}/styles.css">
<link rel="stylesheet" href="css/admin.css">	
</head>
<body>
<%
HttpSession ses = request.getSession();
Student s1=new Student();
s1=(Student)ses.getAttribute("student");
String sid=s1.getSID();
String sname=s1.getSname();
String email=s1.getEmail(); 
ses.setAttribute("sid",sid);
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
            <a class="nav-link" href="std-results">Results</a>
        </li>
    </ul>
    </div>
    	<form action="Logout" method="post">
            <input type="submit" class="btn btn-primary" value="Logout">
    	</form>
    
</div>
</nav>
<div class="container-fluid" align="center">
<div class="card" style="width:80%">
<h2 align="center" class="card-header">Feedback</h2>
<form method="post" action="stdFeedbackController">
<div class="card-body">
<table class="table card-body table-borderless" style="width:70%;  margin-left: auto; margin-right: auto; background:white;">
    <tr>
        <th>Student ID</th>
        <td><input type="text" name="sid" class="form-control" value="<%out.println(sid);%>" disabled></td>
    </tr>
    <tr>
        <th>Student Name</th>
        <td><input type="text" name="sname" class="form-control" value="<%out.println(sname);%>" disabled></td>
    </tr>
        <tr>
        <th>E-mail</th>
        <td><input type="text" name="email" class="form-control" value="<%out.println(email);%>" disabled></td>
    </tr>
    <tr>
        <th>Exam ID</th>
        <td><input type="text" name="examID" class="form-control"></td>
    </tr>
    <tr>
        <th>Subject</th>
        <td>
        <div class="form-check form-check-inline">
        <label class="form-check-label"> Comments &nbsp </label>
        <input type="radio" name="subject" class="form-check-input" value="comments">        
        </div>
        
        <div class="form-check form-check-inline">
        <label class="form-check-label"> Suggestions &nbsp </label>
		<input type="radio" name="subject" class="form-check-input" value="suggestions">		
		</div>
		
		<div class="form-check form-check-inline">
		<label class="form-check-label"> Issues &nbsp </label>
		<input type="radio" name="subject" class="form-check-input" value="issues">		
		</div>
		
		<div class="form-check form-check-inline">
		<label class="form-check-label"> Questions &nbsp </label>
		<input type="radio" name="subject" class="form-check-input" value="questions">		
		</div>
		
		</td>
    </tr>
    <tr>
        <th>Message</th>
        <td>
        <textarea rows="5" cols="30" name="message" class="form-control"></textarea>
        </td>
    </tr>
    <tr>
    <td colspan="2" style="text-align:center;">
    <input type="submit" value="Submit" class="btn btn-primary">
    </td>
    </tr>
</table>
</div>
</form>
</div>
</div>
<script type="text/javascript" src="${contextPath}/js/bootstrap.bundle.js" >
</body>
</html>