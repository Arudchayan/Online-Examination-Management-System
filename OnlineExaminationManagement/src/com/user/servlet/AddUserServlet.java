package com.user.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.user.model.User;
import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class AddUserServlet
 */
public class AddUserServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * Getting attributes from addUser.jsp
		 */
		String firstName = request.getParameter("fName");
		String lastName = request.getParameter("lName");
		String passwd = request.getParameter("passwd");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		int phoneNumber = Integer.parseInt(request.getParameter("pNumber"));
		String userType = request.getParameter("userType");

		/**
		 * Creating object (usi) for UserServiceImpl class
		 */
		UserServiceImpl usi = new UserServiceImpl();
		passwd = usi.passwordEncryption(passwd);

		/**
		 * Creating object (user1) for User class
		 */
		User user1 = new User();
		user1.setFirstName(firstName);
		user1.setLastName(lastName);
		user1.setPasswd(passwd);
		user1.setAge(age);
		user1.setE_mail(email);
		user1.setpNumber(phoneNumber);
		user1.setUserType(userType);

		/**
		 * checking whether given details successfully stored in database or not
		 */
		boolean status = usi.addUser(user1);

		/**
		 * if is it success it will go to adminHome.jsp
		 * else it stay in same page
		 */
		if (status == true) {
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("adminHome.jsp");
			dispatcher1.forward(request, response);
		} else {
			RequestDispatcher dispatcher2 = request.getRequestDispatcher("addUser.jsp");
			dispatcher2.forward(request, response);
		}

		/*
		 * PrintWriter out = response.getWriter(); out.println(firstName);
		 * out.println(lastName); out.println(passwd); out.println(age);
		 * out.println(email); out.println(phoneNumber); out.println(userType);
		 */
	}
}
