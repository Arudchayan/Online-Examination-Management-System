<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet" href="css/exam.css">

<title>exam page</title>
<label hidden id="array"></label></div><br>
</head>
<body onload="iterate(); ">
<div class="quiz_box">
<div class="question">
<%session.setAttribute("qnum", (Integer)session.getAttribute("qnum")+1); %>
<p id="question"><%=request.getAttribute("one") %></p>

</div>
<form action="getquestions" method="post">
<div class="answer_list">


<div class="answer">
<input type="radio" id="a" name="option" value="A">
<label for="option1" id="a1"><%=request.getAttribute("two") %></label></div><br>

<div class="answer">
<input type="radio" id="b" name="option" value="B">
<label for="option2"  id="a2"><%=request.getAttribute("three") %></label></div><br>

<div class="answer">
<input type="radio" id="c" name="option" value="C">
<label for="option3"  id="a3"><%=request.getAttribute("four") %></label></div><br>

<div class="answer">
<input type="radio" id="d" name="option" value="D">
<label for="option4"  id="a4"><%=request.getAttribute("five") %></label></div>

</div>

<div class="end">
<div class="buttons">
<button type="submit" class= "next_question" onclick="" id="next">Next Question</button>
</form>
</div>

</div>
</div>

</body>
</html>