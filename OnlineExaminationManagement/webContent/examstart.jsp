<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
		String userName = (String) session.getAttribute("userNameLogin");
		String fName = (String) session.getAttribute("firstNameLogin");
		if(session.getAttribute("userNameLogin") == null)
			response.sendRedirect("index.jsp");
	%>
<!-- Bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Exam Page</title>
</head>
<body class="  ">
<p class="text-center" >
 <div class="panel panel-default">
      <div class="panel-heading text-center"><%request.getSession().getAttribute("examId"); %></div>
      <div class="panel-body"><pre class="lh-1 mw-100 mh-100 align-items-center justify-content-center bd-callout">Exam will begin now.</pre></div>
      <p>Please read the following guidelines :1)Read all Questions carefully.</p><p>2)Beware about the TIME constraint.</p><p>3)Call an examiner for any clarifications.</p><p>4)Do not cheat or perform any Illegal activities.</p>
    <br>
    <div class="bd-callout bd-callout-warning ">
    
    <div class="form-check form-switch justify-content-center d-grid gap-2">
  
  </div><div>
  <form action="getquestions" method="post">
 	<input type="number" name="qnum" hidden value=0>
 	<input type="Text" name="option" hidden value="X">
  <button type="submit" class="btn btn-success p-2 row"  >START EXAM</button>
  </form>
</div></div>
</div>
</div>

    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>


</body>
</html>