<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create User</title>
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
    
    <!-- create user body -->
    <div class="container">
        <div class="row  justify-content-center">
            <div class="CRUD-body col-lg-12">
                <form action="AddUserServlet" method="post" name="addValidation" onSubmit="return addFormValidation(this)">
                    <table cellpadding="15">
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label" >First Name</label>
                                    <input type="text" name="fName" class="form-control">
                                </div>
                            </td>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Last Name</label>
                                    <input type="text" name="lName" class="form-control">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Password</label>
                                    <input type="password" name="passwd" class="form-control" maxlength="20">
                                </div>
                            </td>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Re-Enter Password</label>
                                    <input type="password" name="repass" class="form-control" maxlength="20">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Age</label>
                                    <input type="text" name="age" class="form-control">
                                </div>
                            </td>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">E-mail</label>
                                    <input type="text" name="email" class="form-control">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-input">
                                    <label class="input-label">Phone Number</label>
                                    <input type="text" name="pNumber" class="form-control" maxlength="9">
                                </div>
                            </td>
                            <td>
                                <div class="col-md-4">
                                <label class="input-label">Type</label>
                                <select class="form-select" name="userType">
                                <option selected value="Student">Student</option>
                                <option value="Lecturer">Lecturer</option>
                                <option value="Admin">Admin</option>
                                </select>
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                        <input type="submit" value="Add User" class="input-btn btn btn-primary">
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

<!-- <form action="AddUserServlet" method="post">
	first name <input type="text" name="fName"><br>
	last name <input type="text" name="lName"><br>
	password <input type="password" name="passwd"><br>
	age <input type="text" name="age"><br>
	email <input type="text" name="email"><br>
	phone number <input type="pNum" name="pNum"><br>
	<select name="userType">
		<option value="Student">Student</option>
		<option value="Profecor">prof</optiont>
		<option value="Admin">admin</option>
	</select>
	<input type="submit" value="Add user">
</form> -->

	<!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Validation js  -->
    <script rel="javascript" src="js/addFormValidation.js"></script>
</body>
</html>