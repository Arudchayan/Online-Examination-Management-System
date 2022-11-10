package com.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.student.model.Module;

public class ModuleDao implements ModuleDaoInterface{
    public List<Module> getModule(String sid) {
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexaminationmanagement","root","password");               
        PreparedStatement st = con.prepareStatement("select m.Mcode,m.Mname,m.M_Description,m.NoOfCredits from Student s, Module m, Offers o, Course c where s.CID=c.CID AND c.CID=o.CID AND m.Mcode=o.Mcode AND SID=?");
        st.setString(1,sid);
        ResultSet rs = st.executeQuery();
        List<Module> md = new ArrayList<>();
        while(rs.next()) {
            Module item = new Module();   
            item.setMcode(rs.getString("Mcode"));
            item.setMname(rs.getString("Mname"));
            item.setDescription(rs.getString("M_Description"));
            item.setNoOfCredits(rs.getInt("NoOfCredits"));
            
            md.add(item);
        }  
        return md;
        
    }catch(Exception E){
        System.out.println("Error"+E);
    }
    return new ArrayList<Module>();
    
}


}
