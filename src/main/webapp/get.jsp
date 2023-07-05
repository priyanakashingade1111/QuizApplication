<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%--<%@page import="com.sun.org.apache.bcel.internal.generic.Select"--%>
<%! static int count=0; %>
<%! static int count1=0; %>



<%

String subject= request.getParameter("t1");


try{


	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quize","root","");

	if(count==0){
	

PreparedStatement ps1= con.prepareStatement("select min(qid) from "+ subject+" " );
PreparedStatement ps2= con.prepareStatement("select max(qid) from "+ subject+" ");



ResultSet rs1= ps1.executeQuery();
ResultSet rs2= ps2.executeQuery();


if(rs2.next()){
count1=rs2.getInt(1);
session.setAttribute("max",count1);
}
if(rs1.next()){
count=rs1.getInt(1);
session.setAttribute("min",count);

}
}
if(count>0){
PreparedStatement ps=con.prepareStatement("select * from "+ subject +"  where  qid="+count+" ");


ResultSet rs=ps.executeQuery();
while(rs.next()){
String question=rs.getString(2);
String option1= rs.getString(3);
String option2= rs.getString(4);
String option3= rs.getString(5);
String option4= rs.getString(6);


session.setAttribute("question",question);
session.setAttribute("option1",option1);
session.setAttribute("option2",option2);
session.setAttribute("option3",option3);
session.setAttribute("option4",option4);
}

}

count++;
session.setAttribute("count",count);
if(count>(Integer)session.getAttribute("max")){
count=0;
session.setAttribute("ans",null);
}

session.setAttribute("subject", subject);
con.close();

}catch(Exception e){e.printStackTrace();}

%>
<jsp:forward page="start.jsp"></jsp:forward>