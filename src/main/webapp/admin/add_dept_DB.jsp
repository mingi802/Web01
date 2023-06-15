<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	<%
	String dname=request.getParameter("dname");
	int deptno=Integer.parseInt(request.getParameter("deptno"));
	String loc=request.getParameter("loc");
	%>
	console.log("<%=dname%>", "<%=deptno%>, <%=loc %>");
	
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
	String sql = "INSERT INTO T_DEPT VALUES (?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, deptno);
	pstmt.setString(2, dname);
	pstmt.setString(3, loc);
	%>
	console.log("<%=pstmt %>");
	<%
	int rows = pstmt.executeUpdate();	
	if(rows == 0) {
	%>	
		console.log("추가 실패");
	<%	
	}
	else {
	%>	
		console.log("부서 추가 성공");
		alert("부서 추가 성공");
	<%
		pstmt.close();
	}
	conn.close();
	%>
	window.location.href="./edit_dept.jsp";
});

</script>
</head>
<body>
</body>
</html>