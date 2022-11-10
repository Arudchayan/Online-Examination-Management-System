<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delete Module View</title>
    <link rel="stylesheet" href="css/subject.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  </head>
  <body>
  <%
		String userName = (String) session.getAttribute("userNameLogin");
		String fName = (String) session.getAttribute("firstNameLogin");
		if(session.getAttribute("userNameLogin") == null)
			response.sendRedirect("index.jsp");
	%>
    
    <nav class="navbar navbar-expand-lg bg-light">
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
    <h1 align="center">Delete Module</h1>

 <form action="UpdateModule" method="post">
      <div class="container1">
        <div class="row">
            <div class="addExam">
                <table cellspacing="10" cellpadding="3">
                    <tr>
                        <td>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Module code</label>
                                <input type="text"  class="form-control" id="exampleFormControlInput1" name="Mcode" value=<%=request.getAttribute("Mcode") %> disabled>
                            </div>
                        </td>
                        <td>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Module Name</label>
                                <input type="text" class="form-control" id="exampleFormControlInput1" name="Mname" value=<%=request.getAttribute("Mname") %>disabled>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Module Description</label>
                                <input type="text" class="form-control" id="exampleFormControlInput1" name="Mdes" value=<%=request.getAttribute("Mdes") %>disabled>
                            </div>
                        </td>
                        <td>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">No of Credits</label>
                                <input type="Numeric" class="form-control" id="exampleFormControlInput1" name="Mpoints" value=<%=request.getAttribute("Mpoints") %>disabled>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <center>
                                <input type="submit" class="btn btn-primary" >
                            </center>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
      </div>
      </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  </body>
</html>