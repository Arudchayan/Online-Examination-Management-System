package com.student.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.student.dao.FeedbackDao;


public class deleteFBController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession ses = request.getSession();
	    int mid=(int) ses.getAttribute("mid");
        FeedbackDao dao=new FeedbackDao();
        //run deleteFeedback method in FeedbackDao an passing mid as parameter
        dao.deleteFeedback(mid);
        
        response.sendRedirect("std-feedback.jsp");
	}

}
