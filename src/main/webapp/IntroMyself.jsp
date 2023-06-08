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
<title>MinGi</title>
<link rel="stylesheet" href="css/Intro.css">
</head>
<body>
	<div id= "page-wrapper">
		<header>
		<div>
			<h1>자기소개 - 왕민기</h1>
			<p>2023년 05월 25일</p>
		</div>
	</header>
		<nav>
			<div class = "head">
				<span class = "head">
					<a href="https://github.com/mingi802/WEB_STUDY" target="_blank">GitHub</a>
					<a href="index.html" target="_blank">연습한 흔적</a>
				</span>
			</div>
		</nav>
			<section>
				<article class="art">
					<h3>공부중</h3>
					<ol class="test1">
						<li class="ol-left">
							HTML5
						</li>
						<li class="ol-left">
							CSS3	
						</li>
						<li class="ol-left">
							JavaScript	
						</li>
						<li class="ol-left">
							Java
						</li>
						<li class="ol-left">
							MySQL
						</li>
					</ol>
				</article>
				<article class="art">
					<div>
						<h3>공부할 때 도움이 됐던 블로그 글</h3>
						<ul class = "test2">
							<li class= "ul-left"><a href="https://dkswnkk.tistory.com/459" target="_blank">JAVA_인터페이스</a></li>
							<li class= "ul-left"><a href="https://bibi6666667.tistory.com/236" target="_blank">JAVA_리스트 선언 형태</a></li>
							<li class= "ul-left"><a href="https://velog.io/@suhyun-guri/HTML-%EC%A3%BC%EC%9A%94-%ED%83%9C%EA%B7%B8-%EC%A0%95%EB%A6%AC" target="_blank">HTML_주요 태그</a></li>
						</ul>		
					</div>
				</article>	
				<article class="art">
					<h3>취미</h3>
					<ul class="test2">
						<li class="ol-left">음악 감상</li>
						<li class="ol-left">유튜브</li>
						<li class="ol-left">게임</li>
					</ul>
					<div class="d-img">
					<fieldset>
					<legend><b><i>이미지 클릭 시 바로가기</i></b></legend>	
						<a href="https://youtu.be/oZuoYXK8aFE" target="_blank"><img class = "left-image" src="img/album_image.png"></a>
						<a href="https://www.youtube.com" target="_blank"><img class = "right-image" src="img/youtube_icon.png"></a>
					</fieldset>
					</div>
					<p>다음주부터는 자바스크립트를 배우게 되네요</p>
				</article>
			</section>
			
			<aside>
				<p><b>방명록</b></p>
				<%

					Connection conn = null;
			
					String url = "jdbc:mysql://localhost:3306/intro";
					String id = "root";                     //MySQL에 접속을 위한 계정의 ID
					String pwd = "1234";            //MySQL에 접속을 위한 계정의 암호
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection(url, id, pwd);
			
				%>
				<div class="guestbooktable">
				<table border = "1">
				<%
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "SELECT * FROM guestbook";
					pstmt = conn.prepareStatement(sql);
				
					// 4) 실행
					rs = pstmt.executeQuery();
				
					// 5) 결과를 테이블에 출력
					while (rs.next()) {
						String name = rs.getString("name");
						String date = rs.getString("date");
						String comment = rs.getString("comment");	
				%>
						<tr>
							<th><span style="float: left; text-align:left; font-size: 14px;"><%=name%>&emsp;</span><span class="date"><%=date%></span></th>
						</tr>
						<tr>
							<td style="text-align:left; font-size: 12px; word-break:break-all;"><%=comment%></td>
						</tr>
				<%
					}
					pstmt.close();
					rs.close();
					conn.close();
				%>
				</table>
				</div>
				<form action="./guestbook.jsp">
					<fieldset>
						<legend><i>방명록 남기기</i></legend>
						<input style="float:right; margin-right: 4px;" type="text" name="name" placeholder="이름"></input>
						<textarea name="comment" placeholder="댓글"></textarea>
						<input style="float:right;" type="reset" name="res" value="초기화"></input>
						<input style="float:right; margin-right: 5px;"type="submit" name="sub" value="등록"></input>
					</fieldset>
				</form>
			</aside>
		<footer>
			<div class = "foot">
				<span>
					<i>	
						<a href="https://github.com/mingi802/WEB_STUDY" target="_blank">GitHub</a>
						<a href="https://cafe.naver.com/dowhatevers">강사님 카페</a>
					</i>	
				</span>
			</div>
		</footer>
	</div>
</body>
</html>	