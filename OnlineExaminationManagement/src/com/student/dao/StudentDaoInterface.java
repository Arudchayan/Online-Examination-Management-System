package com.student.dao;

import com.student.model.Student;

public interface StudentDaoInterface {
	public Student getStudent(Object object);
	 public Student updateStudent(int uid, String sname, String address, String dob);
	 
}
