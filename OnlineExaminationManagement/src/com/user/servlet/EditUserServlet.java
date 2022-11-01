package com.user.servlet;

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
 * Servlet implementation class EditUserServlet
 */
public class EditUserServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * Getting User Name from editUser.jsp
		 */
		String userName = request.getParameter("userName");

		/**
		 * Creating object (user2) for User class
		 */
		User user2 = new User();

		/**
		 * Creating object (usi2) for UserServiceImpl class
		 */
		UserServiceImpl usi2 = new UserServiceImpl();
		user2 = usi2.viewUser(userName);
		

		String firstName = user2.getFirstName();
		String lastName = user2.getLastName();
		int age = user2.getAge();
		String password = user2.getPasswd();
		String email = user2.getE_mail();
		int phoneNumber = user2.getpNumber();
		String userType = user2.getUserType();

		/**
		 *If user name available in database 
		 *it will decrypt password 
		 *set session for: 
		 *user name, first name, last name, age, password, email, phone number, user type
		 *it will go to editUserView.jsp
		 *Else it will go to noUserEdit.jsp
		 */
		if (firstName != "") {
			password = usi2.passwordDecryption(password);

			HttpSession session = request.getSession();
			session.setAttribute("userName", userName);
			session.setAttribute("firstName", firstName);
			session.setAttribute("lastName", lastName);
			session.setAttribute("age", age);
			session.setAttribute("passwd", password);
			session.setAttribute("email", email);
			session.setAttribute("phoneNumber", phoneNumber);
			session.setAttribute("userType", userType);

			RequestDispatcher dispatcher1 = request.getRequestDispatcher("editUserView.jsp");
			dispatcher1.forward(request, response);
		} else {
			RequestDispatcher dispatcher2 = request.getRequestDispatcher("noUserEdit.jsp");
			dispatcher2.forward(request, response);
		}

		// PrintWriter out = response.getWriter();// boolean result = usi2.editUser(userName);
		/*
		 * out.print(userName); //out.print(result); out.println(firstName);
		 * out.println(lastName); out.println(passwd); out.println(age);
		 * out.println(email); out.println(phoneNumber); out.println(userType);
		 */
	}

}
