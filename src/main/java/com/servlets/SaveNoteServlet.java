package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.todo;
import com.helper.factoryProvider;


public class SaveNoteServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			String title=request.getParameter("title");  
			String content=request.getParameter("content");
				
			todo td=new todo(title,content,new Date());
			Session s=factoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			s.save(td);
			tx.commit();
			s.close();
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center;'>Note is addded successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View All Notes</h1>");
			}catch(Exception e){
				e.printStackTrace();
			}
	}

}
