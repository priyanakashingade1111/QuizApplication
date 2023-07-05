
package com.itvedant.quizeapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CheckS")
public class CheckS extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");

			out.println("<div id=navbar>");
			out.println("<h1>");

			out.println(" <a href=logout.jsp>Logout</a>");
			out.println("</h1>");
			out.println("  </div>");
			out.println("</head>");
			out.println("<body style=background-color:lightgreen>");

			HttpSession s2 = request.getSession(false);
			String name = (String) s2.getAttribute("username");
			String b = (String) s2.getAttribute("sid");

			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");

			out.println("<form action=\"LogoutS\" method=\"post\">");
			out.println("<center><div>");
			out.println("<center><table border=1 bgcolor=\"#00FF00\" >" + "<tr><td colspan='4' > <center>\n"
					+ "</center></td></tr><tr><td colspan='4'><center><h1> REPORT CARD</h1></center></td></tr>"
					+ "<tr  ><th colspan='4'> NAME OF THE STUDENT: " + name + "</th></tr>");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quize", "root", "");
			String query1 = "select * from result where name=? and sesid=?";
			PreparedStatement ps2 = con.prepareStatement(query1);

			ps2.setString(1, name);
			ps2.setString(2, b);
			ResultSet rs1 = ps2.executeQuery();
			System.out.println(rs1.getFetchSize());

			int count = 0;
			int e = 0;
			while (rs1.next()) {

				String cans = rs1.getString(3);
				String uans = rs1.getString(4);
				String string = rs1.getString("corans");
				String string2 = rs1.getString("option");

				e++;
				if ((cans != null) && (uans != null) && (cans.equals(uans))) {
					count++;

				}
//					else {
//					count--;
//					
//				}
			}
			rs1.close();
			ps2.close();
			con.close();

			out.println("<tr><td colspan='4' ><center><p id='p3'>YOUR SCORE IS : " + count + "</p></center></td></tr>");
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/quize", "root", "");
			
			String query2 = "insert into reports(name,count,feedback) values(?,?,?);";
			PreparedStatement ps3 = con1.prepareStatement(query2);

			ps3.setString(1, name);
			
			ps3.setInt(2, count);

			if (count > 7) {
				ps3.setString(3, "Pass");
			} else {
				ps3.setString(3, "Fail");

			}
			ps3.executeUpdate();
			ps3.close();
			con1.close();
			out.println("</table></center><br><br>");
			out.println("</div></center>");

			out.println("</body>");
			out.println("</html>");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}
}