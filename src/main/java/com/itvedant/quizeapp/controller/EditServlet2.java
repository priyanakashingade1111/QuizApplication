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

@WebServlet("/EditServlet2")
public class EditServlet2 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String qid = request.getParameter("qid");
		int id = Integer.parseInt(qid);
		String question1 = request.getParameter("question");
		String option1 = request.getParameter("option1");
		String option2 = request.getParameter("option2");
		String option3 = request.getParameter("option3");
		String option4 = request.getParameter("option4");
		String answer = request.getParameter("answer");
		String description = request.getParameter("description");

		Question question = new Question();
		question.setQ_id(id);
		question.setQuestion(question1);
		question.setOption1(option1);
		question.setOption2(option2);
		question.setOption3(option3);
		question.setOption4(option4);
		question.setAnswer(answer);
		question.setDescription(description);

		int status = QuestionDao.update(question);
		if (status > 0) {
			response.sendRedirect("viewquestion1.jsp");
		} else {
			out.println("Sorry! unable to update record");
		}

		out.close();
	}

}