package com.user.service;

import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.user.model.User;

public class UserServiceImpl implements UserService {
	/**
	 * This method used to add user
	 * @param user
	 * @return boolean
	 */

	public boolean addUser(User user) {
		boolean result = false;

		int id = 0;
		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		String passwd = user.getPasswd();
		int age = user.getAge();
		String e_mail = user.getE_mail();
		int pNumber = user.getpNumber();
		String userType = user.getUserType();
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, userName, password);
			String query = "insert into user values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ps.setString(2, firstName);
			ps.setString(3, lastName);
			ps.setString(4, passwd);
			ps.setInt(5, age);
			ps.setString(6, e_mail);
			ps.setInt(7, pNumber);
			ps.setString(8, userType);

			int rs = ps.executeUpdate();

			if (rs > 0)
				result = true;
			else
				result = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result; 
	}

	/**
	 * This method use to view User
	 * @param userName1
	 * @return boolean
	 */
	public User viewUser(String userName1) {
		User user = new User();

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, userName, password);

			Statement st = con.createStatement();
			String query = "select * from user where userId = '" + userName1 + "'";
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {
				user.setFirstName(rs.getString(2));
				user.setLastName(rs.getString(3));
				user.setPasswd(rs.getString(4));
				user.setAge(rs.getInt(5));
				user.setE_mail(rs.getString(6));
				user.setpNumber(rs.getInt(7));
				user.setUserType(rs.getString(8));
			} else
				user.setFirstName("");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	/**
	 * This method use to update existing user
	 * @param user
	 * @return boolean
	 */
	public boolean updateUser(User user) {
		boolean result = false;

		int userId = Integer.parseInt(user.getId());
		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		String passwd = user.getPasswd();
		int age = user.getAge();
		String e_mail = user.getE_mail();
		int pNumber = user.getpNumber();

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, userName, password);

			String query = "update user set firstName = '" + firstName + "', lastName = '" + lastName + "', passwd = '" + passwd + "', age = '" + age + "', e_mail = '" + e_mail + "', pNumber = '" + pNumber + "' where userId ='" + userId + "' ";
			
			PreparedStatement ps = con.prepareStatement(query);
			
			int rs = ps.executeUpdate();

			if (rs > 0)
				result = true;
			else
				result = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * This method use to delete user  
	 * @param userName1
	 * @return boolean
	 */
	public boolean deleteUser(String userName1) {
		boolean result = false;

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, userName, password);

			String query = "delete from user where userId = '" + userName1 + "'";

			PreparedStatement ps = con.prepareStatement(query);
			int rs = ps.executeUpdate();

			if (rs > 0)
				result = true;
			else
				result = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * This method use to encrypt password
	 * @param password
	 * @return String
	 */
	public String passwordEncryption(String password) {
		String passwd = "";
		int size = password.length();

		int x = 0;
		while (x < size) {
			char letter = password.charAt(x);
			letter = (char) (letter - encryptionValue);
			passwd = passwd + letter;
			x++;
		}

		return passwd;
	}

	/**
	 * This method use to decrypt password
	 * @param password
	 * @return String
	 */
	public String passwordDecryption(String password) {
		String passwd = "";
		int size = password.length();

		int x = 0;
		while (x < size) {
			char letter = password.charAt(x);
			letter = (char) (letter + encryptionValue);
			passwd = passwd + letter;
			x++;
		}

		return passwd;
	}

	/**
	 * This method is use to get all user's details
	 * @param userType
	 * @return ArrayList<User>
	 */
	public ArrayList<User> getUserDetails(String userType) {
		ArrayList<User> list = new ArrayList<User>();

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, userName, password);

			Statement st = con.createStatement();

			String query;

			if (userType == "")
				query = "select * from user";
			else
				query = "select * from user where userType = '" + userType + "'";

			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				User user = new User();
				String userName = Integer.toString(rs.getInt(1));
				user.setId(userName);
				user.setFirstName(rs.getString(2));
				user.setLastName(rs.getString(3));
				user.setPasswd(rs.getString(4));
				user.setAge(rs.getInt(5));
				user.setE_mail(rs.getString(6));
				user.setpNumber(rs.getInt(7));
				user.setUserType(rs.getString(8));
				list.add(user);// user object to array list
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
