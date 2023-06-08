<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	<%
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	Connection conn = null;
	String db_url = "jdbc:mysql://localhost:3306/campus";
	String db_id = "root";                     //MySQL에 접속을 위한 계정의 ID
	String db_pwd = "1234";            //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(db_url, db_id, db_pwd);

	if(conn!=null) {
	%>	console.log("MySQL DB 연결 성공"); <%
	}

	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String sql = "SELECT * FROM T_SHOPPING_MEMBER WHERE MEMBER_ID = ? AND MEMBER_PW = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	%>
	console.log("<%=pstmt %>");
	<%
	rs = pstmt.executeQuery();
	if(rs.next()) {
		String name = rs.getString("MEMBER_NAME");
		%>
		document.getElementById("login_result").innerText = "Login Success";
		document.getElementById("id").value = "<%=id %>";
		document.getElementById("password").value = "<%=password %>";
		document.getElementById("hello_name").innerText = "hello, <%=name %>";
		<%
	} else {
		%>
		alert("존재하지 않는 아이디 또는 비밀번호입니다.");
		window.location.href="./login.jsp";
		<%
	}
	%>
});
</script>
<script>
$(document).ready(function(){
	$('#logout').click(function (){
		alert("로그아웃 되었습니다.");
		window.location.replace("./login.jsp");
	});
});
</script>
</head>
<body>
<h1 id="login_result"></h1>
<p id="hello_name"></p>
<form action="./user_info.jsp">
	<input type='hidden' id='id' name='id'>
	<input type='hidden' id='password' name='password'>
	<input type='submit' value='내 정보'>&nbsp;
	<input type='button' value='로그아웃' id='logout'>
</form>
</body>
</html>