<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<!-- Bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Admin css -->
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="image-container">
					<img src="Images/login.png" class="image-img">
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login-container">
					<div class="loginInner-container">
						<p class="login-title">Login</p>
						<form action="Login" method="post" name="loginVal" onSubmit="return userNameValidation(this)">
							<div class="user-input">
								<label class="input-label">User Name</label> <input type="text"
									class="form-control" name="userName" placeholder="000000" maxlength="6">
							</div>
							<div class="user-input">
								<label class="input-label">Password</label> <input
									type="password" class="form-control" name="passwd"
									placeholder="******************">
							</div>
							<input type="submit" class="login-btn btn btn-primary"
								value="Login">
						</form>
						<span class="text-danger">${errorMsg}</span><span id="errormes" class="text-danger"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 
	<form action="Login" method="post">
		User Name : <input type = "text" name="userName"><br>
		Password : <input type = "text" name = "passwd"><br>
		<input type = "submit" value = "Login">
	</form> -->
	<!-- Bootstrap js -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!--  validation js -->
	<script rel="javascript" src="js/loginValidation.js"></script>
</body>
</html>