package com.lecturer.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.lecturer.model.ExamDao;

/**
 * Servlet implementation class Delete
 */
public class Delete extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   // int mid=(int) ses.getAttribute("mid");
		String examID=request.getParameter("ExamID");
		
		ExamDao dao=new ExamDao();
        dao.DeleteExam(examID);
        System.out.println(examID);
		
         
        response.sendRedirect("ExamList.jsp");
	}

}