package com.itvedant.quizeapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itvedant.quizeapp.model.Question;
import com.itvedant.quizeapp.util.DatabaseUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class QuestionDao {
	public boolean savequestion(Question question, HttpServletRequest req, HttpServletResponse resp) {
		try {

			String subject = req.getParameter("t1");
			System.out.println(subject);
			String query = "insert into java(Question,option1,option2,option3,option4,Answer,Description) values(?,?,?,?,?,?,?)";

			Connection con = DatabaseUtil.createConnection();

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, question.getQuestion());
			ps.setString(2, question.getOption1());
			ps.setString(3, question.getOption2());
			ps.setString(4, question.getOption3());
			ps.setString(5, question.getOption4());
			ps.setString(6, question.getAnswer());
			ps.setString(7, question.getDescription());

			int i = ps.executeUpdate();
			System.out.println("Question save sucessfully");
			RequestDispatcher dispatcher = req.getRequestDispatcher("viewquestion1.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DatabaseUtil.stopConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;

	}

	public void savequestion1(String question1, String option1, String option2, String option3, String option4,
			String answer, String description) {
		// TODO Auto-generated method stub

	}

	public static Question getQuestionById(int id) {

		Question question = new Question();

		try {
			String query = "select * from java where qid=?";

			Connection con = DatabaseUtil.createConnection();

			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
						if (rs.next()) {

				question.setQ_id(rs.getInt(1));
				question.setQuestion(rs.getString(2));
				question.setOption1(rs.getString(3));
				question.setOption2(rs.getString(4));
				question.setOption3(rs.getString(5));
				question.setOption4(rs.getString(6));
				question.setAnswer(rs.getString(7));
				question.setDescription(rs.getString(8));
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return question;

	}
	
	 public static int update(Question question){  
	        int status=0;  
	        try {         
	        	String query = "update java set Question=?, option1=?, option2=? ,option3=? ,option4=? ,Answer=?,Description=? where qid=?";

				Connection con = DatabaseUtil.createConnection();

				PreparedStatement ps = con.prepareStatement(query);
				 ps.setString(1,question.getQuestion());  
	              ps.setString(2,question.getOption1());  
	              ps.setString(3,question.getOption2());  
	              ps.setString(4,question.getOption3());  
	              ps.setString(5,question.getOption4());
	              ps.setString(6,question.getAnswer());
	              ps.setString(7,question.getDescription()); 
	              ps.setInt(8,question.getQ_id()); 
	              
	            status=ps.executeUpdate();  
	              
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
	    }  
}
