package com.student.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.student.dao.StudentDao;
import com.student.model.Student;


public class GetStudentController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession();
		String uid=(String) ses.getAttribute("userNameLogin");
        StudentDao dao=new StudentDao();
        
        //run getStudent method in studentDao to get student details and store in s1 object
        
        Student s1=dao.getStudent(uid);    
        
        //object s1 is added to session so can access this object from other pages
        ses.setAttribute("student", s1);
        response.sendRedirect("student-index.jsp");
	}

}
