package com.user.model;

public class User
{
	private String id;
	private String firstName;
	private String LastName;
	private String passwd;
	private int age;
	private String e_mail;
	private int pNumber;
	private String userType;

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return LastName;
	}
	
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	
	/**
	 * @return the passwd
	 */
	public String getPasswd() {
		return passwd;
	}
	
	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	/**
	 * @return the age
	 */
	public int getAge() {
		return age;
	}
	
	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}
	
	/**
	 * @return the e_mail
	 */
	public String getE_mail() {
		return e_mail;
	}
	
	/**
	 * @param e_mail the e_mail to set
	 */
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	
	/**
	 * @return the pNumber
	 */
	public int getpNumber() {
		return pNumber;
	}
	
	/**
	 * @param pNumber the pNumber to set
	 */
	public void setpNumber(int pNumber) {
		this.pNumber = pNumber;
	}
	
	/**
	 * @return the userType
	 */
	public String getUserType() {
		return userType;
	}
	
	/**
	 * @param userType the userType to set
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}
}

