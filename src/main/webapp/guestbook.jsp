<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;

String url = "jdbc:mysql://localhost:3306/intro";
String id = "root";                     //MySQL에 접속을 위한 계정의 ID
String pwd = "1234";            //MySQL에 접속을 위한 계정의 암호
Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection(url, id, pwd);

out.println("<h1>MySQL DB 연결 성공</h1>");
PreparedStatement pstmt = null;

	if(request.getParameter("comment") != "") {
		String name = request.getParameter("name");
		String comment = request.getParameter("comment");
		comment = comment.replace(" ","&nbsp;");
		comment = comment.replace("\r\n","<br>");
		String sql = "INSERT INTO guestbook VALUES(NULL, ?, ?, now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, comment);
		int rows = pstmt.executeUpdate();
		if(rows == 0) {
			%>
		<script>alert("insert fail")</script>			
			<% 
		}
	}	
	conn.close();
%>
<script>
	window.location.href="./IntroMyself.jsp";
</script>
</body>
</html>