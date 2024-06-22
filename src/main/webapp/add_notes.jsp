<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
  <%@include file="all_js_css.jsp" %>
</head>
<body>
  <div class="container-fluid p-0 m-0">
       <%@include file="navbar.jsp" %>
       <br>
       <h1>Please fill your note detail </h1>
       <form action="SaveNoteServlet" method="post">
  <div class="form-group">
    <label for="title">Note title</label>
    <input type="text" name="title"class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter here">
  </div>
  <div class="form-group">
    <label for="Content">Note Content</label>
    <textarea name="content" id="Content" placeholder="Enter your content here" 
    class="form-control" style="height:250px" required></textarea>
  </div>
 
  <div class="container text-center">
  <button type="submit" class="btn btn-primary">Add</button>
  </div>
  
</form>
   </div>
</body>
</html>