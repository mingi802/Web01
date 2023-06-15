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
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function deleteDept(deptno) {
	window.location.replace("./delete_dept.jsp?deptno="+deptno);
}

function updateDept(deptno) {
	window.location.replace("./update_dept.jsp?deptno="+deptno);
}

$(document).ready(function() {
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
	String sql = "SELECT * FROM T_DEPT";
	pstmt = conn.prepareStatement(sql);
	%>
	console.log("<%=pstmt %>");
	<%
	rs = pstmt.executeQuery();
	%>
	$("#go-to-add_dept").click(function () {
		window.location.href="./add_dept.jsp?admin-id=root&admin-password=1234";
	});
});


</script>

<body>
<h1>부서 편집 페이지</h1>
<input type="button" id="go-to-add_dept" value="부서 추가">
<table border="1" style="border-collapse: collapse;">
	<tr>
		<th><span>부서 명</span></th>
		<th><span>부서 번호</span></th>
		<th colspan="2"><span>수정/삭제</span></th>
	</tr>
	<%
		while (rs.next()) {
		String dname = rs.getString("dname");
		String deptno = rs.getString("deptno");
	%>
		<tr style="text-align:center;">
		<td><span><%=dname%></span></td>
		<td><span><%=deptno%></span></td>
		<td><input type=button value="수정" onClick='updateDept(<%=deptno%>)'></td>
		<td><input type=button value="삭제" onClick='deleteDept(<%=deptno%>)'></td>
		</tr>
	<%
	}
	rs.close();
	%>
 </table>
</body>
</html>