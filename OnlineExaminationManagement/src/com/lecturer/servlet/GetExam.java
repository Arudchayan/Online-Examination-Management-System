package com.lecturer.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



import com.lecturer.model.ExamDao;
import com.lecturer.model.Exam;

/**
 * Servlet implementation class GetExam
 */
public class GetExam extends HttpServlet {
	    
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String examID=request.getParameter("ExamID");
        System.out.println(examID);
		Exam exam = new Exam();
		ExamDao examdao = new ExamDao();
		exam = examdao.Examlist(examID);
		System.out.println(exam.getExamName());
		request.setAttribute("exam",exam);
		RequestDispatcher dis = getServletContext().getRequestDispatcher("/UpdateExam.jsp");
		dis.forward(request, response);
		
	}
}
