<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User View</title>
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
	<%
		String userId = (String) session.getAttribute("userName");
		String firstName = (String) session.getAttribute("firstName");
		String lastName = (String)session.getAttribute("lastName");
		int age = (Integer)session.getAttribute("age");
		String password = (String)session.getAttribute("passwd");
		String email = (String)session.getAttribute("email");
		int pNumber = (Integer)session.getAttribute("phoneNumber");
		String userType = (String)session.getAttribute("userType");
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
    
    <!-- view edit user body -->
    <div class="container">
        <div class="row  justify-content-center">
            <div class="CRUD-body col-lg-12">
                <form action="UpdateUserServlet" method="post" name="editValidation" onSubmit="return editFormValidation(this)">
                    <table cellpadding="15">
                        <tr>
                            <td colspan="2">
                                <center>
                                    <div class="user-input">
                                        <label class="input-label">Update User</label>
                                        <input type="text" name="userId" value="<%= userId %>" class="hide-input form-control">
                                    </div>
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">First Name</label>
                                    <input type="text" name="fName" value="<%= firstName%>" class="form-control">
                                </div>
                            </td>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Last Name</label>
                                    <input type="text" name="lName" value="<%= lastName%>" class="form-control">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Password</label>
                                    <input type="password" name="passwd" value="<%= password%>" maxlength="20" class="form-control">
                                </div>
                            </td>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Re-Enter Password</label>
                                    <input type="password" name="repass" value="<%= password%>" maxlength="20" class="form-control">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Age</label>
                                    <input type="text" name="age" value="<%= age%>" class="form-control">
                                </div>
                            </td>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">E-mail</label>
                                    <input type="text" name="email" value="<%= email%>" class="form-control">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Phone Number</label>
                                    <input type="text" name="pNum" value="<%= pNumber%>" maxlength="9" class="form-control">
                                </div>
                            </td>
                            <td>
                            	<div class="user-input">
                                    <label class="input-label">User Type</label>
                                    <input type="text" name="userType" value="<%= userType%>" class="form-control" disabled>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                        <input type="submit" value="Edit User" class="input-btn btn btn-primary">
                                </center>
                            </td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        		<center>
                        			<span id="errormes" class="text-danger"></span>
                        		</center>
                        	</td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!--  Validation js -->
    <script rel="javascript" src="js/editFormValidation.js"></script>
</body>
</html>