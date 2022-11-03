package com.student.model;

public class Feedback {
    private int MessageID;
    private String SID;
    private String Date;
    private String ExamID;
    private String Subject;
    private String Content;
    
    public int getMessageID() {
        return MessageID;
    }
    public void setMessageID(int messageID) {
        MessageID = messageID;
    }
    public String getSID() {
        return SID;
    }
    public void setSID(String sID) {
        SID = sID;
    }
    public String getDate() {
        return Date;
    }
    public void setDate(String date) {
        Date = date;
    }
    public String getExamID() {
        return ExamID;
    }
    public void setExamID(String examID) {
        ExamID = examID;
    }
    
    public String getSubject() {
        return Subject;
    }
    public void setSubject(String subject) {
        Subject = subject;
    }
    public String getContent() {
        return Content;
    }
    public void setContent(String content) {
        Content = content;
    }

}
