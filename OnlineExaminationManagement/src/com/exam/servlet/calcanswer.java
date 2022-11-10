package com.exam.servlet;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.exam.model.DAO;
import com.mysql.jdbc.PreparedStatement;
import com.student.model.Student;

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
		 sheet1.createRow(0).createCell(0).setCellValue((String)request.getSession().getAttribute("userNameLogin"));
		 for(int x = 0;x<answer.size();x++) {
		 row1 =sheet1.createRow(x+1);
		 row1.createCell(0).setCellValue(answer.get(x));
	   }
		 OutputStream fileOut = null;
		try {
			String userid=(String) request.getSession().getAttribute("userNameLogin");
			String ExamID=(String) request.getSession().getAttribute("examId");
			String FileLocation=userid+ExamID+".xls";
			fileOut = new FileOutputStream("C:\\Users\\PC\\eclipse-workspace\\workspace3\\Online-Examination-Management-System\\OnlineExaminationManagement\\webContent\\examfiles\\"+FileLocation);
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
		DAO Obj = new DAO();
		//String userid=(String) request.getSession().getAttribute("userNameLogin");
		Student s1=new Student();
		s1=(Student)request.getSession().getAttribute("student");
		String userid=s1.getSID();
		String ExamID=(String) request.getSession().getAttribute("examId");
		String FileLocation=userid+ExamID+".xls";
		request.getSession().setAttribute("FileLocation",FileLocation);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");                 
	        String sql="insert into `onlineexaminationmanagement`.`Answer`(`AnswerID`, `ExamID`, `StudentID`, `AnswerFile`, `Marks`) VALUES("+"'"+userid+ExamID+"'"+","+"'"+ExamID+"'"+","+"'"+userid+"'"+","+"'"+FileLocation+"'"+","+"'"+marks+"'"+")";
	        java.sql.PreparedStatement ps = con.prepareStatement(sql);
	        ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    
		
		
		
		
		System.out.println(answer);
		System.out.println(answers);
		
		RequestDispatcher rd = request.getRequestDispatcher("std-results.jsp");
		rd.forward(request, response);
		
}}
