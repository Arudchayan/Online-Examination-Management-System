package com.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.student.model.Student;

public class StudentDao implements StudentDaoInterface {
    
    public Student getStudent(Object object) {
        Student s=new Student();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from Student where userId="+object);
            if(rs.next()) {
                s.setUser_id(rs.getInt("userId"));
                s.setSID(rs.getString("SID"));
                s.setSname(rs.getString("Sname"));
                s.setAddress(rs.getString("Address"));
                s.setDOB(rs.getString("dob"));
                s.setNIC(rs.getString("NIC"));
                s.setCID(rs.getString("CID"));
                s.setEmail(rs.getString("email"));
                       
            }
            
        }catch(Exception E){
            System.out.println("Error"+E);
        }
        return s;
        
    }
    
    
    public Student updateStudent(int uid, String sname, String address, String dob) {
        Student s=new Student();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from Student where userId="+uid);
            if(rs.next()) {
                s.setUser_id(rs.getInt("userId"));
                s.setSID(rs.getString("SID"));
                s.setSname(rs.getString("Sname"));
                s.setAddress(rs.getString("Address"));
                s.setDOB(rs.getString("dob"));
                s.setNIC(rs.getString("NIC"));
                s.setCID(rs.getString("CID"));
                s.setEmail(rs.getString("email"));                                           
            }
            
            PreparedStatement ps1=con.prepareStatement("update Student set Sname=?,Address=?, dob=? where userId=?");
            ps1.setString(1, sname);
            ps1.setString(2, address);
            ps1.setString(3, dob);
            ps1.setInt(4, uid);
            ps1.executeUpdate();
        }catch(Exception E){
            System.out.println("Error"+E);
        }
        return s;
        
    }

}
