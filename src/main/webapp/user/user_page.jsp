<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	<%
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	Connection conn = null;
	String db_url = "jdbc:mysql://localhost:3306/campus";
	String db_id = "root";                     //MySQL�� ������ ���� ������ ID
	String db_pwd = "1234";            //MySQL�� ������ ���� ������ ��ȣ
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(db_url, db_id, db_pwd);

	if(conn!=null) {
	%>	console.log("MySQL DB ���� ����"); <%
	}

	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String sql = "SELECT * FROM T_SHOPPING_MEMBER WHERE MEMBER_ID = ? AND MEMBER_PW = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	%>
	console.log("<%=pstmt %>");
	<%
	rs = pstmt.executeQuery();
	if(rs.next()) {
		String name = rs.getString("MEMBER_NAME");
		%>
		document.getElementById("login_result").innerText = "Login Success";
		document.getElementById("id").value = "<%=id %>";
		document.getElementById("password").value = "<%=password %>";
		document.getElementById("hello_name").innerText = "hello, <%=name %>";
		<%
	} else {
		%>
		alert("�������� �ʴ� ���̵� �Ǵ� ��й�ȣ�Դϴ�.");
		window.location.href="./login.jsp";
		<%
	}
	%>
});
</script>
<script>
$(document).ready(function(){
	$('#logout').click(function (){
		alert("�α׾ƿ� �Ǿ����ϴ�.");
		window.location.replace("./login.jsp");
	});
});
</script>
</head>
<body>
<h1 id="login_result"></h1>
<p id="hello_name"></p>
<form action="./user_info.jsp">
	<input type='hidden' id='id' name='id'>
	<input type='hidden' id='password' name='password'>
	<input type='submit' value='�� ����'>&nbsp;
	<input type='button' value='�α׾ƿ�' id='logout'>
</form>
</body>
</html>