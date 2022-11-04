package com.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.student.model.Exam;

public class ExamDao {
    public List<Exam> getExam(String sid) {
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");                 
        PreparedStatement st = con.prepareStatement("select e.ExamID,e.Mcode,e.ExamName,e.ExamDate,e.ExamTime,e.Duration from exam e, batch b, student s where s.SID=b.SID AND b.BatchID=e.BatchID AND s.SID=? AND e.ExamDate="+java.time.LocalDate.now());
        st.setString(1,sid);
        ResultSet rs = st.executeQuery();
        List<Exam> ex = new ArrayList<>();
        while(rs.next()) {
            Exam item = new Exam();   
            item.setExamID(rs.getString("ExamID"));
            item.setMcode(rs.getString("Mcode"));
            item.setExamName(rs.getString("ExamName"));
            item.setExamDate(rs.getString("ExamDate"));
            item.setExamTime(rs.getString("ExamTime"));
            item.setDuration(rs.getInt("Duration"));
            
            ex.add(item);
        }  
        return ex;
        
    }catch(Exception E){
        System.out.println("Error"+E);
    }
    return new ArrayList<Exam>();
    
}

}
