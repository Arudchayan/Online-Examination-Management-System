package com.student.model;

public class Module {
    private String Mcode;
    private String Mname;
    private String Description;
    private int NoOfCredits;
    
    public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public int getNoOfCredits() {
		return NoOfCredits;
	}
	public void setNoOfCredits(int noOfCredits) {
		NoOfCredits = noOfCredits;
	}
	public String getMcode() {
        return Mcode;
    }
    public void setMcode(String mcode) {
        Mcode = mcode;
    }
    public String getMname() {
        return Mname;
    }
    public void setMname(String mname) {
        Mname = mname;
    }
    


}
