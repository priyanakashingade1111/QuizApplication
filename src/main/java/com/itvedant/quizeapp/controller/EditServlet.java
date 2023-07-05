package com.itvedant.quizeapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.itvedant.quizeapp.dao.QuestionDao;
import com.itvedant.quizeapp.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<body style=background-color:lightgreen>");
		out.print("<br><br><br>");
		out.print("<center>");
		out.println("<h1>Update Question</h1>");
		String qid = request.getParameter("qid");
		int id = Integer.parseInt(qid);

		Question e = QuestionDao.getQuestionById(id);
        

		out.print("<form action='EditServlet2' method='post'>");
		out.print("<table>");
		out.print("<tr><td></td><td><input type='hidden' name='qid' value='" + e.getQ_id() + "'/></td></tr>");
		out.print("<tr><td>Question:</td><td><input type='text' name='question' value='" + e.getQuestion()
				+ "'/></td></tr>");
		out.print("<tr><td>Option1:</td><td><input type='text' name='option1' value='" + e.getOption1()
				+ "'/></td></tr>");
		out.print("<tr><td>Option2:</td><td><input type='text' name='option2' value='" + e.getOption2()
				+ "'/></td></tr>");
		out.print("<tr><td>Option3:</td><td><input type='text' name='option3' value='" + e.getOption3()
				+ "'/></td></tr>");
		out.print("<tr><td>Option4:</td><td><input type='text' name='option4' value='" + e.getOption4()
				+ "'/></td></tr>");
		out.print("<tr><td>Answer:</td><td><input type='text' name='answer' value='" + e.getAnswer() + "'/></td></tr>");
		out.print("<tr><td>Description:</td><td><input type='text' name='description' value='" + e.getDescription()
				+ "'/></td></tr>");
		out.print("</td></tr>");
		out.print("<tr><td colspan='2'><input type='submit' value='Edit & Save '/></td></tr>");
		out.print("</table>");
		out.print("</form>");
		out.print("</center>");
		out.print("<body>");

		out.close();
	}
}