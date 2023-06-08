<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.title {
	text-align:center;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
	$(document).ready(function () {
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
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "";
		String search_opt = request.getParameter("search-opt");
		String search_text = request.getParameter("search-text");
		if(search_opt != null || search_text != null) {
			if(search_opt.split(",")[0].equals(search_opt)) {
				sql = "SELECT * FROM T_SHOPPING_MEMBER WHERE "+search_opt+" = "+"'"+search_text+"'";
			}
			else if(search_opt.split(",")[0].equals("TEL1")) {
				search_text = search_text.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", "");
				sql = "SELECT * FROM T_SHOPPING_MEMBER WHERE CONCAT("+search_opt.split(",")[0]+","+search_opt.split(",")[1]+","+search_opt.split(",")[2]+")"+" = "+"'"+search_text+"'";
			}
			else if(search_opt.split(",")[0].equals("EMAIL1")) {
				search_text = search_text.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9.]", "");
				sql = "SELECT * FROM T_SHOPPING_MEMBER WHERE CONCAT("+search_opt.split(",")[0]+","+search_opt.split(",")[1]+")"+" = "+"'"+search_text+"'";
			}
			else if(search_opt.split(",")[0].equals("MEMBER_BIRTH_Y")) {
				search_text = search_text.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", "");
				sql = "SELECT * FROM T_SHOPPING_MEMBER WHERE CONCAT("+search_opt.split(",")[0]+","+search_opt.split(",")[1]+","+search_opt.split(",")[2]+")"+" = "+"'"+search_text+"'";
			}
		}
		else {
			sql = "SELECT * FROM T_SHOPPING_MEMBER";	
		}
		pstmt = conn.prepareStatement(sql);
		%>
		console.log("<%=pstmt %>");
		<%
		rs = pstmt.executeQuery();
		%>
		
		function updateMem(member_id, member_pw)
		{
			alert("update");	
			//alert(id);
			
			window.location.href="../user/AlterUserInfo.jsp?id="+member_id+"&password="+member_pw;
			
		}


		function deleteMem(member_id)
		{
			alert("delete");
			//alert(id);
			
			window.location.replace("./delete.jsp?member_id="+member_id);
		}
	});
	</script>
<body>
	<h1 class="title">전체 회원 정보</h1>
	<form action="#">
	<span><b>검색</b></span>
		<select name="search-opt">
			<option value="MEMBER_ID">아이디</option>
			<option value="MEMBER_PW">비밀번호</option>
			<option value="MEMBER_NAME">이름</option>
			<option value="MEMBER_GENDER">성별</option>
			<option value="TEL1,TEL2,TEL3">전화번호</option>
			<option value="SMSSTS_YN">문자 수신 동의 여부</option>
			<option value="EMAIL1,EMAIL2">이메일</option>
			<option value="EMAILSTS_YN">이메일 수신 동의 여부</option>
			<option value="POSTCODE">우편 번호</option>
			<option value="ROADADDRESS">도로명 주소</option>
			<option value="JIBUNADDRESS">지번 주소</option>
			<option value="DETAILADDRESS">상세 주소</option>
			<option value="MEMBER_BIRTH_Y,MEMBER_BIRTH_M,MEMBER_BIRTH_D">생년월일</option>
			<option value="MEMBER_BIRTH_GN">양력/음력</option>
			<option value="JOINDATE">가입 날짜</option>
		</select>
		<input type="text" name="search-text">
		<input type="submit" id="search-btn" value="검색">
	</form>
	<br>
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th><span>아이디</span></th>
			<th><span>비밀번호</span></th>
			<th><span>이름</span></th>
			<th><span>성별</span></th>
			<th><span>전화번호</span></th>
			<th><span>문자 수신 동의 여부</span></th>
			<th><span>이메일</span></th>
			<th><span>이메일 수신 동의 여부</span></th>
			<th><span>우편 번호</span></th>
			<th><span>도로명 주소</span></th>
			<th><span>지번 주소</span></th>
			<th><span>상세 주소</span></th>
			<th><span>생년월일</span></th>
			<th><span>양력/음력</span></th>
			<th><span>가입 날짜</span></th>
			<th><span>정보 갱신</span></th>
			<th><span>정보 삭제</span></th>
		</tr>
	<%
		while (rs.next()) {
		String MEMBER_ID = rs.getString("MEMBER_ID");
		String MEMBER_PW = rs.getString("MEMBER_PW");
		String MEMBER_NAME = rs.getString("MEMBER_NAME");
		String MEMBER_GENDER = rs.getString("MEMBER_GENDER");
		String TEL = rs.getString("TEL1")+"-"+rs.getString("TEL2")+"-"+rs.getString("TEL3");
		String SMSSTS_YN = rs.getString("SMSSTS_YN");
		String EMAIL = rs.getString("EMAIL1")+"@"+rs.getString("EMAIL2");
		String EMAILSTS_YN = rs.getString("EMAILSTS_YN");
		String POSTCODE = rs.getString("POSTCODE");
		String ROADADDRESS = rs.getString("ROADADDRESS");
		String JIBUNADDRESS = rs.getString("JIBUNADDRESS");
		String DETAILADDRESS = rs.getString("DETAILADDRESS");	
		String MEMBER_BIRTH_DATE = rs.getString("MEMBER_BIRTH_Y")+"-"+rs.getString("MEMBER_BIRTH_M")+"-"+rs.getString("MEMBER_BIRTH_D");
		String MEMBER_BIRTH_GN = rs.getString("MEMBER_BIRTH_GN");
		String JOINDATE = rs.getString("JOINDATE");
	%>
		<tr  style="text-align:center;">
			<td><span><%=MEMBER_ID%></span></td>
			<td><span><%=MEMBER_PW%></span></td>
			<td><span><%=MEMBER_NAME%></span></td>
			<td><span><%=MEMBER_GENDER%></span></td>
			<td><span><%=TEL%></span></td>
			<td><span><%=SMSSTS_YN%></span></td>
			<td><span><%=EMAIL%></span></td>
			<td><span><%=EMAILSTS_YN%></span></td>
			<td><span><%=POSTCODE%></span></td>
			<td><span><%=ROADADDRESS%></span></td>
			<td><span><%=JIBUNADDRESS%></span></td>
			<td><span><%=DETAILADDRESS%></span></td>
			<td><span><%=MEMBER_BIRTH_DATE%></span></td>
			<td><span><%=MEMBER_BIRTH_GN%></span></td>
			<td><span><%=JOINDATE%></span></td>
			<td><input type=button value=Update onClick='updateMem("<%=MEMBER_ID%>", "<%=MEMBER_PW%>");'></td>
			<td><input type=button value=Delete onClick='deleteMem("<%=MEMBER_ID%>");'></td>
			</tr>
	<%
		}
	%>
	</table>
</body>
</html>