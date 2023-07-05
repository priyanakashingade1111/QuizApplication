package com.itvedant.quizeapp.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itvedant.quizeapp.model.User;
import com.itvedant.quizeapp.util.DatabaseUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserDao {

	public boolean registerUser(User user, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		Connection con = null;
		try {

			if (!checkUser(user.getEmail(), request, response)) {

				String query = "insert into  quizregister(username,password,category,Email)values(?,?,?,?)";

				con = DatabaseUtil.createConnection();

				PreparedStatement ps = con.prepareStatement(query);

				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());
				ps.setString(3, user.getCategory());
				ps.setString(4, user.getEmail());

				int i = ps.executeUpdate();

			} else {
				return false;
			}

		} catch (Exception e) {
			
		} finally {
			DatabaseUtil.stopConnection();
		}
		return true;
	}

	private boolean checkUser(String string, HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		PrintWriter out = response.getWriter();
		Connection con = null;
		try {
			con = DatabaseUtil.createConnection();
			PreparedStatement ps = con.prepareStatement("select * from quizregister where email=? ");
			ps.setString(1, string);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				return true;

			}

		} catch (Exception e) {

		} finally {
			con.close();
		}

		return false;

	}

	public void getUser(String username, String password, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException {

		try {

			PrintWriter out = response.getWriter();
			Connection con = DatabaseUtil.createConnection();
			PreparedStatement ps = con.prepareStatement("select * from quizregister where username=? and password=? ");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			int i = 0;

			while (rs.next()) {
				i = 1;

				if (i != 0) {
					String category = rs.getString(3);
					HttpSession session = request.getSession();
					session.setAttribute("username", username);

					if (category.equals("Teacher")) {
						RequestDispatcher rd = request.getRequestDispatcher("viewquestion1.jsp");
						rd.forward(request, response);
					} else {
						RequestDispatcher rd = request.getRequestDispatcher("startquiz1.jsp");
						rd.forward(request, response);
					}

				} else {
					out.println("<center><h2>INCORRECT PASSWORD! TRY AGAIN</h2></center>");
					 request.setAttribute("errorMessage", "Invalid username or password");
					
				}
			}
		} catch (SQLException sqe) {
			System.out.println("Error : While Fetching records from database");
		}

		finally {
			try {

				DatabaseUtil.stopConnection();
			} catch (SQLException e) {

				System.out.println("System.out.println(\"Error : While Closing Connection");

			}
		}
	}
}
