<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/exam1.css">

<title>exam page</title>
<label hidden id="array"></label></div><br>
</head>
<body onload="iterate(); ">
 <div class="alert alert-primary">
      <%session.setAttribute("qnum", (Integer)session.getAttribute("qnum")+1); %>
      <p id="question"><%=request.getAttribute("one") %></p>
    </div>


    <form action="getquestions" method="post">
      <div class="alert alert-info">
        <div class="form-check">
          <input class="form-check-input" type="radio" id="a" name="option" value="A">
          <label class="form-check-label" for="option1" id="a1">
            <%=request.getAttribute("two") %>
          </label>
        </div>
        </div>
      </div>
      <div class="alert alert-info">
        <div class="form-check">
          <input class="form-check-input" type="radio" id="b" name="option" value="B">
          <label class="form-check-label" for="option2" id="a2">
            <%=request.getAttribute("three") %>
          </label>
        </div>
        </div>
      </div>
      <div class="alert alert-info">
        <div class="form-check">
          <input class="form-check-input" type="radio" id="c" name="option" value="C">
          <label class="form-check-label" for="option3" id="a3">
            <%=request.getAttribute("four") %>
          </label>
        </div>
        </div>
      </div>
      <div class="alert alert-info">
        <div class="form-check">
          <input class="form-check-input" type="radio" id="d" name="option" value="D">
          <label class="form-check-label" for="option4" id="a4">
            <%=request.getAttribute("five") %>
          </label>
        </div>
        </div>
      </div>
  
      <button type="submit" class="btn btn-primary" onclick="" id="next">Next Question</button>
    </form>
    
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>