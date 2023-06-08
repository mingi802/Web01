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
PreparedStatement pstmt = null;

	if(request.getParameter("mgr") != "") {
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		int mgr = Integer.parseInt(request.getParameter("mgr"));
		String hiredate = request.getParameter("hiredate");
		int sal = Integer.parseInt(request.getParameter("sal"));
		int comm = Integer.parseInt(request.getParameter("comm"));
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		
		String sql = "INSERT INTO emp VALUES(NULL, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ename);
		pstmt.setString(2, job);
		pstmt.setInt(3, mgr);
		pstmt.setString(4, hiredate);
		pstmt.setInt(5, sal);
		pstmt.setInt(6, comm);
		pstmt.setInt(7, deptno);
		int rows = pstmt.executeUpdate();
		if(rows == 0) {
			%>
		<script>alert("insert fail")</script>			
			<% 
		}
		%>
<script>
alert("<%=ename%>" + " " + "<%=job%>" + " " + "<%=mgr%>" + " " + "<%=hiredate%>" + " " + 
		"<%=sal%>" + " " + "<%=comm%>" + " " + "<%=deptno%>");
</script>
		<%
	}	
	conn.close();
%>
<script>
	window.location.href="./jdbc.jsp";
</script>
</body>
</html>