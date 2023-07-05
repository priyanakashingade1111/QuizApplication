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


@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   int status=0;  
 	  try{  
 		  
 		  String qid = request.getParameter("qid");
 		  Connection con = DatabaseUtil.createConnection();
			
			PreparedStatement ps = con.prepareStatement("delete from java where qid=? ");  
           
			  ps.setString(1,qid);  
           status=ps.executeUpdate();  
             
           con.close();  
           response.sendRedirect("viewquestion1.jsp");  
       }catch(Exception ex){
     	  ex.printStackTrace();
       }  
   }
}
