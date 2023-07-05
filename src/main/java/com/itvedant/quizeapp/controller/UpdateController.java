package com.itvedant.quizeapp.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.itvedant.quizeapp.util.DatabaseUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/UpdateController")
public class UpdateController extends HttpServlet {
      @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	  int status=0;  
    	  try{  
    		  String qid = req.getParameter("qid");
    		  String Question = req.getParameter("Question");
        	  String option1 = req.getParameter("option1");
      		  String option2 = req.getParameter("option2");
      		  String option3 = req.getParameter("option3");
      		  String option4 = req.getParameter("option4");
      		  String Answer = req.getParameter("Answer");
      		  String Description = req.getParameter("Description");
      		
      		
      	 
    		  Connection con = DatabaseUtil.createConnection();
  			
  			PreparedStatement ps = con.prepareStatement("update java set Question=?,option1=?,option2=?,option3=?,option4=?,Answer=?,Description=? where qid=? ");  
              ps.setString(1,Question);  
              ps.setString(2,option1);  
              ps.setString(3,option2);  
              ps.setString(4,option3);  
              ps.setString(5,option4);
              ps.setString(6,Answer);
              ps.setString(7,Description);
                
              status=ps.executeUpdate();  
                
              con.close();  
          }catch(Exception ex){
        	  ex.printStackTrace();
          }  
            
        }  
    }

