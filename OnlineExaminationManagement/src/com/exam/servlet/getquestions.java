package com.exam.servlet;


import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.exam.model.DAO;
@WebServlet("/GetQuestions")
/**
 * Servlet implementation class getquestions
 */

public class getquestions extends HttpServlet{
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//DATABASE FILE LOCATION ACCESS
		DAO Obj = new DAO();
		String examid=(String) request.getSession().getAttribute("examId");
		String sql="select ExamTime,Duration from exam where examid ="+"'"+examid+"'";
		ResultSet rs = Obj.execute(sql);
		try {
			rs.next();
			Time starttime =rs.getTime("ExamTime");
			LocalTime endtime =starttime.toLocalTime();
			endtime=endtime.plusSeconds(rs.getInt("Duration"));
			LocalTime currenttime = LocalTime.now();
			int seconds=(int) currenttime.until(endtime,ChronoUnit.SECONDS);
			request.getSession().setAttribute("seconds",seconds);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		rs =Obj.execute("select * from exam where ExamId="+"'"+examid+"'");
		try {
			rs.next();
			String filename=rs.getString("ExamFile");
			String FileLocation="C:\\Users\\PC\\eclipse-workspace\\workspace3\\Online-Examination-Management-System\\OnlineExaminationManagement\\webContent\\examfiles\\"+filename;
		
		//GETTING QUESTIONS AND ANSWERS FROM EXCEL SHEET
		FileInputStream file = new FileInputStream(new File(FileLocation));
		XSSFWorkbook wb= new XSSFWorkbook(file);
		XSSFSheet sheet = wb.getSheetAt(0);
		ArrayList<ArrayList<String> > questions = new ArrayList<ArrayList<String> >();
		Integer r = 0,c = 0;
		for (Row row : sheet) {
			questions.add(new ArrayList<String>());
	        for (Cell cell : row) {
	        	switch(String.valueOf(cell.getCellType())) {
	        	case "STRING":
	        		
	        		questions.get(r).add(c, String.valueOf(cell.getStringCellValue()));
	        		break;
	        	case "NUMERIC":
	        		
	        		questions.get(r).add(c, String.valueOf(cell.getNumericCellValue()));
	        		break;
	        	
	        	default:
	        		questions.get(r).add(c, String.valueOf(cell.getBooleanCellValue()));
	        		break;
	        	}
	        	c=c+1;
	        	
	        }
	        r=r+1;
	        c=0;
	    }
		wb.close();
		
		//REMOVING FIRST ROW
		questions.remove(0);
		
		//ARRAY TO HOLD ANSWERS
		ArrayList<String> answers= new ArrayList<String>();
		
		//SPLITTING 2 DIMENSIONAL ARRAY INTO QUESTIONS AND ANSWERS
		for (ArrayList<String> ans : questions) {
			answers.add(ans.get(5));
			questions.get(c).remove(5);
			c=c+1;
		}
		//NUMBER COUNTER FOR CURRENT QUESTION
		Integer qnum=null;
		//ARRAY TO SAVE ANSWER INPUT
		ArrayList<String> answer = new ArrayList<String>();

		//SETTING CURRENT QUESTION
		if(request.getParameter("qnum")==null) {
			//FIRST QUESTION
		 qnum =(Integer)(request.getSession().getAttribute("qnum"));
		}else {
			//SECOND AND ONWARDS
		 qnum =Integer.parseInt(request.getParameter("qnum"));
		}
		//SAVING STUDENT ANSWER
		 if(request.getSession().getAttribute("answer")==null) {
		
			 //FIRST VALUE OF ARRAY ANSWER WILL BE X,SHOULD BE DISCARDED
		 answer.add((String)request.getParameter("option"));
		 
		 //CREATING NEW ANSWER SESSION
		 request.getSession().setAttribute("answer", answer);
		
		 }
		 else {
			 //CASTING SESSION ANSWERS TO EMPTY ANSWER ARRAYLIST
			 answer=(ArrayList<String>) request.getSession().getAttribute("answer");
			 //GETTING ANSWER FROM CHECKED BOX
			 answer.add((String)request.getParameter("option"));
			
			 //SETTING UPDATED ANSWER
			 request.getSession().setAttribute("answer", answer);
			 //SETTING ACTUAL ANSWER
			 request.getSession().setAttribute("answers", answers);
			
		 }
		RequestDispatcher rd;
		request.setAttribute("numq", questions.size());
		if(qnum==questions.size()) {
			//AFTER LAST QUESTION
		rd = request.getRequestDispatcher("calcanswer");
		rd.forward(request, response);	
		 }
		else {
			//SETTING QUESTION
		request.getSession().setAttribute("qnum", qnum);
		ArrayList <String> question = questions.get(qnum);
		request.setAttribute("one", question.get(0));
		request.setAttribute("two", question.get(1));
		request.setAttribute("three", question.get(2));
		request.setAttribute("four", question.get(3));
		request.setAttribute("five", question.get(4));
	    rd = request.getRequestDispatcher("exam.jsp");
	    rd.forward(request, response);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}


