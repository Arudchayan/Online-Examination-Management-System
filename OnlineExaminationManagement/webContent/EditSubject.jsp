<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/admin.css">
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
   <div class="container">
        <div class="row">
            <div class="col-lg-6">
              <div class="image-container">
                <img src="Images/edit.png" class="image-img">
              </div>
            </div>
            <div class="col-lg-6">
              <div class="input-container">
                <div class="inputInner-container">
                  <p class="input-title">Edit Module</p>
                  <form action="EditSubjectServlet" method="post" name="userValidation" onSubmit="return userNameValidation(this)">
                    <div class="user-input">
                      <label class="input-label">Module Code</label>
                      <input type="text" name="Mcode" class="form-control" maxlength="6">
                    </div>
                    <input type="submit" class="input-btn btn btn-primary" value="Edit Module">
                  </form>
                  <span id="errormes" class="text-danger"></span>
                </div>
              </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  </body>
</html>