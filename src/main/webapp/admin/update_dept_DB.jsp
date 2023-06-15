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
	String sql = "UPDATE T_DEPT SET DEPTNO = ?, DNAME = ?, LOC = ? WHERE DEPTNO = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, deptno);
	pstmt.setString(2, dname);
	pstmt.setString(3, loc);
	pstmt.setInt(4, deptno);
	%>
	console.log("<%=pstmt %>");
	<%
	int rows = pstmt.executeUpdate(); 

	if(rows == 0) {
	%>	
		console.log("수정 실패");
		alert("해당 부서에 재직 중인 직원이 있는 경우 부서 번호는 수정하실 수 없습니다.");
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
	window.location.replace("./edit_dept.jsp");
});

</script>
</head>
<body>
</body>
</html>