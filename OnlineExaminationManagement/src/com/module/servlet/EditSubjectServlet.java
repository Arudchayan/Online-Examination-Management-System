package com.module.servlet;



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.module.dao.ModuleDAO;



public class EditSubjectServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModuleDAO DAO= new ModuleDAO();
		ResultSet rs=DAO.execute("Select * from module where mcode="+"'"+request.getParameter("Mcode")+"'");
		try {
			rs.next();
			request.setAttribute("Mcode", rs.getString("Mcode"));
			request.setAttribute("Mname", rs.getString("Mname"));
			request.setAttribute("Mdes", rs.getString("M_Description"));
			request.setAttribute("Mpoints", rs.getInt("NoOfCredits"));
			RequestDispatcher rd = request.getRequestDispatcher("EditSubjectView.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}