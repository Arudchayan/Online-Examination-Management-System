package com.exam.servlet;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/CalcAnswer")
/**
 * Servlet implementation class calcanswer
 */
public class calcanswer extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("qnum");
		ArrayList <String> answer = (ArrayList<String>) request.getSession().getAttribute("answer");
		ArrayList <String> answers =(ArrayList<String>) request.getSession().getAttribute("answers");
		request.getSession().removeAttribute("answer");
		request.getSession().removeAttribute("answers");
		answer.remove(0);
		//ADDING ANSWER TO EXCEL
		 XSSFWorkbook wb1 = new XSSFWorkbook();
		 XSSFSheet sheet1 = wb1.createSheet("Sheet 1");
		 Row row1;
		 sheet1.createRow(0).createCell(0).setCellValue("Student ID");
		 for(int x = 0;x<answer.size();x++) {
		 row1 =sheet1.createRow(x+1);
		 row1.createCell(0).setCellValue(answer.get(x));
	   }
		 OutputStream fileOut = null;
		try {
			//String user=(String) request.getSession().getAttribute("user");
			//String ExamID=(String) request.getSession().getAttribute("ExamID");
			//String FileLocation=user+ExamID+".xls";
			//fileOut = new FileOutputStream("C:\\Users\\PC\\eclipse-workspace\\Exam\\examfiles\\"+FileLocation);
			fileOut = new FileOutputStream("C:\\Users\\PC\\eclipse-workspace\\workspace 2\\OnlineExaminationManagement\\webContent\\"+answer+".xls");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			wb1.write(fileOut);
			wb1.close();   
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		float marks = 0;
		for(int x=0;x<answers.size();x++) 
		{ 
			if(((answer.get(x)).equals(answers.get(x)))) {
				marks++;
			}
		}
		marks=(marks/answers.size())*100;
		request.setAttribute("marks", marks);
		//DAO Obj = new DAO();
		//ResultSet rs =Obj.execute("insert into Answer values("userid+examid","examid","userid","FileLocation","marks");");
		
		
		System.out.println(answer);
		System.out.println(answers);
		
		RequestDispatcher rd = request.getRequestDispatcher("marks.jsp");
		rd.forward(request, response);
		
}}
