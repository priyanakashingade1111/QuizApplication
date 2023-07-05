package com.itvedant.quizeapp.controller;

import java.io.IOException;

import com.itvedant.quizeapp.dao.QuestionDao;
import com.itvedant.quizeapp.dao.UserDao;
import com.itvedant.quizeapp.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/QuestionServlet")
public class QuestionServlet extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	   String question1 = req.getParameter("question");
 	   String option1 = req.getParameter("option1");
	   String option2 = req.getParameter("option2");
	   String option3 = req.getParameter("option3");
	   String option4 = req.getParameter("option4");
	   String answer = req.getParameter("answer");
	   String description = req.getParameter("description");
	   
	   Question question = new Question ();
	   question.setQuestion(question1);
	   question.setOption1(option1);
	   question.setOption2(option2);
	   question.setOption3(option3);
	   question.setOption4(option4);
	   question.setAnswer(answer);
	  question.setDescription(description);
	  
	  
	  
	  QuestionDao questionDao =  new QuestionDao();
	  questionDao.savequestion(question,req,  resp);
}
   
   
  
}
