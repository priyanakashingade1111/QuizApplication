
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" import="java.util.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to QuizYourIQ</title>
                  <style>
  body {
  background-color:snow;
  color: snow;
   background:url(q9.jpg);
   background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  font-family: Arial, Helvetica, sans-serif;
   }
input[type=text]{
  width: 65%;
  padding: 15px;
  margin: 5px  22px ;
  display: inline-block;
  border: none;
  border-radius: 25px;
}
textarea {
  width: 90%;
  padding: 15px;
  margin: 5px  22px ;
  display: inline-block;
  border: none;
  border-radius: 25px;
}
input[type=text]:focus, input[type=password]:focus ,input[type=file]:focus,input[type=date]:focus,input[type=email]{
  background-color: #ddd;
  outline: none;
}
div {
  background-image: linear-gradient(#093028,#237A57);
  border-radius: 21px;
  padding: 10px; 
  width: 650px;
  height: 750px;
  text-align: center;
}
input[type=submit],input[type=reset],input[type=button],select{
  width: 65%;
  padding: 11px;
  font-weight:bold;
  text-shadow: 2px 2px 5px red;
  display: inline-block;
  font-size: 16px;
  border-radius: 25px;
  color:darkgreen;
  background-color: darkgreen;
  color: white;
  border: none;
  cursor: pointer;
  opacity: 0.9;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}
li {
  float: left;
  border-right:1px solid #bbb;
}
li:last-child {
  border-right: none;
}
li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
li a:hover:not(.active) {
  background-color: #111;
}
.active {
  background-color: #4CAF50;
}
.logo-img{
    position: relative;
    margin: 10px 15px 15px 10px;
}.logo-img1{
    float:right;
    position: relative;
    margin: 10px 15px 15px 10px;
}
footer{
    background-color:black;
}
table{
    width:350px;
    height:350px;
}
table {
  border-collapse: collapse;
    background-image: linear-gradient(#000428,#004e92);
}
p{
    text-align: left;
}
</style>
</head>
<body>
<form action="TableController" method="post">
<% HttpSession s2=request.getSession(false);
    String t=(String)s2.getAttribute("uname1");%>
     <center>
 <img class="logo-img" src="l1.jpeg" width="230" height="145" ALT="align box">
     </center>
    <center><div>
            <center><table border="1">
<%
     out.println("<center><h2>WELCOME TO QuizYourIQ! ALL THE BEST:</h2><h5>USERNAME:  "+t+"</h5></center>");
     Date d = new Date();
     out.println("TEST DATE:"+ d.toString());
     s2.setAttribute("td",d.toString());
    int current = 0;
    int num=1;
    Object qlist=s2.getAttribute("qlist");
    Object qlist2=s2.getAttribute("qlist1");
    List qlist1= (ArrayList)qlist;
    List qlist3= (ArrayList)qlist2;
    ListIterator itr=qlist1.listIterator();
    ListIterator itr2=qlist3.listIterator();
    String qid=request.getParameter("qid");
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");            
    response.setHeader("Pragma","no-cache"); 
    response.setHeader ("Expires", "0");
    if (request.getParameter("hidden") != null)
    {
    current = Integer.parseInt(request.getParameter("hidden")); 
    }
    if(current==20){
        response.sendRedirect("CheckS");
    }
    for (int i = 0; i < current; i++)
    {
    itr.next();
    itr.next();
    itr.next();
    itr.next();
    itr.next();
    itr.next();
    itr.next();
    num++;
    }
    for (int j = 0; j < current; j++)
    {
    itr2.next();
    itr2.next();
    itr2.next();
    itr2.next();
    }
        if(itr.hasNext()) 
        {
        %>
<tr><td><input type="hidden" name="qid" value="<%=itr.next() %>"><input type="text" name="qid" Disabled Readonly id="qid" value="<%=num %>"/></td>
    <td><textarea name="question" cols="50" rows="5" Disabled Readonly id="question"><%=itr.next() %></textarea></td>
    <tr><td>A)</td><td><input type="radio" name="option" value="<%=itr2.next()%>"><%=itr.next()%></td></tr>
    <tr><td>B)</td><td><input type="radio" name="option" value="<%=itr2.next()%>"><%=itr.next()%></td></tr>
    <tr><td>C)</td><td><input type="radio" name="option" value="<%=itr2.next()%>"><%=itr.next() %></td></tr>
    <tr><td>D)</td><td><input type="radio" name="option" value="<%=itr2.next()%>"><%=itr.next()%></td></tr>
    <input type="hidden" name="corans" value="<%=itr.next() %>">
    </table></center><br><br>
<input type="hidden" name="hidden" value="<%=current+1 %>">
<input type="submit" value="NEXT QUESTION"><br><br>
<input type="button" value="FINISH EXAM" onclick="location.href='CheckS'">  
<%
}
%>
</form>
</table>
</div>
</center>


</body>
</html>