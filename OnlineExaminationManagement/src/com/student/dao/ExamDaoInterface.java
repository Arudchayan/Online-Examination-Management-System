package com.student.dao;

import java.util.List;

import com.student.model.Exam;

public interface ExamDaoInterface {
	public List<Exam> getExam(String sid);
}
