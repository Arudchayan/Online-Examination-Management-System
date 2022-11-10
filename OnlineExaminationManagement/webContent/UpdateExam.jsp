<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.lecturer.model.Exam"%>
<!DOCTYPE html>
<html>
<head>

<title>Update Exam</title>
<meta charset="ISO-8859-1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="jquery.dateimepicker.min.css"rel="stylesheet"/>
<meta charset="ISO-8859-1">
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
              <a class="nav-link" href="AddSubject.jsp">Add Module</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="EditSubject.jsp">Edit Module</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="DeleteModule.jsp">Delete Module</a>
            </li>           
          </ul>
          <form action="Logout" method="post">
            <input type="submit" class="btn btn-primary" value="Logout">
          </form>
        </div>
      </div>
    </nav>
<% 	Exam exam =(Exam)request.getAttribute("exam");%>

<h1 align="center">Update Exam</h1>
<div class="container-fluid" style="width:50%;">
<form method="post" action="Update" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="exampleInputExamID" class="form-label">Exam ID</label>
      <input type="text" class="form-control" id="exampleInputExamID"name="ExamID" value="<%=exam.getExamID()%>">
    </div>
    <div class="mb-3">
      <label for="exampleInputMcode"class="form-label">Mcode</label>
      <input type="text" class="form-control" id="exampleInputMcode"name="Mcode"value="<%=exam.getMcode()%>">
    </div>
    <div class="mb-3">
      <label for="exampleInputExam Name"class="form-label">Exam Name</label>
      <input type="text" class="form-control" id="exampleInputExam Name"name="ExamName" value="<%=exam.getExamName()%>">
    </div>
    <div class="mb-3">
        <label for="exampleInputCourse ID"class="form-label">Batch ID</label>
        <input type="text" class="form-control" id="exampleInputCourse ID"name="BatchID" value="<%=exam.getBatchID()%>">
      </div>
      <div class="mb-3">
        <label for="exampleInputDate"class="form-label">Exam Date</label>
        <input type="date" class="form-control" id="exampleInputDate&Time" name="ExamDate" value="<%=exam.getExamDate()%>">
      </div>
      <div class="mb-3">
        <label for="exampleInputTime"class="form-label">Exam Time</label>
        <input type="time" class="form-control" id="exampleTime"name="ExamTime" value="<%=exam.getExamTime()%>">
      </div>
      <div class="mb-3">
        <label for="exampleInputTime"class="form-label">Duration</label>
        <input type="text" class="form-control" id="exampleTime"name="Duration" value="<%=exam.getDuration()%>">
      </div>
      
       
    <button type="Update" class="btn btn-primary">Update</button>
    <td>
      <button type="Cancel" class="btn btn-primary">Cancel</button>
    </td>
  </form>
</div> 

</body>
</html>
 
 