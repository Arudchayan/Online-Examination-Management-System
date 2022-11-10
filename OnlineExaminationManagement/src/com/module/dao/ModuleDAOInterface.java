package com.module.dao;

import java.sql.ResultSet;

public interface ModuleDAOInterface {
	public void setModule(String Mcode,String Mname,String Mdes,String Mpoints);
	public ResultSet execute(String sql) ;
	public void updateModule(String Mcode, String Mname, String Mdes, String Mpoints);
	public void DeleteModule(String Mcode);
}
