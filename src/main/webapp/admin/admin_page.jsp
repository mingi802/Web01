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
		window.location.href="./show_users.jsp?admin-id=root&admin-password=1234";
	});
	$("#go-to-edit_dept").click(function () {
		window.location.href="./edit_dept.jsp?admin-id=root&admin-password=1234";
	});
});

</script>
<body>
<h1>������ ������</h1>
<input type="button" id="go-to-edit_dept" value="�μ� ����">
<input type="button" id="go-to-show_users" value="ȸ�� ��ȸ">
</body>
</html>