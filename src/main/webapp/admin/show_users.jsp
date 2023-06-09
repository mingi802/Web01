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
<style>
.searchDiv {
	float:right;
	clear:right;
}

.title {
	text-align:center;
}

.memtable {
	margin-top:20px;
	clear:right;
	float:right;
}

section {
	margin: 0 auto;
	width:90%;
}

table {
word-break: keep-all;
}

#searchmem {
	float:right;
	clear:right;
}

#first-search-bar {
	float:right;
	clear:right;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
	$(document).ready(function () {
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
		String sql = (request.getParameter("sql") == null) ? "SELECT * FROM T_SHOPPING_MEMBER WHERE " : request.getParameter("sql");
		
		if((request.getParameter("admin-id") != null && request.getParameter("admin-password") != null) && (request.getParameter("admin-id").equals("root") && request.getParameter("admin-password").equals("1234"))) {
			sql = "SELECT * FROM T_SHOPPING_MEMBER";
		}
		
		int len = (request.getParameter("count") == null) ? 0 : Integer.parseInt(request.getParameter("count"));
		String[] search_opt = new String[len]; 
		String[] search_text = new String[len];
		String[] and_or = new String[len];
		
		for(int i = 0; i < search_text.length; i++) {
			if(request.getParameter("search-text"+i) != null) {
				search_opt[i] = request.getParameter("search-opt"+i);
				search_text[i] = request.getParameter("search-text"+i);
			}
			if(i > 0) {
				and_or[i] = request.getParameter("and-or"+i);
			}
			%>console.log("<%=search_opt[i]+" "+search_text[i]+" "+and_or[i]%>");<%
		}
		
		
		for(int i = 0; i < search_text.length; i++) {
			if((search_opt[i] != null || search_text[i] != null)) {
				if(i > 0) {
					sql += and_or[i]+" ";
				}
				if(search_opt[i].split(",")[0].equals(search_opt[i])) {
					sql += search_opt[i]+" = "+"'"+search_text[i]+"' ";
				}
				else if(search_opt[i].split(",")[0].equals("TEL1")) {
					search_text[i] = search_text[i].replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", "");
					sql += "CONCAT("+search_opt[i].split(",")[0]+","+search_opt[i].split(",")[1]+","+search_opt[i].split(",")[2]+")"+" = "+"'"+search_text[i]+"'";
				}
				else if(search_opt[i].split(",")[0].equals("EMAIL1")) {
					search_text[i] = search_text[i].replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9.]", "");
					sql += "CONCAT("+search_opt[i].split(",")[0]+","+search_opt[i].split(",")[1]+")"+" = "+"'"+search_text[i]+"'";
				}
				else if(search_opt[i].split(",")[0].equals("MEMBER_BIRTH_Y")) {
					search_text[i] = search_text[i].replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", "");
					sql += "CONCAT("+search_opt[i].split(",")[0]+","+search_opt[i].split(",")[1]+","+search_opt[i].split(",")[2]+")"+" = "+"'"+search_text[i]+"'";
				}
				else {
				}
			}
			else {
				break;
			}
		}
		
		pstmt = conn.prepareStatement(sql);
		%>
		console.log("<%=sql %>");
		<%
		rs = pstmt.executeQuery();
		%>
		
		function updateMem(member_id, member_pw)
		{
			alert("update");	
			//alert(id);
			
			window.location.href="../user/AlterUserInfo.jsp?id="+member_id+"&password="+member_pw;
			
		}


		function deleteMem(member_id)
		{
			alert("delete");
			//alert(id);
			
			window.location.replace("./delete.jsp?member_id="+member_id);
		}
		
		var count = 0;
		$('#show-all').click(function() {
			alert("show all of user");
			window.location.href="./show_users.jsp?sql=SELECT * FROM T_SHOPPING_MEMBER";
		});
		
		$('#tag-add').click(function() {
				count++;
				let countStr = count.toString().padStart(2, "0");
				
				var obj = document.getElementById("search-form");
				var hidden_count = document.getElementById("count");
				var searchDiv = document.createElement("div");
				var newTag = document.createElement("select");
				var tagNum = document.createElement("span");
				var tags = document.getElementsByName("search-opt0");
				var and = document.createElement('input');
				var andlabel = document.createElement('label');
				var andlabeltext = document.createTextNode('AND');
				var or = document.createElement('input');
				var orlabel = document.createElement('label');
				var orlabeltext = document.createTextNode('OR');
				var oneSpace = document.createElement("span");
				var oneSpace2 = document.createElement("span");
				var text = document.createElement('input');
				var delTag = document.createElement('input');
/*--------------------------------------------------------------------------*/				
				searchDiv.setAttribute("class", "searchDiv"); 
				searchDiv.setAttribute("id", "searchDiv"+count); 
				
				newTag.setAttribute("id", "search-opt"+count);
				newTag.setAttribute("name", "search-opt"+count);
/*--------------------------------------------------------------------------*/				
				and.type = 'radio';
				and.name = 'and-or'+count;
				and.id = 'and'+count;
				and.value = 'and';
				and.checked = true;
				andlabel.htmlFor = 'and'+count;
				andlabel.appendChild(andlabeltext);
				
			    or.type = 'radio';
			    or.name = 'and-or'+count;
			    or.id = 'or'+count;
			    or.value = 'or';			
				orlabel.htmlFor = 'or'+count;							 
			    orlabel.appendChild(orlabeltext);
			    
			    text.type = 'text';
				text.name = 'search-text'+count;
				text.id = 'search-text'+count;
				
				delTag.type = 'button';
				delTag.id = 'delete-tag';
				delTag.value = '조건 삭제';
				
/*--------------------------------------------------------------------------*/
				tagNum.innerHTML = "<br><b>+ 조건 "+countStr+"</b>&nbsp;"
				oneSpace.innerHTML = "&nbsp;"
				oneSpace2.innerHTML = "&nbsp;"
/*--------------------------------------------------------------------------*/				
				
				//newDiv.style.backgroundColor = "yellow";
				
				for(var i = 0; i < tags[0].length; i++){
					let opt = document.createElement("option");
		    		opt.value = tags[0].options[i].value;
		    		opt.text = tags[0].options[i].text;
		    		newTag.appendChild(opt);
				}
				
				obj.appendChild(searchDiv);				
				searchDiv.appendChild(tagNum);
				searchDiv.appendChild(and);
				searchDiv.appendChild(andlabel);
				searchDiv.appendChild(or);
				searchDiv.appendChild(orlabel);
				searchDiv.appendChild(oneSpace);
				searchDiv.appendChild(newTag);
				searchDiv.appendChild(oneSpace2);
				searchDiv.appendChild(text);
				searchDiv.appendChild(delTag);
				
				delTag.onclick = function() {
					p = this.parentElement;
					p.remove();
				}
				// 익명 함수 : 바로 그 이벤트를 실행하기위해 이름을 정하지 않고 바로실행
		//		newDiv.onclick = function(){
		//		p = this.parentElement; //부모 HTML 태그요소
		//		p.removeChild(this); // 자신을 부모 태그로 부터 제거
		//		}
				
				hidden_count.value = count;
		});
	});
	
	</script>
<body>
	<div class="page">
		<header>
		<h1 class="title">전체 회원 정보</h1>
		</header>
		<section>
			<article>
				<div id="searchmem">
					<form id="search-form" action="#">
						<div id="first-search-bar">
						<span><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검색</b></span>
						<select name="search-opt0">
							<option value="MEMBER_ID">아이디</option>
							<option value="MEMBER_PW">비밀번호</option>
							<option value="MEMBER_NAME">이름</option>
							<option value="MEMBER_GENDER">성별</option>
							<option value="TEL1,TEL2,TEL3">전화번호</option>
							<option value="SMSSTS_YN">문자 수신 동의 여부</option>
							<option value="EMAIL1,EMAIL2">이메일</option>
							<option value="EMAILSTS_YN">이메일 수신 동의 여부</option>
							<option value="POSTCODE">우편 번호</option>
							<option value="ROADADDRESS">도로명 주소</option>
							<option value="JIBUNADDRESS">지번 주소</option>
							<option value="DETAILADDRESS">상세 주소</option>
							<option value="MEMBER_BIRTH_Y,MEMBER_BIRTH_M,MEMBER_BIRTH_D">생년월일</option>
							<option value="MEMBER_BIRTH_GN">양력/음력</option>
							<option value="JOINDATE">가입 날짜</option>
						</select>
						<input type="text" name="search-text0">
						<input type="submit" id="search-btn" value="검색">
						<input type="button" id="tag-add" value="조건 추가">
						<input type="button" id="show-all" value="전체 출력">
						<input type="hidden" name="count" id="count">
						</div>
					</form>
				</div>
			</article>
			<article>
				<div  class="memtable">
					<table border="1" style="border-collapse: collapse;">
						<tr>
							<th><span>아이디</span></th>
							<th><span>비밀번호</span></th>
							<th><span>이름</span></th>
							<th><span>성별</span></th>
							<th><span>전화번호</span></th>
							<th><span>문자 수신 동의 여부</span></th>
							<th><span>이메일</span></th>
							<th><span>이메일 수신 동의 여부</span></th>
							<th><span>우편 번호</span></th>
							<th><span>도로명 주소</span></th>
							<th><span>지번 주소</span></th>
							<th><span>상세 주소</span></th>
							<th><span>생년월일</span></th>
							<th><span>양력/음력</span></th>
							<th><span>가입 날짜</span></th>
							<th><span>정보 갱신</span></th>
							<th><span>정보 삭제</span></th>
						</tr>
					<%
						while (rs.next()) {
						String MEMBER_ID = rs.getString("MEMBER_ID");
						String MEMBER_PW = rs.getString("MEMBER_PW");
						String MEMBER_NAME = rs.getString("MEMBER_NAME");
						String MEMBER_GENDER = rs.getString("MEMBER_GENDER");
						String TEL = rs.getString("TEL1")+"-"+rs.getString("TEL2")+"-"+rs.getString("TEL3");
						String SMSSTS_YN = rs.getString("SMSSTS_YN");
						String EMAIL = rs.getString("EMAIL1")+"@"+rs.getString("EMAIL2");
						String EMAILSTS_YN = rs.getString("EMAILSTS_YN");
						String POSTCODE = rs.getString("POSTCODE");
						String ROADADDRESS = rs.getString("ROADADDRESS");
						String JIBUNADDRESS = rs.getString("JIBUNADDRESS");
						String DETAILADDRESS = rs.getString("DETAILADDRESS");	
						String MEMBER_BIRTH_DATE = rs.getString("MEMBER_BIRTH_Y")+"-"+rs.getString("MEMBER_BIRTH_M")+"-"+rs.getString("MEMBER_BIRTH_D");
						String MEMBER_BIRTH_GN = rs.getString("MEMBER_BIRTH_GN");
						String JOINDATE = rs.getString("JOINDATE");
					%>
						<tr style="text-align:center;">
							<td><span><%=MEMBER_ID%></span></td>
							<td><span><%=MEMBER_PW%></span></td>
							<td><span><%=MEMBER_NAME%></span></td>
							<td><span><%=MEMBER_GENDER%></span></td>
							<td><span><%=TEL%></span></td>
							<td><span><%=SMSSTS_YN%></span></td>
							<td><span><%=EMAIL%></span></td>
							<td><span><%=EMAILSTS_YN%></span></td>
							<td><span><%=POSTCODE%></span></td>
							<td><span><%=ROADADDRESS%></span></td>
							<td><span><%=JIBUNADDRESS%></span></td>
							<td><span><%=DETAILADDRESS%></span></td>
							<td><span><%=MEMBER_BIRTH_DATE%></span></td>
							<td><span><%=MEMBER_BIRTH_GN%></span></td>
							<td><span><%=JOINDATE%></span></td>
							<td><input type=button value=Update onClick='updateMem("<%=MEMBER_ID%>", "<%=MEMBER_PW%>");'></td>
							<td><input type=button value=Delete onClick='deleteMem("<%=MEMBER_ID%>");'></td>
							</tr>
					<%
						}
					%>
					</table>
				</div>
			</article>
		</section>
	</div>
</body>
</html>