<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Update

<%

String member_id = request.getParameter("member_id");
String member_pw = request.getParameter("member_pw");

out.println("<table border=1>");
out.println("<tr><td>Id</td></tr>");


	out.println("<tr>");
	
	out.println("<td>id:"+member_id+"</td>");
	out.println("<td>pw:"+member_pw+"</td>");

	out.println("</tr>");

out.println("</table>");


%>


</body>
</html>
