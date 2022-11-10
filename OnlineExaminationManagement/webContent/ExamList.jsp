<%@page import="com.lecturer.model.ExamDao"%>
<%@page import="java.util.*"%>
<%@ page import="com.lecturer.model.Exam"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
		String userName = (String) session.getAttribute("userNameLogin");
		String fName = (String) session.getAttribute("firstNameLogin");
		if(session.getAttribute("userNameLogin") == null)
			response.sendRedirect("index.jsp");
	%>
<title>Exam List</title>
<meta charset="ISO-8859-1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/admin.css">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
<a class="navbar-brand" href="#"><img src="Images/Logo.png" alt="Logo" width="160"></a>
      <div class="container-fluid">
        <div class="collapse navbar-collapse">
          <ul class="navbar-nav m-auto mb-2">
          	<li class="nav-item">
              <a class="nav-link" href="HomePage.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="AddExam.jsp">Add Exam</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ExamList.jsp">Exam List</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="AddSubject.jsp">Add Subject</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="EditSubject.jsp">Edit Module</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="DeleteModule.jsp">Delete Subject</a>
            </li>           
          </ul>
          <form action="Logout" method="post">
            <input type="submit" class="btn btn-primary" value="Logout">
          </form>
        </div>
      </div>
    </nav>
<h1 align="center">Exam List</h1>
<div class="container-fluid" style="width:80%;">
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">ExamID</th>
      <th scope="col">ExamName</th>
      <th scope="col">Date</th>
      <th scope="col">Time</th>
      <th scope="col">Edit</th>
      <th scope="col">Delete</th> 
    </tr>
  </thead>
  <tbody>
    <tr>
    
<%ExamDao examdao = new ExamDao();
ArrayList<Exam> exam=new ArrayList<>();
exam = examdao.selectAllExams();
for(Exam e1:exam){ %>
<td><%=e1.getExamID()%> </td>
<td><%=e1.getExamName()%></td>
<td><%=e1.getExamDate()%></td>
<td><%=e1.getExamTime()%></td>
        <form action="GetExam"method="post">
        <input type="hidden" name="ExamID" value="<%=e1.getExamID()%>">
        <td><button type="Edit" class="btn btn-primary">Edit</button></td>
        </form>
        <form action="Delete" >
         <input type="hidden" name="ExamID" value="<%=e1.getExamID()%>">
        <td><button type="Delete" class="btn btn-primary" onclick="myFunction()">Delete</button></td>
          </form>
      </tr>
      <%}%>
  </tbody>
</table>
</div>
</body>
<script>
function myFunction() {
	alert("The exam record has been deleted ");
}
</script>

</html>
 
</body>
</html>