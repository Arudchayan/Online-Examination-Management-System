package com.student.dao;

import java.util.List;

import com.student.model.Results;

public interface ResultsDaoInterface {
	public List<Results> getResults(String sid);
	
}
