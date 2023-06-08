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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
<%

String member_id = request.getParameter("member_id");
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
String sql = "DELETE FROM T_SHOPPING_MEMBER WHERE MEMBER_ID = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, member_id);

%>
console.log("<%=pstmt %>");
<%
int rows = pstmt.executeUpdate();	
if(rows == 0) {
%>	
	console.log("삭제 실패");
<%	
}
else {
%>	
	console.log("회원 삭제 성공");
	alert("회원 삭제 성공");
<%
	pstmt.close();
}
conn.close();
%>
window.location.href="./show_users.jsp?admin-id=root&admin-password=1234";
</script>
</head>
<body>
</body>
</html>