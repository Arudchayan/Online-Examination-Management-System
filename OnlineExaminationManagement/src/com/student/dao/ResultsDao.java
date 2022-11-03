package com.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.student.model.Results;

public class ResultsDao {
    public List<Results> getResults(String sid) {
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examsystem","root","");               
        PreparedStatement st = con.prepareStatement("select r.Mcode,m.Mname ,r.Grade from results r, module m where r.Mcode=m.Mcode AND SID=?");
        st.setString(1,sid);
        ResultSet rs = st.executeQuery();
        List<Results> result = new ArrayList<>();
        while(rs.next()) {
            Results item = new Results();   
            item.setMcode(rs.getString("Mcode"));
            item.setMname(rs.getString("Mname"));
            item.setGrade(rs.getString("Grade"));
            
            result.add(item);
        }  
        return result;
        
    }catch(Exception E){
        System.out.println("Error"+E);
    }
    return new ArrayList<Results>();
    
}

}
