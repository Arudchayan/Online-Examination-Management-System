<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="com.student.model.Student" %>
<%@page import="com.student.model.Results" %>
<%@page import="com.student.dao.ResultsDao" %>

<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Student Results</title>
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
            <a class="nav-link active" href="std-results.jsp">Results</a>
        </li>
    </ul>
    </div>
        <form action="Logout" method="post">
            <input type="submit" class="btn btn-primary" value="Logout">
    	</form>        
</div>
</nav>
<div align="right" class="container-fluid"><a href="feedback-form.jsp" style="text-decoration:none;"><button class="btn btn-primary">Send Feedback</button></a></div>
<h2 align="center">Results</h2>

<%        
ResultsDao dao=new ResultsDao();
List<Results> result = new ArrayList<>();
result=dao.getResults(sid); 
for(Results item:result){
%>
<table class="table card-body table-borderless" style="width:50%;  margin-left: auto; margin-right: auto; background:white; border-style:groove" >
<tr class="table-light">
<th>Answer ID</th>
<th>Exam ID</th>
<th>Exam Name</th>
<th>Exam Date</th>
<th>Exam Time</th>
<th>Duration</th>
<th>Marks</th>
</tr>
<tr class="<%if(item.getMarks()>=45){out.println("table-success");}else{out.println("table-danger");}%>">
<td><% out.println(item.getAnswerID()); %> </td>
<td><% out.println(item.getExamID()); %></td>
<td><% out.println(item.getExamName()); %></td>
<td><% out.println(item.getExamDate()); %></td>
<td><% out.println(item.getExamTime()); %></td>
<td><% out.println(item.getDuration()); %></td>
<td><% out.println(item.getMarks()); %></td>
</tr>
</table> 
<% 
}
%>






<script type="text/javascript" src="${contextPath}/js/bootstrap.bundle.js" ></script>
</body>
</html>


