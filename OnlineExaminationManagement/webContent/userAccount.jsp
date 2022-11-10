<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "com.user.model.User, com.user.service.UserServiceImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Account</title>
<!-- Bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- login css -->
<link rel="stylesheet" href="css/admin.css">
</head>
<body>

	<%
		String userName = (String) session.getAttribute("userNameLogin");
		String fName = (String) session.getAttribute("firstNameLogin");
		String lastName = (String)session.getAttribute("lastNameLogin");
		int age = (Integer)session.getAttribute("ageLogin");
		String email = (String)session.getAttribute("emailLogin");
		int pNumber = (Integer)session.getAttribute("phoneNumberLogin");
		String userType = (String)session.getAttribute("userTypeLogin");
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
    
    <!-- view delete user body -->
    <div class="container">
        <div class="row  justify-content-center">
            <div class="CRUD-body col-lg-12">
                    <table cellpadding="15">
                        <tr>
                            <td colspan="2">
                                <center>
                                    <div class="user-input">
                                        <label class="input-label">User Name</label>
                                        <input type="text" value="<%= userName %>" class="form-control" disabled>
                                    </div>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">First Name</label>
                                    <input type="text" value="<%= fName%>" class="form-control" disabled>
                                </div>
                            </td>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Last Name</label>
                                    <input type="text" value="<%= lastName%>" class="form-control" disabled>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Age</label>
                                    <input type="text" value="<%= age%>" class="form-control" disabled>
                                </div>
                            </td>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">E-mail</label>
                                    <input type="text" value="<%= email%>" class="form-control" disabled>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Phone Number</label>
                                    <input type="text" value="<%= pNumber%>" class="form-control" disabled>
                                </div>
                            </td>
                            <td>
                            	<div class="user-input">
                                    <label class="input-label">User Type</label>
                                    <input type="text" value="<%= userType%>" class="form-control"  disabled>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                        <a href="adminHome.jsp"><button class="btn btn-primary">Home</button></a>
                                </center>
                            </td>
                        </tr>
                    </table>
            </div>
        </div>
    </div>
	<!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>