package com.LoginAndLogout;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.user.model.User;
import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * Getting User Name and Password from index.jsp
		 */
		String userName = request.getParameter("userName");
		String passwd = request.getParameter("passwd");

		/**
		 * Creating object (user) for User class
		 */
		User user = new User();

		/**
		 * Creating object (usi1) for UserServiceImpl class
		 */
		UserServiceImpl usi1 = new UserServiceImpl();
		user = usi1.viewUser(userName);

		/**
		 * getting attributes from database
		 */
		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		int age = user.getAge();
		String passwdDB = user.getPasswd();
		String email = user.getE_mail();
		int phoneNumber = user.getpNumber();
		String userType = user.getUserType();

		/**
		 * Checking whether user name is available in database if is it available
		 * password will decrypt
		 */
		if (firstName != "")
			passwdDB = usi1.passwordDecryption(passwdDB);

		/**
		 * Setting sessions for: user name, first name, last name, age, email, phone
		 * number, user type
		 */
		HttpSession session = request.getSession();
		session.setAttribute("userNameLogin", userName);
		session.setAttribute("firstNameLogin", firstName);
		session.setAttribute("lastNameLogin", lastName);
		session.setAttribute("ageLogin", age);
		session.setAttribute("emailLogin", email);
		session.setAttribute("phoneNumberLogin", phoneNumber);
		session.setAttribute("userTypeLogin", userType);

		/**
		 * If user entered user name and password match with database user name and
		 * password it will redirect to user tyep's home page else it will show a error
		 * message
		 */
		if ((firstName != "") && (passwd.equals(passwdDB))) {
			if (userType.equals("Admin")) {
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("adminHome.jsp");
				dispatcher1.forward(request, response);
			} else if (userType.equals("Student")) {
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("GetStudentController");
				dispatcher1.forward(request, response);
			}

			else if (userType.equals("Lecturer")) {
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("HomePage.jsp");
				dispatcher1.forward(request, response);
			}

		} else {
			request.setAttribute("errorMsg", "Invalid UserName or Password");
			RequestDispatcher dispatcher2 = request.getRequestDispatcher("index.jsp");
			dispatcher2.forward(request, response);
		}

		/*
		 * PrintWriter out = response.getWriter(); out.println("user name" + userName);
		 * out.println("first name" + firstName); out.println("last name" + lastName);
		 * out.println("password " + passwdDB); out.println("type " + userType);
		 * out.println("age " + age); out.println("email " + email);
		 * out.println("pNumber " + phoneNumber);
		 */

	}

}
