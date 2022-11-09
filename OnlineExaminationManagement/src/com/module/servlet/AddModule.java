package com.module.servlet;



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.module.dao.ModuleDAO;
@WebServlet("/AddModule")
/**
 * Servlet implementation class addmodule
 */
public class AddModule extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModuleDAO DAO= new ModuleDAO();
		DAO.setModule((String)request.getParameter("Mcode"),(String)request.getParameter("Mname"),(String) request.getParameter("Mdes"), (String)request.getParameter("Mpoints"));
		RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
		rd.forward(request, response);
	}
}