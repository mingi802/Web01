<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	%>
	 $('#delUser').click(function(){
		 delUser();
	 });
	 $('#id, #password').keyup( function(){
		 var id = $( '#id' ).val();
	     var pw = $( '#password' ).val();
		 if(id == "<%=id%>" && pw == "<%=password%>") {
			 $('#delUser').prop("disabled", false);
			 $('#id').prop("disabled", true);
			 $('#password').prop("disabled", true);
		 }
	 });
});

function delUser() {
	<%
	Connection conn = null;

	String db_url = "jdbc:mysql://localhost:3306/campus";
	String db_id = "root";                     //MySQL�� ������ ���� ������ ID
	String db_pwd = "1234";            //MySQL�� ������ ���� ������ ��ȣ
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(db_url, db_id, db_pwd);

	if(conn!=null) {
	%>	console.log("MySQL DB ���� ����"); <%
	}

	PreparedStatement pstmt = null;
	String sql = "DELETE FROM T_SHOPPING_MEMBER WHERE MEMBER_ID = ? AND MEMBER_PW = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);	

	%>
	console.log("<%=pstmt %>");
	<%
	int rows = pstmt.executeUpdate();	
	if(rows == 0) {
	%>	
		console.log("���� ����");
	<%	
	}
	else {
	%>	
		console.log("ȸ�� Ż�� ����");
		alert("ȸ�� Ż�� ����");
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
	<p><b>ȸ�� Ż�� - ���� ����</b></p>
	<input type="text" name="id" id="id" placeholder="id" ><br/>
	<input type="password" name="password" id="password" placeholder="password"><br/>
	<input type="button" id="delUser" value="ȸ�� Ż��" disabled>
</body>
</html>