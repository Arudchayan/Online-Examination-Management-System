<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View User</title>
<!-- Bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- login css -->
<link rel="stylesheet" href="css/admin.css">
</head>
<body>
	<%
		String userName = (String) session.getAttribute("userNameLogin");
		String fName = (String) session.getAttribute("firstNameLogin");
		if(session.getAttribute("userNameLogin") == null)
			response.sendRedirect("index.jsp");
	%>
	
	<!-- nav bar -->
    <nav class="navbar navbar-expand-lg bg-light">
      <div class="container-fluid">
        <a href="userAccount.jsp"><button class="user-btn btn btn-outline-secondary"><%out.println(fName); %>(<%out.println(userName); %>)</button></a>
        <div class="collapse navbar-collapse">
          <ul class="navbar-nav m-auto mb-2">
          	<li class="nav-item">
              <a class="nav-link" href="adminHome.jsp">HOME</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="addUser.jsp">CREATE USER</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="viewUser.jsp">VIEW USER</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="editUser.jsp">EDIT USER</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="deleteUser.jsp">DELETE USER</a>
            </li>
          </ul>
          <form action="Logout" method="post">
            <input type="submit" class="btn btn-primary" value="Logout">
          </form>
        </div>
      </div>
    </nav>
    
    <!-- view user body -->
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
              <div class="image-container">
                <img src="Images/view.png" class="image-img">
              </div>
            </div>
            <div class="col-lg-6">
              <div class="input-container">
                <div class="inputInner-container">
                  <p class="input-title">View User</p>
                  <form action="ViewUserServlet" method="post" name="userValidation" onSubmit="return userNameValidation(this)">
                    <div class="user-input">
                      <label class="input-label">User Name</label>
                      <input type="text" name="userName" class="form-control" maxlength="6">
                    </div>
                    <input type="submit" class="input-btn btn btn-primary" value="View User">
                  </form>
                  <span id="errormes" class="text-danger"></span>
                </div>
              </div>
            </div>
        </div>
    </div>
	
	<!--  <form action="ViewUserServlet" method="post">
		userName <input type="text" name="userId"><br>
		<input type="submit" value="view">
	</form>-->
	
	<!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!--  Validation js -->
    <script rel="javascript" src="js/userNameValidation.js"></script>
</body>
</html>