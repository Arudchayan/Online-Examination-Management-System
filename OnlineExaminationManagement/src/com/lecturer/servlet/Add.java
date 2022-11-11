package com.lecturer.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.lecturer.model.ExamDao;

@MultipartConfig

public class Add extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String examID=request.getParameter("ExamID");
        String Mcode=request.getParameter("Mcode");
        String ExamName=request.getParameter("ExamName");
        String BatchID=request.getParameter("BatchID");
        String ExamDate=request.getParameter("ExamDate");
        String ExamTime=request.getParameter("ExamTime");
        int Duration=Integer.parseInt(request.getParameter("Duration"));
        Part part =request.getPart("ExamFile");
        String ExamFile=part.getSubmittedFileName();
        String path = getServletContext().getRealPath("/"+"examfiles"+File.separator+ExamFile);
        InputStream is = part.getInputStream();
        boolean succs = UploadFile(is,path);
        if(succs) {
        	System.out.println("File Uploaded to this directory:"+path);
        	
        }else {
        	System.out.println("error");
        }
        
        
        ExamDao edao=new ExamDao();
        edao.AddExam(examID, Mcode, ExamName, BatchID, ExamDate, ExamTime, Duration, ExamFile);
        
        
        response.sendRedirect("ExamList.jsp");
        
        
	}
	public boolean UploadFile(InputStream is,String path) {
		boolean test =false;
		try {
			byte[] byt = new byte[is.available()];
			is.read();
			FileOutputStream fops = new FileOutputStream(path);
			fops.write(byt);
			fops.flush();
			fops.close();
			test = true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return test;
		
	}

}
