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
		int uid=(int) ses.getAttribute("userNameLogin");
        StudentDao dao=new StudentDao();
        Student s1=dao.getStudent(uid);      
        ses.setAttribute("student", s1);
        response.sendRedirect("student-index.jsp");
	}

}
