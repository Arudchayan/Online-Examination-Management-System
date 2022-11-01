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
 * Servlet implementation class DeleteUserServlet
 */
public class DeleteUserServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");

		/**
		 * Creating object (user4) for User class
		 */
		User user4 = new User();

		/**
		 * Creating object (usi4) for UserServiceImpl class
		 */
		UserServiceImpl usi4 = new UserServiceImpl();
		user4 = usi4.viewUser(userName);
		
		String firstName = user4.getFirstName();
		String lastName = user4.getLastName();
		int age = user4.getAge();
		String password = user4.getPasswd();
		String email = user4.getE_mail();
		int phoneNumber = user4.getpNumber();
		String userType = user4.getUserType();

		/**
		 *If user name available in database 
		 *it will decrypt password 
		 *set session for: 
		 *user name, first name, last name, age, password, email, phone number, user type
		 *it will go to deleteUserView.jsp
		 *Else it will go to noUserDelete.jsp
		 */
		if (firstName != "") {
			password = usi4.passwordDecryption(password);

			HttpSession session = request.getSession();
			session.setAttribute("userName", userName);
			session.setAttribute("firstName", firstName);
			session.setAttribute("lastName", lastName);
			session.setAttribute("age", age);
			session.setAttribute("passwd", password);
			session.setAttribute("email", email);
			session.setAttribute("phoneNumber", phoneNumber);
			session.setAttribute("userType", userType);

			RequestDispatcher dispatcher1 = request.getRequestDispatcher("deleteUserView.jsp");
			dispatcher1.forward(request, response);
		} else {
			RequestDispatcher dispatcher2 = request.getRequestDispatcher("noUserDelete.jsp");
			dispatcher2.forward(request, response);
		}
		// boolean result = usi2.editUser(userName);
	}

}
