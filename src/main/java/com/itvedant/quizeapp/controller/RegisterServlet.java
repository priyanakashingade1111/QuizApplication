package com.itvedant.quizeapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.itvedant.quizeapp.dao.UserDao;
import com.itvedant.quizeapp.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String category = req.getParameter("category");
		String email = req.getParameter("email");

		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setCategory(category);
		user.setEmail(email);
		try {
			boolean result = new UserDao().registerUser(user, req, resp);
			if (result) {
				// resp.getWriter().print("user created ");
				resp.sendRedirect("login.jsp");
			} else {
				PrintWriter out = resp.getWriter();
			//	out.println("<h2>Username already exists</h2>");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.include(req, resp);
         // resp.getWriter().print("Username already exists");

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
