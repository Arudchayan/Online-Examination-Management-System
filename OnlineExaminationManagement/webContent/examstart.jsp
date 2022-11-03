<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="  ">
<p class="text-center" >
 <div class="panel panel-default">
      <div class="panel-heading text-center">Exam Title</div>
      <div class="panel-body"><pre class="lh-1 mw-100 mh-100 align-items-center justify-content-center bd-callout">A Terms and Conditions is not required and it's not mandatory by law.

Unlike Privacy Policies, which are required by laws such as the GDPR, CalOPPA and many others, there's no law or regulation on Terms and Conditions.

However, having a Terms and Conditions gives you the right to terminate the access of abusive users or to terminate the access to users who do not follow your rules and guidelines, as well as other desirable business benefits.

It's extremely important to have this agreement if you operate a SaaS app.

Here are a few examples of how this agreement can help you:

If users abuse your website or mobile app in any way, you can terminate their account. Your "Termination" clause can inform users that their accounts would be terminated if they abuse your service.
If users can post content on your website or mobile app (create content and share it on your platform), you can remove any content they created if it infringes copyright. 
Your Terms and Conditions will inform users that they can only create and/or share content they own rights to. 
Similarly, if users can register for an account and choose a username, you can inform users that they are not allowed to choose usernames that may infringe trademarks, i.e. usernames like Google, Facebook, and so on.
If you sell products or services, you could cancel specific orders if a product price is incorrect. Your Terms and Conditions can include a clause to inform users that certain orders, at your sole discretion, can be canceled if the products ordered have incorrect prices due to various errors.
And many more examples.</pre></div>
    <br>
    <div class="bd-callout bd-callout-warning ">
    
    <div class="form-check form-switch justify-content-center d-grid gap-2">
  <div><input class="form-check-input " type="checkbox" role="switch" id="flexSwitchCheckDefault">
  <label class="form-check-label " for="flexSwitchCheckDefault"><strong>Accept Terms and Conditions</strong></label>
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