<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%-- <%@page import="com.sun.org.apache.bcel.internal.generic.Select"%>--%>
<html>
<%!static int count1 = 0;%>

<%!static int total = 0;%>
<%
if (session.getAttribute("count") != null) {
	String question1 = (String) session.getAttribute("question");
	System.out.println(question1);
	String ans = (String) session.getAttribute("ans");
	System.out.println(ans);
	System.out.println(ans);
	Integer count = (Integer) session.getAttribute("count");

	String subject = (String) session.getAttribute("subject");
	try {
		if (count1 == 0) {
	count1 = count - 1;
	System.out.println(count1);
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quize", "root", "");
	//PreparedStatement ps=con.prepareStatement("select answer from java where quizname='"+name+"' and qid='"+count1+"' ");
	System.out.println("==========================");
	System.out.println(subject);
	System.out.println(count1);
	System.out.println(question1);
	PreparedStatement ps = con.prepareStatement("select Answer from " + subject + "  where qid=" + count1
			+ "  and Question=' " + question1 + " ' ");

	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
		String ans1 = rs.getString(1);
		System.out.println("ans1 on c10=" + ans1);
		System.out.println("ans on get1=" + ans);
		if (ans1.equals(ans)) {
			total = total + 1;
			System.out.println("total=" + total);
		}

	}

	con.close();
		}

		else {
	count1 = count - 2;
	System.out.print("count at get1:" + count);

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quize", "root", "");
	PreparedStatement ps = con.prepareStatement("select Answer from " + subject + "  where qid=" + count1
			+ "  and Question=' " + question1 + " ' ");
	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
		String ans1 = rs.getString(1);
		System.out.println("ans1=" + ans1);
		System.out.println("ans on get1=" + ans);
		if (ans1.equals(ans)) {
			total = total + 1;
			System.out.println("total=" + total);

		}

	}
	con.close();
		}
		if (count > (Integer) session.getAttribute("max")) {
	Integer max = (Integer) session.getAttribute("max");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quize", "root", "");
	//PreparedStatement ps=con.prepareStatement("select answer from quizques where quizname='"+name+"' and qid='"+max+"' ");
	PreparedStatement ps = con.prepareStatement(
			"select Answer from " + subject + "  where qid=" + max + "  and Question=' " + question1 + " ' ");

	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
		String ans1 = rs.getString(1);
		System.out.println("ans1 on c1=" + ans1);
		String ans2 = (String) session.getAttribute("ans");
		System.out.println("ans on get1=" + ans2);
		if (ans1.equals(ans2)) {
			total = total + 1;
			System.out.println("total=" + total);
		}

	}

	con.close();
	request.setAttribute("total", total);
	total = 0;
%>

<jsp:forward page="result.jsp"></jsp:forward>
<%
}

} catch (Exception e) {
e.printStackTrace();
}

}
%>
<jsp:forward page="get.jsp"></jsp:forward>

</html>