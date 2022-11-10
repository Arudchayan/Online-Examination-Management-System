package com.lecturer.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Statement;



import com.lecturer.model.Exam;

public class ExamDao implements ExamDaoInterface{

	public Exam AddExam(String ExamID,String Mcode,String ExamName,String BatchID,String  ExamDate,String  ExamTime,int  Duration,String ExamFile) {
		Exam exam = new Exam();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
            PreparedStatement ps1=con.prepareStatement("insert into Exam(ExamID,Mcode,ExamName,BatchID,ExamDate,ExamTime,Duration,ExamFile) values(?,?,?,?,?,?,?,?)");
            ps1.setString(1,ExamID);
            ps1.setString(2,Mcode);
            ps1.setString(3,ExamName);
            ps1.setString(4,BatchID);
            ps1.setString(5,ExamDate);
            ps1.setString(6,ExamTime);
            ps1.setInt(7,Duration);
            ps1.setString(8,ExamFile);
            ps1.executeUpdate();
            
        }catch(Exception E){
            System.out.println("Error"+E);
        }
		return exam;
		
	}
	public Exam Examlist(String ExamID) {
		
		Exam ex = new Exam();
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");              
        PreparedStatement st = con.prepareStatement("select * from Exam where ExamID=?");
        st.setString(1,ExamID);
        ResultSet rs = st.executeQuery();
        
        while(rs.next()) {
        	ex.setExamID(rs.getString("ExamID"));
        	ex.setMcode(rs.getString("Mcode"));
        	ex.setExamName(rs.getString("ExamName"));
        	ex.setBatchID(rs.getString("BatchID"));
        	ex.setExamDate(rs.getString("ExamDate"));
        	ex.setExamTime(rs.getString("ExamTime"));
        	ex.setDuration(rs.getInt("Duration"));
        	ex.setExamFile(rs.getString("ExamFile"));
        	
            
            
        }  
       
        
    }catch(Exception E){
        System.out.println("Error"+E);
    }
        return ex;
    
    
}
	
	public ArrayList<Exam> selectAllExams() {
		
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");             
	        PreparedStatement st = con.prepareStatement("select * from Exam");
			ArrayList<Exam> exams =new ArrayList<>();
			ResultSet rs =st.executeQuery();
	          		
			while(rs.next() ) {
				Exam exam = new Exam();
	        	exam.setExamID(rs.getString("ExamID"));
	        	exam.setMcode(rs.getString("Mcode"));
	        	exam.setExamName(rs.getString("ExamName"));
	        	exam.setBatchID(rs.getString("BatchID"));
	        	exam.setExamDate(rs.getString("ExamDate"));
	        	exam.setExamTime(rs.getString("ExamTime"));
	        	exam.setDuration(rs.getInt("Duration"));
				
				exams.add(exam);
				
			}
			return exams;
		
	}catch(Exception E){
        System.out.println("Error"+E);
    }
    return new ArrayList<Exam>();
    
}
	 public void DeleteExam(String ExamID) {
	        
	        try {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
	            PreparedStatement ps1=con.prepareStatement("delete from Exam where ExamID=?");
	            ps1.setString(1,ExamID);
	            ps1.execute();
	            
	        }catch(Exception E){
	            System.out.println("Error"+E);
	        }
	        
	        
	    }

	    public Exam UpdateExam(String ExamID, String Mcode, String ExamName, String BatchID, String ExamDate, String ExamTime,int Duration) {
	        Exam ex=new Exam();
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
	            /*Statement st=con.createStatement();
	            ResultSet rs=st.executeQuery("select * from Exam where ExamID="+ExamID);
	            if(rs.next()) {
	                ex.setExamID(rs.getString("ExamID"));
	                ex.setMcode(rs.getString("Mcode"));
	                ex.setExamName(rs.getString("ExamName"));
	                ex.setBatchID(rs.getString("BatchID"));
	                ex.setExamDate(rs.getString("ExamDate"));
	                ex.setExamTime(rs.getString("ExamTime"));
	                ex.setDuration(rs.getInt("Duration"));                                                          
	            }*/
	            
	            PreparedStatement ps1=con.prepareStatement("update Exam set Mcode=?,ExamName=?, BatchID=? , ExamDate=?, ExamTime=?, Duration=? where ExamID=?");
	            ps1.setString(1,Mcode);
	            ps1.setString(2,ExamName);	          
	            ps1.setString(3, BatchID);
	            ps1.setString(4, ExamDate);
	            ps1.setString(5, ExamTime);
	            ps1.setInt(6, Duration);
	            ps1.setString(7,ExamID);
	            ps1.executeUpdate();
	        }catch(Exception E){
	            System.out.println("Error"+E);
	        }
	        return ex;
	        
	    }
}
	 
	 
	 
	 
	 
	
	
	
	
	

