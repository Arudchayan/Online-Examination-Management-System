package com.student.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.student.dao.StudentDao;


public class EditStudentController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession();
		int uid=(int) ses.getAttribute("uid");
        String sname=request.getParameter("sname");
        String address=request.getParameter("address");
        String dob=request.getParameter("dob");
        StudentDao dao=new StudentDao();
        //run updateStudent method in studentDao
        dao.updateStudent(uid,sname,address,dob);
        
        response.sendRedirect("GetStudentController");
	}

}
