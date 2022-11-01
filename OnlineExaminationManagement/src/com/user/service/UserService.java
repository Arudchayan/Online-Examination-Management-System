package com.user.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.user.model.User;

public interface UserService {
	final String userName = "root";// user name 
	final String password = "password";// password
	final String url = "jdbc:mysql://localhost:3306/onlineexaminationmanagement";// url
	final String driver = "com.mysql.jdbc.Driver"; //driver

	final int encryptionValue = 11;

	/**
	 * Add user
	 * @param user
	 * @return boolean
	 */
	public boolean addUser(User user);

	/**
	 * View User
	 * @param userName1
	 * @return boolean
	 */
	public User viewUser(String userName1);

	/**
	 * Update existing user
	 * @param user
	 * @return boolean
	 */
	public boolean updateUser(User user);

	/**
	 * Delete user
	 * @param userName1
	 * @return boolean
	 */
	public boolean deleteUser(String userName1);

	/**
	 * Encrypt password
	 * @param password
	 * @return String
	 */
	public String passwordEncryption(String password);

	/**
	 * Decrypt password
	 * @param password
	 * @return String
	 */
	public String passwordDecryption(String password);

	/**
	 * Get user's details
	 * @param userType
	 * @return ArrayList<User>
	 */
	public ArrayList<User> getUserDetails(String userType);
}
