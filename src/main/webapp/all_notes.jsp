   <%@ page import="com.helper.factoryProvider" %>
   <%@ page import="org.hibernate.SessionFactory" %>
   <%@ page import="org.hibernate.Session" %>
   <%@ page import="org.hibernate.Query" %>
    <%@ page import="com.entities.*" %>
     <%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes:Note Taker</title>
 <%@include file="all_js_css.jsp" %>
</head>
<body>
  <div class="container">
   <%@include file="navbar.jsp" %> <br>
   <h1>All Notes</h1>
   
   <div class="row">
   <div class="col-12">
      <%
       Session s=factoryProvider.getFactory().openSession();
       Query q=s.createQuery("From todo");
       List<todo> list=q.list();
      for(todo t:list){
    	  %>
    	  <div class="card mt-3" >
  <img class="card-img-top m-4 mx-auto text-" style="max-width:100px" src="img/pencil.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><%= t.getTitle() %></h5>
    <p class="card-text">
     <%=t.getContent() %>
     </p>
     <div class="container text-center">
     <a href="DeleteServlets?t_id=<%=t.getId() %>" class="btn btn-danger">Delete</a>
          <a href="edit.jsp?t_id=<%=t.getId() %>" class="btn btn-primary">Update</a>
  </div></div>
</div>
    	  <% 
    	 
      }
      s.close();
   %>
   </div>
   </div>
  
   <a ></a>
  </div>
</body>
</html>