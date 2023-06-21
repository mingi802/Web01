<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page session="false"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	<%
	String before_id=request.getParameter("before-id");
	String before_password=request.getParameter("before-password");
	String id=request.getParameter("id");
	String password=request.getParameter("password");//will return the value 'text'
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 =request.getParameter("phone3");
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String calendar = request.getParameter("calendar");
	String rrn = request.getParameter("rrn");
	String rrn_2 = request.getParameter("rrn_2");
	String postcode = request.getParameter("postcode");
	String roadAddr = request.getParameter("roadAddr");
	String jibunAddr = request.getParameter("jibunAddr");
	String detailAddr = request.getParameter("detailAddr");
	String smssts = request.getParameter("smssts");
	String emailsts = request.getParameter("emailsts");
	%>
	console.log("<%=before_id%>", "<%=before_password%>");
	 $('#updateUser').click(function(){
		 UpdateUser();
	 });
	 $('#id, #password').keyup( function(){
		 var id = $( '#id' ).val();
	     var pw = $( '#password' ).val();
		 if(id == "<%=before_id%>" && pw == "<%=before_password%>") {
			 $('#updateUser').prop("disabled", false);
			 $('#id').prop("disabled", true);
			 $('#password').prop("disabled", true);
		 }
	 });
});

function UpdateUser() {
	<%
	Connection conn = null;

	String db_url = "jdbc:mysql://localhost:3306/campus";
	String db_id = "root";                     //MySQL에 접속을 위한 계정의 ID
	String db_pwd = "1234";            //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(db_url, db_id, db_pwd);

	if(conn!=null) {
	%>	console.log("MySQL DB 연결 성공"); <%
	}

	PreparedStatement pstmt = null;
	String sql = "UPDATE T_SHOPPING_MEMBER SET MEMBER_ID = ?, MEMBER_PW = ?, MEMBER_NAME = ?, MEMBER_GENDER = ?, TEL1 = ?, TEL2 = ?, TEL3 = ?, SMSSTS_YN = ?, EMAIL1 = ?, EMAIL2 = ?, EMAILSTS_YN = ?, DEPTNO = ?, POSTCODE = ?, ROADADDRESS = ?, JIBUNADDRESS = ?, DETAILADDRESS = ?, MEMBER_BIRTH_Y = ?, MEMBER_BIRTH_M = ?, MEMBER_BIRTH_D = ?, MEMBER_BIRTH_GN = ?, RRN_FRONT = ?, RRN_BACK = ? WHERE MEMBER_ID = ? AND MEMBER_PW = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, phone1);
	pstmt.setString(6, phone2);
	pstmt.setString(7, phone3);
	pstmt.setString(8, smssts);
	pstmt.setString(9, mail1);
	pstmt.setString(10, mail2);
	pstmt.setString(11, emailsts);
	pstmt.setInt(12, deptno);
	pstmt.setString(13, postcode);
	pstmt.setString(14, roadAddr);
	pstmt.setString(15, jibunAddr);
	pstmt.setString(16, detailAddr);
	pstmt.setString(17, year);
	pstmt.setString(18, month);
	pstmt.setString(19, day);
	pstmt.setString(20, calendar);
	pstmt.setString(21, rrn);
	pstmt.setString(22, rrn_2);
	pstmt.setString(23, before_id);
	pstmt.setString(24, before_password);	

	%>
	console.log("<%=pstmt %>");
	<%
	int rows = pstmt.executeUpdate();	
	if(rows == 0) {
	%>	
		console.log("수정 실패");
	<%	
	}
	else {
	%>	
		console.log("정보 수정 성공");
		alert("정보 수정 성공");
	<%
		pstmt.close();
	}
	conn.close();
	%>
	window.location.href="login.jsp";
}
</script>
</head>
<body>
	<p><b>회원 정보 수정 - 본인 인증</b></p>
	<input type="text" name="id" id="id" placeholder="수정 전 아이디" ><br/>
	<input type="password" name="password" id="password" placeholder="수정 전 비밀번호"><br/>
	<input type="button" id="updateUser" value="정보 수정" disabled>
</body>
</html>