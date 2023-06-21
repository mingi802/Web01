<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page session="false"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$('#logout').click(function (){
		alert("로그아웃 되었습니다.");
		window.location.replace("../logout");
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