<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="com.student.model.Student" %>
<%@page import="com.student.model.Feedback" %>
<%@page import="com.student.dao.FeedbackDao" %>

<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<title>Student Feedback</title>
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
            <a class="nav-link" href="student-index.jsp">Home</a>
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
<div align="right" class="container-fluid"><a href="feedback-form.jsp" style="text-decoration:none;"><button class="btn btn-primary">Send Feedback</button></a></div>
<h2 align="center">Feedback</h2>

<%        
FeedbackDao dao=new FeedbackDao();
List<Feedback> fd = new ArrayList<>();
fd=dao.getFeedback(sid); 
for(Feedback item:fd){
%>
<table class="table card-body table-borderless" style="width:60%;  margin-left: auto; margin-right: auto; background:white; border-style:groove" >

<tr class="table-info">
<th>MessageID</th>
<th>Date</th>
<th>Exam ID</th>
<th>Subject</th>
<th>Message</th>
<th></th>
</tr>

<tr>
<td>
<% 
ses.setAttribute("mid", item.getMessageID());
out.println(item.getMessageID());
%> 
</td>
<td><% out.println(item.getDate()); %> </td>
<td><% out.println(item.getExamID()); %></td>
<td><% out.println(item.getSubject()); %></td>
<td><% out.println(item.getContent()); %></td>
<td>
<form action=deleteFBController>
<input type="submit" value="Delete" class="btn btn-danger">
</form></td>
</tr>
</table> 
<% 
}
%>






<script type="text/javascript" src="${contextPath}/js/bootstrap.bundle.js" >
</body>
</html>


