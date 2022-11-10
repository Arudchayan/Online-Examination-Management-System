package com.module.dao;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.xdevapi.Statement;

public class ModuleDAO implements ModuleDAOInterface{
	public void setModule(String Mcode,String Mname,String Mdes,String Mpoints) {
		try {
			int mpoint=Integer.parseInt(Mpoints);
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
            PreparedStatement ps1=con.prepareStatement("INSERT INTO module(Mcode,Mname,M_Description,NoOfCredits) VALUES(?,?,?,?)");
            ps1.setString(1,Mcode);
            ps1.setString(2,Mname);
            ps1.setString(3,Mdes);
            ps1.setInt(4,mpoint);
            ps1.executeUpdate();
            
        }catch(Exception E){
            System.out.println("Error"+E);
        }
		
	}
	
	public ResultSet execute(String sql) {
		String url="jdbc:mysql://localhost:3306/onlineexaminationmanagement";
		String username ="root";
		String password="password";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			java.sql.Statement st=con.createStatement();
			ResultSet rs;
			rs=st.executeQuery(sql);
			return(rs);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}

	public void updateModule(String Mcode, String Mname, String Mdes, String Mpoints) {
		// TODO Auto-generated method stub
		try {
			int mpoint=Integer.parseInt(Mpoints);
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
            PreparedStatement ps1=con.prepareStatement("Update module set Mcode=?,Mname=?,M_Description=?,NoOfCredits=? where (Mcode=?)");
            ps1.setString(1,Mcode);
            ps1.setString(2,Mname);
            ps1.setString(3,Mdes);
            ps1.setInt(4,mpoint);
            ps1.setString(5, Mcode);
            ps1.executeUpdate();
            
        }catch(Exception E){
            System.out.println("Error"+E);
        }
		
	}
	public void DeleteModule(String Mcode) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");
            PreparedStatement ps1=con.prepareStatement("DELETE FROM module where Mcode=?");
            ps1.setString(1,Mcode);
            ps1.executeUpdate();
            
        }catch(Exception E){
            System.out.println("Error"+E);
        }
		
	}
	
		}



