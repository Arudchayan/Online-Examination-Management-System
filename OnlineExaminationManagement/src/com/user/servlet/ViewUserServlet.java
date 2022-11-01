package com.user.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.user.model.User;
import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class ViewUserServlet
 */
public class ViewUserServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");

		/**
		 * Creating object (user5) for User class
		 */
		User user5 = new User();

		/**
		 * Creating object (usi5) for UserServiceImpl class
		 */
		UserServiceImpl usi5 = new UserServiceImpl();
		user5 = usi5.viewUser(userName);

		String firstName = user5.getFirstName();
		String lastName = user5.getLastName();
		int age = user5.getAge();
		String password = user5.getPasswd();
		String email = user5.getE_mail();
		int phoneNumber = user5.getpNumber();
		String userType = user5.getUserType();

		/**
		 *If user name available in database 
		 *it will decrypt password 
		 *set session for: 
		 *user name, first name, last name, age, password, email, phone number, user type
		 *it will go to viewUserView.jsp
		 *Else it will go to noViewUser.jsp
		 */
		if (firstName != "") {
			password = usi5.passwordDecryption(password);

			HttpSession session = request.getSession();
			session.setAttribute("userName", userName);
			session.setAttribute("firstName", firstName);
			session.setAttribute("lastName", lastName);
			session.setAttribute("age", age);
			session.setAttribute("passwd", password);
			session.setAttribute("email", email);
			session.setAttribute("phoneNumber", phoneNumber);
			session.setAttribute("userType", userType);

			RequestDispatcher dispatcher1 = request.getRequestDispatcher("viewUserView.jsp");
			dispatcher1.forward(request, response);
		} else {
			RequestDispatcher dispatcher2 = request.getRequestDispatcher("noViewUser.jsp");
			dispatcher2.forward(request, response);
		}
	}

}
