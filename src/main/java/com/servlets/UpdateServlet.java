package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.todo;
import com.helper.factoryProvider;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	int tid=Integer.parseInt(request.getParameter("tid").trim());
        	String title=request.getParameter("title");
        	String content=request.getParameter("content");
        	Session s=factoryProvider.getFactory().openSession();
        	Transaction tx=s.beginTransaction();
        	todo t=s.get(todo.class, tid);
        	t.setTitle(title);
        	t.setAddedDate(new Date());
        	t.setContent(content);
        	
        	
        	tx.commit();
        	s.close();
        	
        	response.sendRedirect("all_notes.jsp");
        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
	}

}
