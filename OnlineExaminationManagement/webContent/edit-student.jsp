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
<title>Update Student</title>
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
ses.setAttribute("uid",uid);
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
    <a class="navbar-brand" href="#"><img src="images/Logo.png" alt="Logo" width="160"></a>
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
<div class="container-fluid" align="center">
<div class="card" style="width:80%">
<h2 align="center" class="card-header">Edit Profile</h2>
<form method="post" action="EditStudentController">
<div class="card-body">
<table class="table card-body table-borderless" style="width:80%;  margin-left: auto; margin-right: auto; background:white;">
    <tr>
        <th>Student ID</th>
        <td><input type="text" name="sid" class="form-control" value="<%out.println(sid);%>" disabled></td>
    </tr>
    <tr>
        <th>Student Name</th>
        <td><input type="text" name="sname" class="form-control" value="<%out.println(sname);%>"></td>
    </tr>
    <tr>
        <th>Address</th>
        <td><input type="text" name="address" class="form-control" value="<%out.println(address);%>"></td>
    </tr>
    <tr>
        <th>Date Of Birth</th>
        <td><input type="text" name="dob" class="form-control" value="<%out.println(dob);%>"></td>
    </tr>
    <tr>
        <th>NIC</th>
        <td><input type="text" name="nic" class="form-control" value="<%out.println(nic);%>" disabled></td>
    </tr>
    <tr>
        <th>Enrolled Course</th>
        <td><input type="text" name="cid" class="form-control" value="<%out.println(cid);%>" disabled></td>
    </tr>
    <tr>
        <th>E-mail</th>
        <td><input type="text" name="email" class="form-control" value="<%out.println(email);%>" disabled></td>
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