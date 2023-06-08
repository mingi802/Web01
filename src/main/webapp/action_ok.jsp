<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ page import="java.io.BufferedReader,java.io.InputStreamReader" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String IP=request.getParameter("IP");
String text=request.getParameter("input1");//will return the value 'text'
String RIP = request.getRemoteAddr();
	
%>
<script>
alert("hello? <%=IP %>, <%= RIP%>");
</script>
<%=text %>
</body>
</html>