package com.student.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.student.dao.FeedbackDao;

public class stdFeedbackController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession ses = request.getSession();
        String sid=(String) ses.getAttribute("sid");
	    String examID=request.getParameter("examID");
        String subject=request.getParameter("subject");
        String message=request.getParameter("message");
        FeedbackDao dao=new FeedbackDao();
        //run insertFeedback method in FeedbackDao
        dao.insertFeedback(sid,examID,subject,message);
        
        response.sendRedirect("std-feedback.jsp");
	}

}
