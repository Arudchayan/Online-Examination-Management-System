package com.module.servlet;



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.module.dao.ModuleDAO;
@WebServlet("/DeleteModule")
/**
 * Servlet implementation class addmodule
 */
public class DeleteModule extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModuleDAO DAO= new ModuleDAO();
		DAO.DeleteModule((String)request.getParameter("Mcode"));
		RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
		rd.forward(request, response);
	}
}