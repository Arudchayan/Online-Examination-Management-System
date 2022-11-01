package com.user.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.user.service.UserServiceImpl;

/**
 * Servlet implementation class DeleteUserConfirmServlet
 */
public class DeleteUserConfirmServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * Getting User Name from deleteUser.jsp
		 */
		String userName = request.getParameter("userId");

		/**
		 * Creating object (usi6) for UserServiceImpl class
		 */
		UserServiceImpl usi6 = new UserServiceImpl();
		
		/**
		 * checking whether given details successfully deleted in database or not
		 */
		boolean status = usi6.deleteUser(userName);

		/**
		 * if is it success it will go to deleteUser.jsp
		 * else it stay in same page
		 */
		if (status == true) {
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("deleteUser.jsp");
			dispatcher1.forward(request, response);
		} else {
			RequestDispatcher dispatcher2 = request.getRequestDispatcher("deleteUserView.jsp");
			dispatcher2.forward(request, response);
		}
		
		// PrintWriter out = response.getWriter();
		// out.print(userName);
	}

}
