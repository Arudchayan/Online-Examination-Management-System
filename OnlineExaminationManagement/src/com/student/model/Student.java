package com.student.model;

public class Student {
    private int user_id;
    private String SID;
    private String Sname;
    private String Address;
    private String DOB;
    private String NIC;
    private String CID;
    private String email;
    
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public String getSID() {
        return SID;
    }
    public void setSID(String sID) {
        SID = sID;
    }
    public String getSname() {
        return Sname;
    }
    public void setSname(String sname) {
        Sname = sname;
    }
    public String getAddress() {
        return Address;
    }
    public void setAddress(String address) {
        Address = address;
    }
    public String getDOB() {
        return DOB;
    }
    public void setDOB(String dOB) {
        DOB = dOB;
    }
    public String getNIC() {
        return NIC;
    }
    public void setNIC(String nIC) {
        NIC = nIC;
    }
    public String getCID() {
        return CID;
    }
    public void setCID(String cID) {
        CID = cID;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

}
