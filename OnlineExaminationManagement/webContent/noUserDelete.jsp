<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>No User</title>
<!-- Bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Admin css -->
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
    
    <!-- no-user body -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <p class="no-user-message text-center">USER NOT FOUND </p>
                <a href="deleteUser.jsp"><button class="re-enter-btn btn btn-primary">Re Enter </button></a>
                <a href="adminHome.jsp"><button class="re-enter-cancel-btn btn btn-secondary">Cancel</button></a><br>
                <img src="Images/no-user.png" class="no-user-img">
            </div>
        </div>
    </div>
    
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>