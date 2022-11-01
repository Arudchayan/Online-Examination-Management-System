package com.user.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.user.model.User;
import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class UpdateUserServelet
 */
public class UpdateUserServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/**
		 * Getting attributes from editUserView.jsp
		 */
		String userId = request.getParameter("userId");
		String firstName = request.getParameter("fName");
		String lastName = request.getParameter("lName");
		String passwd = request.getParameter("passwd");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		int phoneNumber = Integer.parseInt(request.getParameter("pNum"));

		/**
		 * Creating object (usi3) for UserServiceImpl class
		 */
		UserServiceImpl usi3 = new UserServiceImpl();
		passwd = usi3.passwordEncryption(passwd);

		/**
		 * Creating object (user3) for User class
		 */
		User user3 = new User();
		user3.setId(userId);
		user3.setFirstName(firstName);
		user3.setLastName(lastName);
		user3.setPasswd(passwd);
		user3.setAge(age);
		user3.setE_mail(email);
		user3.setpNumber(phoneNumber);

		/**
		 * Checking whether given details successfully stored in database or not
		 */
		boolean status = usi3.updateUser(user3);
		 

		/**
		 * If is it success it will go to editUser.jsp
		 * else it stay in same page
		 */
		if (status == true) {
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("editUser.jsp");
			dispatcher1.forward(request, response);
		} else {
			RequestDispatcher dispatcher2 = request.getRequestDispatcher("editUserView.jsp");
			dispatcher2.forward(request, response);
		}

		/*
		 * PrintWriter out = response.getWriter(); out.println(userId);
		 * out.println(firstName); out.println(lastName); out.println(passwd);
		 * out.println(email); out.println(age); out.println(phoneNumber)
		 */

	}

}
