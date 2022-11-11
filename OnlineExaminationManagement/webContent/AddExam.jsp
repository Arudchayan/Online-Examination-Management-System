<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="jquery.dateimepicker.min.css"rel="stylesheet"/>
    <link rel="stylesheet" href="css/admin.css">
<meta charset="ISO-8859-1">
 
 <title>Add Exam</title>
</head>
<body>
<%
		String userName = (String) session.getAttribute("userNameLogin");
		String fName = (String) session.getAttribute("firstNameLogin");
		if(session.getAttribute("userNameLogin") == null)
			response.sendRedirect("index.jsp");
	%>
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
<h1 align="center">Create Exam</h1>
<div class="container-fluid" style="width:50%;">
<form method="post" action="Add" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="exampleInputExamID" class="form-label">Exam ID</label>
      <input type="text" class="form-control" id="exampleInputExamID"name="ExamID" required>
    </div>
    <div class="mb-3">
      <label for="exampleInputMcode"class="form-label">Mcode</label>
      <input type="text" class="form-control" id="exampleInputMcode"name="Mcode" required>
    </div>
    <div class="mb-3">
      <label for="exampleInputExam Name"class="form-label">Exam Name</label>
      <input type="text" class="form-control" id="exampleInputExam Name"name="ExamName" required>
    </div>
    <div class="mb-3">
        <label for="exampleInputCourse ID"class="form-label">Batch ID</label>
        <input type="text" class="form-control" id="exampleInputCourse ID"name="BatchID" required>
      </div>
      <div class="mb-3">
        <label for="exampleInputDate"class="form-label">Exam Date</label>
        <input type="date" class="form-control" id="exampleInputDate&Time" name="ExamDate" required>
      </div>
      <div class="mb-3">
        <label for="exampleInputTime"class="form-label">Exam Time</label>
        <input type="time" class="form-control" id="exampleTime"name="ExamTime" required>
      </div>
      <div class="mb-3">
        <label for="exampleInputTime"class="form-label">Duration</label>
        <input type="text" class="form-control" id="exampleTime"name="Duration" required>
      </div>
      <div class="mb-3">
        <label for="formFile" class="form-label">Upload File</label>
        <input class="form-control" type="file" id="formFile" name="ExamFile" required>
      </div>
       
    <div class ="text-center">
    <input class ="btn btn-primary btn-lg mb-4 mt-4" type="Submit" value="Submit">
    </div>
  </form>
</div> 

</body>
</html>
 