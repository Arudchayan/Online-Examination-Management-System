<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="com.student.model.Student" %>
<%@page import="com.student.model.Module" %>
<%@page import="com.student.dao.ModuleDao" %>

<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Student Modules</title>
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
            <a class="nav-link" href="student-index.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="std-modules.jsp">Modules</a>
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

<h2 align="center">Modules</h2>
<%        
ModuleDao dao=new ModuleDao();
List<Module> md = new ArrayList<>();
md=dao.getModule(sid); 
for(Module item:md){
%>
<table class="table table-borderless" style="width:50%;  margin-left: auto; margin-right: auto; background:white; border-style:groove;" >
<tr class="table-warning">
<th style="text-align:center">Module Code</th>
<th style="text-align:center">Module Name</th>
<th></th>
</tr>
<tr>
<td style="text-align:center"><%out.println(item.getMcode());%></td>
<td style="text-align:center"><%out.println(item.getMname());%></td>
</tr>
</table> 
<% 
}
%>
<script type="text/javascript" src="${contextPath}/js/bootstrap.bundle.js" >
</body>
</html>


