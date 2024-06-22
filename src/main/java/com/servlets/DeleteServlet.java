package com.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.todo;
import com.helper.factoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	    	 int tid=Integer.parseInt(request.getParameter("t_id").trim());
	    	Session s=factoryProvider.getFactory().openSession();
	    	 Transaction tx=s.beginTransaction();
	    	todo t=(todo)s.get(todo.class,tid);
	    	 s.delete(t);
	    	 tx.commit();
	    	 s.close();
	    	 response.sendRedirect("all_notes.jsp");
	     }catch(Exception e) {
	    	 
	     }
	}

	
}
