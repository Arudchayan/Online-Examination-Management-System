package com.lecturer.model;

import java.util.ArrayList;

public interface ExamDaoInterface {
	public Exam AddExam(String ExamID,String Mcode,String ExamName,String BatchID,String  ExamDate,String  ExamTime,int  Duration,String ExamFile);
	public Exam Examlist(String ExamID);
	public ArrayList<Exam> selectAllExams();
	public void DeleteExam(String ExamID);
	public Exam UpdateExam(String ExamID, String Mcode, String ExamName, String BatchID, String ExamDate, String ExamTime,int Duration);
}
