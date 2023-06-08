<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.emp{
		width: 80px;
	}
</style>
</head>
<body>


<%

		Connection conn = null;

		String url = "jdbc:mysql://localhost:3306/emp_dept";
		String id = "root";                     //MySQL에 접속을 위한 계정의 ID
		String pwd = "1234";            //MySQL에 접속을 위한 계정의 암호
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pwd);

		out.println("<h1>MySQL DB 연결 성공</h1>");

		
		
		
	%>
	<div style="float:left; margin-right:50px;">
	<table border=1>
	<tr>
		<th>이름</th>
		<th>직업</th>
		<th>매니저 번호</th>
		<th>입사일</th>
	</tr>
	<%
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM emp";
	pstmt = conn.prepareStatement(sql);

	// 4) 실행
	rs = pstmt.executeQuery();

	// 5) 결과를 테이블에 출력
	while (rs.next()) {
		String ename = rs.getString("ename");
		String job = rs.getString("job");
		int mgr = rs.getInt("mgr");
		String hiredate = rs.getString("hiredate");	
%>
		<tr>
			<td><%=ename%></td>
			<td><%=job%></td>
			<td style="text-align:right;"><%=mgr%></td>	
			<td><%=hiredate%></td>
		</tr>
<%
	}
	pstmt.close();
	rs.close();
%>
</table>
</div>

<div style="float:left; margin-right:50px;">
	<table border=1>
	<tr>
		<th>부서 번호</th>
		<th>부서명</th>
		<th>지역</th>
	</tr>
<% 	
	pstmt = null;
	rs = null;
	sql = "SELECT * FROM dept";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();

	// 5) 결과를 테이블에 출력
	while (rs.next()) {
		int deptno = rs.getInt("deptno");
		String dname = rs.getString("dname");
		String loc = rs.getString("loc");	
%>
		<tr style="text-align:center;">
			<td><%=deptno%></td>
			<td><%=dname%></td>
			<td><%=loc%></td>	
		</tr>
<%
	}
%>
</table>
</div>
<div style="float:left; margin-right:50px;">
<form class = "f1" action="./empinsert.jsp">
	<fieldset>
	<legend><b>직원 정보 삽입</b></legend>
	<input class="emp" type="text" name ="ename" placeholder="이름"></input>
	<input class="emp" type="text" name = "job" placeholder="직업"></input>
	<input class="emp" type="number" name = "mgr" placeholder="매니저 번호"></input>
	<p style="margin: 5px auto; font-size: 14px">입사일: <input type="date" name = "hiredate"></input></p>
	<input class="emp" type="number" name = "sal" placeholder="급여"></input>
	<input class="emp" type="number" name = "comm" placeholder="성과금"></input>
	<input class="emp" type="number" name = "deptno" placeholder="부서번호"></input>
	</fieldset> 
	<input style="float:right; margin-right: 3px;"type="reset" name="res" placeholder="초기화"></input>
	<input style="float:right; margin-right: 10px;"type="submit" name="sub" placeholder="제출"></input>
</form>

</div>
</body>
</html>