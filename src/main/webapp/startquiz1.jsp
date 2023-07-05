<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/quiz.css" rel="stylesheet"/>
</head>

<body style="background-color:lightgreen">
    <center>
        <div>
        <form action="TableController" method="post">
            <br><br>
            
              <center>
                 SELECT YOUR QUIZ:
                    <select name="t1">
                        <option value="java">JAVA</option>
                        <option value="angular">Angular</option>
                        <option value="python">Python</option>
                        
                    </select><br><br>
            <h3>INFORMATION OF QUIZ</h3>
              </center>
            <p><b>
                1. EVERY QUESTION CARRIES 1 MARK <br>
                2. GIVING A RIGHT ANSWER YOU WILL GET A 1 MARK, IF YOUR ANSWER IS INCORRECT THEN 1 MARK WILL BE DEDUCTED (NEGATIVE MARKING)<br>
                3. THERE ARE TOTAL 10 QUESTIONS ARE AVAILABLE <br>
                4. TOTAL MARKS FOR THIS QUIZ IS 10 MARKS <br>
            </b></p>
                <br><br>
            <center>
        <input type="submit" value="Start your quiz"/>
            </center>
        </form>
        </div>
    </center>
</body>
</html>