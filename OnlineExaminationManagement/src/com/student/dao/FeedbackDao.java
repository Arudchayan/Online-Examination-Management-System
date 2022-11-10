package com.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.student.model.Feedback;

public class FeedbackDao implements FeedbackDaoInterface {
    
    public Feedback insertFeedback(String sid,String examID,String subject,String content) {
        Feedback fd=new Feedback();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
            PreparedStatement ps1=con.prepareStatement("insert into Feedback(SID,ExamID,Subject,Content) values(?,?,?,?)");
            ps1.setString(1,sid);
            ps1.setString(2,examID);
            ps1.setString(3,subject);
            ps1.setString(4,content);
            ps1.executeUpdate();
            
        }catch(Exception E){
            System.out.println("Error"+E);
        }
        return fd;
        
    }
    
    public List<Feedback> getFeedback(String sid) {
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");               
            PreparedStatement st = con.prepareStatement("select * from Feedback where SID=?");
            st.setString(1,sid);
            ResultSet rs = st.executeQuery();
            List<Feedback> fd = new ArrayList<>();
            while(rs.next()) {
                Feedback item = new Feedback();   
                item.setMessageID(rs.getInt("MessageID"));
                item.setSID(rs.getString("SID"));
                item.setDate(rs.getString("Date"));
                item.setExamID(rs.getString("ExamID"));
                item.setSubject(rs.getString("Subject"));
                item.setContent(rs.getString("Content"));
                
                fd.add(item);
            }  
            return fd;
            
        }catch(Exception E){
            System.out.println("Error"+E);
        }
        return new ArrayList<Feedback>();
        
    }
    
    public Feedback deleteFeedback(int mid) {
        Feedback fd=new Feedback();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
            PreparedStatement ps1=con.prepareStatement("delete from Feedback where MessageID=?");
            ps1.setInt(1,mid);
            ps1.executeUpdate();
            
        }catch(Exception E){
            System.out.println("Error"+E);
        }
        return fd;
        
    }

}
