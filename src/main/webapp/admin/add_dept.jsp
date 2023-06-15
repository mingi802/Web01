<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/SignUpForm.css">
<style>
	#test {
		font-size: 10px;
		color: red;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
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
	String sql = "SELECT COUNT(*) FROM T_DEPT";
	pstmt = conn.prepareStatement(sql);
	%>
	console.log("<%=pstmt %>");
	<%
	int len = 0;
	rs = pstmt.executeQuery();
	if(rs.next()) {
		len = rs.getInt("COUNT(*)");
	}
	sql = "SELECT * FROM T_DEPT";
	pstmt = conn.prepareStatement(sql);
	%>
	console.log("<%=pstmt %>");
	<%
	int[] deptno_arr = new int[len];
	int i = 0;
	int j = 0;
	rs = pstmt.executeQuery();
	while(rs.next()) {
		deptno_arr[i++] = rs.getInt("deptno");
	}
	i--;
	%>
	var test1 = new Array();
	var i = 0;
	<%
	for(i = 0; i < len; i++) {
		%>
		test1[i++] = <%=deptno_arr[i]%>;
		<%
	}
	%>
	console.log(typeof(test1[0]));
	$('#deptno').on('keyup, change', function(){
		 var deptno = $( '#deptno' ).val();
		 
		 console.log(test, deptno, test1.includes(parseInt(deptno)));
		 if(test1.includes(parseInt(deptno))) {
			 $('#add').prop("disabled", true);
			 $( '#test' ).text("이미 존재하는 부서 번호 입니다.");
		 }
		 else {
			 $('#add').prop("disabled", false);
			 $( '#test' ).text("");
		 }
	});
});
</script>
</head>
<body>
<form name="loginform" action="./add_dept_DB.jsp" method="GET" accept-charset="UTF-8">
		<table class="form-table">
			<tr> 
				<th class="title" colspan="2">부서 추가</th>
			</tr>
			<tr>
				<td class="title">부서 명</td>
				<td>
					<input type="text" name="dname" id="dname">
				</td>
			</tr>
			<tr>
				<td class="title">부서번호</td>
				<td>
					<input type="number" name="deptno" id="deptno"><br>
					<span id="test"></span>
				</td>
			</tr>
			<tr>
				<td class="title">지역</td>
				<td><input type="text" name="loc"></td>	
			</tr>
			<tr align="right">
				<td class="title" colspan="2"><input type="submit" id="add" value="추가">&nbsp;<input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form>
</body>
</html>