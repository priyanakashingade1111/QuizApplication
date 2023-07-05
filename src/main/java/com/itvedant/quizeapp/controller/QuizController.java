package com.itvedant.quizeapp.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import com.itvedant.quizeapp.util.DatabaseUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/QuizController")
public class QuizController extends HttpServlet{


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws SQLException 
     * @throws ClassNotFoundException 
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
    		
    	String query = "insert into  quizquestion(Question,option1,option2,option3,option4,Answer,Description) values(?,?,?,?,?,?,?)";
		
		Connection con = DatabaseUtil.createConnection();
		
		PreparedStatement ps = con.prepareStatement(query);
		System.out.println(ps.getFetchSize());
		   List qlist=new ArrayList();
           List qlist1=new ArrayList();
		 ResultSet rs = ps.executeQuery();
		 System.out.println(rs.getFetchSize());
                while(rs.next())
                {
                   String a= rs.getString(1);
                   String b= rs.getString(2);
                   String c= rs.getString(3);
                   String d= rs.getString(4);
                   String e= rs.getString(5);
                   String f= rs.getString(6);
                   String g= rs.getString(7);
                
                 String[] array=new String[]{c,d,e,f};
              List<String> l1=Arrays.asList(array);
              Collections.shuffle(l1);
         
              String k=l1.get(0);
              String l=l1.get(1);
              String m=l1.get(2);
              String n=l1.get(3); 
               
              qlist.add(a);
              qlist.add(b);
              qlist.add(k);
              qlist.add(l);
              qlist.add(m);
              qlist.add(n);
              qlist.add(g);
              
              qlist1.add(k);
              qlist1.add(l);
              qlist1.add(m);
              qlist1.add(n);
                
            }      
                
        //     s2.setAttribute("qlist",qlist);
          //   s2.setAttribute("qlist1",qlist1);
             RequestDispatcher rd=request.getRequestDispatcher("main.jsp");
            rd.forward(request, response);
      
        }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
			processRequest(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
			processRequest(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}       
