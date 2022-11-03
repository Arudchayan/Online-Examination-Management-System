<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "com.user.model.User"
	import = "com.user.service.UserServiceImpl"
	import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Student</title>
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
    
    <!-- view users -->
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-4">
          <div class="user-dispaly-box">
            <a href="viewStudent.jsp"><button class="view-btn btn btn-primary">View Student</button></a>
          </div>
        </div>
        <div class="col-4">
          <div class="user-dispaly-box">
            <a href="viewLecturer.jsp"><button class="view-btn btn btn-primary">View Lecturer</button></a>
          </div>
        </div>
        <div class="col-4">
          <div class="user-dispaly-box">
            <a href="viewAdmin.jsp"><button class="view-btn btn btn-primary">View Admin</button></a>
          </div>
        </div>
      </div>
    </div>
    
	<!-- display users -->
	<div class="display-body col-lg-12">
          <table cellpadding="10" class="table table-striped">
              <tr>
                  <td>User Name</td>
                  <td>First Name</td>
                  <td>Last Name</td>
                  <td>Age</td>
                  <td>E-mail</td>
                  <td>Phone Number</td>
                  <td>User Type</td>
              </tr>
              <%
					UserServiceImpl usi = new UserServiceImpl();
					ArrayList<User> list= usi.getUserDetails("Student");
					
					for(User user: list)
					{
			  %>
			  	<tr>
			  		<td><%= user.getId()%></td>
			  		<td><%= user.getFirstName()%></td>
			  		<td><%= user.getLastName()%></td>
			  		<td><%= user.getAge()%></td>
			  		<td><%= user.getE_mail()%></td>
			  		<td><%= user.getpNumber()%></td>
			  		<td><%= user.getUserType()%></td>
			  </tr>
			  <% 
					}
				%>
          </table>
  </div>
  
  <!-- end of page -->
  <div class="end-of-page">
    <a href="adminHome.jsp"><button class="btn btn-primary">Home</button></a>
    <img src="Images/endPage.png" class="end-of-page-img">
    END OF PAGE
  </div>
	
	<!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>