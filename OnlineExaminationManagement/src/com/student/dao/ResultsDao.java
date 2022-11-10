package com.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.student.model.Results;

public class ResultsDao implements ResultsDaoInterface {
    public List<Results> getResults(String sid) {
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");               
        PreparedStatement st = con.prepareStatement("select a.AnswerID,a.ExamID,e.ExamName,e.ExamDate,e.ExamTime,e.Duration,a.Marks from answer a,exam e where a.ExamID=e.ExamID AND a.StudentID=?");
        st.setString(1,sid);
        ResultSet rs = st.executeQuery();
        //To fetch multiple records 
        List<Results> result = new ArrayList<>();
        while(rs.next()) {
            Results item = new Results();   
            item.setAnswerID(rs.getString("AnswerID"));
            item.setExamID(rs.getString("ExamID"));
            item.setExamName(rs.getString("ExamName"));
            item.setExamDate(rs.getString("ExamDate"));
            item.setExamTime(rs.getString("ExamTime"));
            item.setDuration(rs.getInt("Duration"));
            item.setMarks(rs.getInt("Marks"));
            
            result.add(item);
        }  
        return result;
        
    }catch(Exception E){
        System.out.println("Error"+E);
    }
    return new ArrayList<Results>();
    
}

}
