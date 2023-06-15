<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$('#SignUp').click(function() {
			alert("회원가입 페이지로 이동합니다.");
			window.location.href = "./signUp.jsp";
		});		
		$('#go-to-admin_page').click(function() {
			window.location.replace("../admin/admin_page.jsp");
		});
		$('#admin-id, #admin-pw').keyup( function(){
			 var id = $( '#admin-id' ).val();
		     var pw = $( '#admin-pw' ).val();
			 if(id == "root" && pw == "1234") {
				 $('#go-to-admin_page').prop("disabled", false);
				 $('#admin-id').prop("disabled", true);
				 $('#admin-pw').prop("disabled", true);
			 }
		 });
		$('#go-to-admin_page').on('click', function() {
			 $('#admin-id').prop("disabled", false);
			 $('#admin-pw').prop("disabled", false);
		});
	});
</script>
<body>
		<form name="loginform" action="./user_page.jsp" method="GET" accept-charset="UTF-8">
			<table class="login-table">
				<tr> 
					<th class="title" colspan="2">로그인</th>
				</tr>
				<tr>
					<td class="title">아이디</td>
					<td>
						<input type="text" name="id" id="id" placeholder="id">
					</td>
				</tr>
				<tr>
					<td class="title">비밀번호</td>
					<td><input type="password" name="password" placeholder="password"></td>
				</tr>
				<tr>
					<td colspan="2"><input style="float:right;" type="submit" id="login" value="로그인"></td>
				</tr>
			</table>
		</form>
		<br/>
		<table style="padding-left:80px;">
			<tr>
				<th>회원가입</th>
			</tr>
			<tr>
				<td><input type="button" id="SignUp" value="회원가입"></td>
			</tr>
		</table>
		<br/>
			<table>
			<tr>
				<th colspan="2">관리자 페이지</th>
			</tr>
			<tr>
				<td class="title">관리자 아이디</td>
				<td><input type="text" name="admin-id" id="admin-id" placeholder="admin-id"></td>
			</tr>
			<tr>
				<td class="title">관리자 비밀번호</td>
				<td><input type="password" name="admin-password" id="admin-pw" placeholder="admin-password"></td>
			</tr>
			<tr>
				<td colspan="2"><input style="float:right;" type="submit" id="go-to-admin_page" value="로그인" disabled></td>
			</tr>
		</table>	
</body>
</html>