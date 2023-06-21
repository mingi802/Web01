<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
	$("#go-to-show_users").click(function () {
		window.location.href="../show_member";
	});
	$("#go-to-edit_dept").click(function () {
		window.location.href="./edit_dept.jsp?admin-id=root&admin-password=1234";
	});
	$("#go-to-login").click(function () {
		window.location.href="../user/login.jsp";
	});
});

</script>
<body>
<h1>관리자 페이지</h1>
<input type="button" id="go-to-login" value="로그인 페이지로">
<input type="button" id="go-to-edit_dept" value="부서 편집">
<input type="button" id="go-to-show_users" value="회원 조회">
</body>
</html>