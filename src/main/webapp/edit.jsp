<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.helper.factoryProvider" %>
         <%@ page import="com.entities.*" %>
           <%@ page import="org.hibernate.Session" %>
   <%@ page import="org.hibernate.SessionFactory" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container-fluid p-0 m-0">`
       <%@include file="navbar.jsp" %>
   </div>
   <h2>This is edit page</h2>
   <%
   int tid=Integer.parseInt(request.getParameter("t_id").trim());
   Session s=factoryProvider.getFactory().openSession();
   todo t=(todo)s.get(todo.class,tid);
   %>
       <form action="UpdateServlet" method="post">
       <input  name="tid"value="<%=t.getId() %>" type="hidden"/>
  <div class="form-group">
    <label for="title" >Note title</label>
    <input type="text" name="title"class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter here" value="<%=t.getTitle() %>">
  </div>
  <div class="form-group">
    <label for="Content">Note Content</label>
    <textarea name="content" id="Content" placeholder="Enter your content here" 
    class="form-control"style="height:250px" required> <%=t.getContent() %></textarea>
  </div>
 
  <div class="container text-center">
  <button type="submit" class="btn btn-success">Update</button>
  </div>
  
</form>
</body>
</html>