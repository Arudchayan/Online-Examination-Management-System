package com.student.dao;

import java.util.List;

import com.student.model.Module;

public interface ModuleDaoInterface {
	public List<Module> getModule(String sid);
}
