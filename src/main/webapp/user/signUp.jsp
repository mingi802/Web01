<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/SignUpForm.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
	    $('#idOverlap').click(function(){
	    	var _id = $("#id").val();
		    if(_id==''){
		   	 alert("ID를 입력하세요");
		   	 return;
		    }
		  
		    $.ajax({
		       type:"post",
		       async:false,  
		       url:"idOverlap.jsp",
		       dataType:"json",
		       data: {id:_id},
		       success:function (data,textStatus){
		    	  console.log(JSON.stringify(data), _id);
		          if(data.result=='false'){
		       	    alert("사용할 수 있는 ID입니다.");
		       	    $('#idOverlap').prop("disabled", true);
		       	 	$('#id').prop("disabled", true);
		          }else{
		        	  alert("사용할 수 없는 ID입니다.");
		        	  $('#id').focus();
		          }
		       },
		       error:function(data,textStatus){
		    	  console.log(JSON.stringify(data), _id);
		    	  alert("에러가 발생했습니다.");ㅣ
		       },
		       complete:function(data,textStatus){
		          //alert("작업을완료 했습니다");
		       }
		    });
	    });
	});
	function alterID() {
		 $('#idOverlap').prop("disabled", false);
    	 $('#id').prop("disabled", false);
	}
	
	
	
		function setYear(year) {
			var rrn = document.loginform.rrn;
			var rrn_year = rrn.value;
			if(rrn_year.length >= 2) {
				rrn.value = year.value.substring(2) + rrn_year.substring(2);
			}
			else
			rrn.value = year.value.substring(2);
		}
	
		function setMonth(mon) {
			var rrn = document.loginform.rrn;
			var rrn_month = rrn.value;
			if(rrn_month.length == 4) {
				rrn.value = rrn_month.substring(0,2) + mon.value;
			}
			else if(rrn_month.length == 6) {
				rrn.value = rrn_month.substring(0,2) + mon.value + rrn_month.substring(4,6);
			}
			else
			rrn.value += mon.value;
		}
		
		function setDay(day) {
			var rrn = document.loginform.rrn;
			var rrn_day = rrn.value;
			if(rrn_day.length >= 6) {
				rrn.value = rrn_day.substring(0,4) + day.value;
			}
			else
			rrn.value += day.value; 		
		}
		
		function getValue(gender) {
			alert(gender.value);
		}
		
		function setRrn_2() {
			var now = new Date();
	    	var now_year = parseInt(now.getFullYear().toString().substring(2));
	    	var bir_year = parseInt(document.loginform.year.value.substring(2));
	    	var gender = document.loginform.gender.value;
	    	var rrn_gen_temp = (gender == "male") ? [1,3] : [2,4];
	    	var rrn_gen = (now_year >= bir_year) ? rrn_gen_temp[1] : rrn_gen_temp[0];
	    	var rrn_2 = document.loginform.rrn_2;
	    	console.log(now_year, bir_year, now_year >= bir_year, rrn_gen);
	    	rrn_2.value = rrn_gen;
	    	rrn_2.disabled=false;
		}
	
	function validateForm() {
	    var id = document.loginform.id.value;
	    var password = document.loginform.password.value;
	    var confirm_password = document.loginform.confirm_password.value;
	    var name = document.loginform.name.value;
	    var phone_number = document.loginform.phone1.value +"-"+ document.loginform.phone2.value +"-"+ document.loginform.phone3.value;
	   	var email = document.loginform.mail1.value +"@"+ document.loginform.mail2.value; 
	   	var gender = document.loginform.gender.value;
	   	var rrn_gen = (gender == "male") ? [1,3] : [2,4];
	   	var birth_date = document.loginform.year.value+"년 "+document.loginform.month.value+"월 "+document.loginform.day.value+"일";
	   	var rrn = document.loginform.rrn.value + "-" + document.loginform.rrn_2.value; 
	   	var postcode = document.loginform.postcode.value;
    	
	    var smssts_is_checked = document.getElementById("smssts").checked;
	    var emailsts_is_checked = document.getElementById("emailsts").checked;
	    	
	    if(emailsts_is_checked) {
	    	document.getElementById("hidden-emailsts").disabled=true;
	    }
	    if(smssts_is_checked) {
	    	document.getElementById("hidden-smssts").disabled=true;
	    }
	    	
	    alert(id+" "+password+" "+name+" "+phone_number+" "+email+" "+gender+" "+birth_date+" "+rrn+" "+rrn_gen+" "+postcode);
	    	
	    if(document.loginform.id.disabled) {
	    	console.log("고유한 아이디");
	    }
	    else {
	    	alert("아이디 중복 확인 필수");
	    	document.loginform.id.focus();
	    	return false;
	    }
	    //이 문서의 charset이 utf-8이 아니면 힣이 깨지므로 주의하자.
	    if((/^(?=.*[^ㄱ-ㅎ가-힣A-Za-z0-9])(?=.*[0-9])(?=.*[a-zA-Z]).{5,8}$/).test(id) // <- 이 정규표현식은 한글,영어,숫자를 제외한 문자(특수문자)와 숫자, 영어가 문자열에 있는 지, 길이는 5~8이 맞는 지 검사해준다.  
	   			&& id.match(/[^ㄱ-ㅎ가-힝A-Za-z0-9]/g).length == 1) {	// <- match()는 괄호안에 정규표현식이 문자열 내부에 존재하면 그 값을 배열로 하나만 가져오는데, 표현식 끝에 g(global)을 달아주면 문자열 끝까지 검사하여 조건이 일치하는 값을 전부 가져온다. 
	    															// 괄호 안 표현식은 특수문자를 추출해낸다. 즉, 저 배열의 길이가 1이 넘으면 id안에 특수문자가 2개 이상 있다는 뜻이므로 올바른 아이디 형식이 아님을 검사할 수 있다. 
	    	console.log("아이디 형식 통과");	
	    } else {
	    	alert("올바르지 않은 아이디 형식(영어,숫자,특수문자1개로 구성된 5~8자리의 문자열)");
	    	 document.loginform.id.focus();
	    	 return false;
	    }
	    	
	    if((/^(?=.*[^ㄱ-ㅎ가-힣A-Za-z0-9])(?=.*[0-9])(?=.*[a-zA-Z]).{8,}$/).test(password)) {
	    	console.log("비밀번호 형식 통과");
    	} else {
    		alert("올바르지 않은 비밀번호 형식(영어,숫자,특수문자로 구성된 8자리 이상의 문자열)");
    		document.loginform.password.focus();
    		return false;
    	}
	
	    if(password==confirm_password) {
	    	console.log("비밀번호 일치"); 		   		    			
    	} else { 
    		alert("비밀번호 맞지 않음");
    		document.loginform.confirm_password.focus();
    		return false;
    	}	
	    	
	    if(name!="") {	    	
	    	console.log("이름 형식 통과");	
		} else {
			alert("이름 입력 필수");
			document.loginform.name.focus();
			return false;
		}
	    	
		if(phone_number.length == 13) {
			console.log("전화번호 형식 통과");				
		} else {
			alert("전화번호 입력 필수");
			document.loginform.phone2.focus();
			return false;
		}	
			
		if(email.length > 9 && document.loginform.mail2.value != "" && document.loginform.mail2.value.includes(".")) {
			console.log("이메일 형식 통과");			
		} else {
			alert("이메일 입력 필수");
			document.loginform.mail1.focus();
			return false;
		}		    
			
		if(rrn.length == 14 && rrn_gen.includes(parseInt(rrn.charAt(7)))) {
			console.log("선택한 성별과 주민등록번호에 기재된 성별이 동일함");
		} else {
			alert("선택한 성별과 주민등록번호에 기재된 성별 틀림 또는 잘못된 주민번호 길이");
			document.loginform.rrn.focus();
			return false;
		}		   
			
		if(postcode.length == 5) {
			console.log("우편번호 형식 통과");
			document.loginform.id.disabled = false;
			return true;
		} else {
			alert("우편번호 선택 필수");
			document.loginform.postcode.focus();
			return false;
		}	
	}
	    
	    window.onload = function(){
	    	setDateSelectBox();
	    };    

	    function setDateSelectBox(){
	    	var now = new Date();
	    	var now_year = now.getFullYear();
	    	var selbox_year = document.loginform.year;
	    	var selbox_day = document.loginform.day;
			var selbox_month = document.loginform.month;
	    	
	    	var optgp_year = document.createElement("optgroup");
	    	optgp_year.label = "출생년도";
	    	for(var i = now_year; i >= 1900; i--){
	    		var option = document.createElement("option");
	    		option.value = i.toString();
	    		option.text = i.toString()+"년";
	    		optgp_year.appendChild(option);
	    	}
	    	selbox_year.appendChild(optgp_year);
	    	
	    	var optgp_day = document.createElement("optgroup");
	    	optgp_day.label = "출생일";
	    	for(var i = 1; i <= 31; i++){
	    		var option = document.createElement("option");
	    		option.value = i.toString().padStart(2, "0");
	    		option.text = i.toString().padStart(2, "0")+"일";
	    		optgp_day.appendChild(option);
	    	}
	    	selbox_day.appendChild(optgp_day);
	    	
	    	var optgp_month = document.createElement("optgroup");
	    	optgp_month.label = "출생월";
	    	for(var i = 1; i <= 12; i++){
	    		var option = document.createElement("option");
	    		option.value = i.toString().padStart(2, "0");
	    		option.text = i.toString().padStart(2, "0")+"월";
	    		optgp_month.appendChild(option);
	    	}
	    	selbox_month.appendChild(optgp_month);
	    }
	    
	    function setMail(mail3) {
	    	var mail2 = document.loginform.mail2;
	    	if(mail3.selectedIndex == 0) {
	    		mail2.value = "";
	    	}
	    	else {
	    		mail2.value = mail3.value;
	    	}
	    }
	    
	    
	    
	        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	        function set_postcode() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                    var roadAddr = data.roadAddress; // 도로명 주소 변수
	                    var extraRoadAddr = ''; // 참고 항목 변수

	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraRoadAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }

	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    document.getElementById('postcode').value = data.zonecode;
	                    document.getElementById("roadAddr").value = roadAddr;
	                    document.getElementById("jibunAddr").value = data.jibunAddress;
	                    
	                }
	            }).open();
	        }
</script>	
<title>Insert title here</title>
</head>
<body>
	<form name="loginform" action="./signUp_ok.jsp" method="GET" onSubmit="return validateForm()" accept-charset="UTF-8">
		<table class="form-table">
			<tr> 
				<th class="title" colspan="2">회원가입</th>
			</tr>
			<tr>
				<td class="title">아이디</td>
				<td>
					<input type="text" name="id" id="id" placeholder="id">
					<input type="button" id="idOverlap" value="중복 확인">
					<input type="button" id="alterid" value="수정" onclick="alterID()">
				</td>
			</tr>
			<tr>
				<td class="title">비밀번호</td>
				<td><input type="password" name="password" placeholder="password"></td>
			</tr>
			<tr>
				<td class="title">비밀번호 확인</td>
				<td><input type="password" name="confirm_password" placeholder="confirm password"></td>	
			</tr>
			<tr>
				<td class="title">이름</td>
				<td><input type="text" name="name" placeholder="name"></td>
			</tr>
			<tr>
				<td class="title">전화번호</td>
				<td>
					<select name="phone1">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>
					<span>-</span>
					<input type="text" name="phone2" placeholder="1234" maxlength="4" style="width:80px;">
					<input type="text" name="phone3" placeholder="5678" maxlength="4" style="width:80px;">
					<br/>
					<input id = "smssts" type="checkbox" name="smssts" value="Y">
					<input id = "hidden-smssts" type="hidden" name="smssts" value="N">
					<label for= "smssts"><span>쇼핑몰에서 발송하는 SMS 소식을 수신합니다.</span></label> 
				</td>
			</tr>
			<tr>
				<td class="title">이메일</td>
				<td>
					<input type="text" name="mail1" style="width:100px; text-align:right;">
					<span>@</span>
					<input type="text" name="mail2" style="width:100px;">
					<select name="mail3" onchange="setMail(this)">
						<option>직접 입력</option>
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>nate.com</option>
						<option>daum.net</option>
					</select>
					<br/>
					<input id = "emailsts" type="checkbox" name="emailsts" value="Y">
					<input id = "hidden-emailsts" type="hidden" name="emailsts" value="N">
					<label for= "emailsts"><span>쇼핑몰에서 발송하는 e-mail을 수신합니다.</span></label> 
					</td>
			</tr>
			<tr>
				<td class="title">성별</td>
				<td>
					<input id="male" type="radio" name="gender" value="male" onchange="setRrn_2()">
					<label for="male">남성</label>
					<input id="female" type="radio" name="gender" value="female" onchange="setRrn_2()">
					<label for="female">여성</label>
				</td>		
			</tr>
			<tr>
				<td class="title">생년월일</td>
				<td>
					<select name="year" onchange="setYear(this), setRrn_2()">
					</select>
					<select name="month" onchange="setMonth(this)">
					</select>
					<select name="day" onchange="setDay(this)">
					</select>
					<input id="sola" type="radio" name="calendar" value="sola" checked>
					<label for="sola">양력</label>
					<input id="lunar" type="radio" name="calendar" value="lunar">
					<label for="lunar">음력</label>
				</td>
			</tr>
			<tr>
				<td class="title">주민등록번호</td>
				<td><input type="text" name="rrn" value="000000" style="width:80px; text-align:right;" readonly> 
				<b>-</b> 
				<input type="text" name="rrn_2" placeholder="1234567" style="width:80px;" disabled></td>
			</tr>
			<tr>
				<td class="title">주소</td>
				<td>
				<input id="postcode" type="text" name="postcode" placeholder="우편번호" readonly>
					<input type="button" name="set-postcode" onclick="set_postcode()" value="우편번호 찾기"><br/>
					<label for="roadAddr">도로명 주소:</label><br/>
					<input id="roadAddr" type="text" name="roadAddr" style="width:300px;" readonly><br/>
					<label for="jibunAddr">지번 주소:</label><br/>
					<input id="jibunAddr" type="text" name="jibunAddr" style="width:300px;" readonly><br/>
					<label for="detailAddr">상세 주소:</label><br/>
					<input id="detailAddr" type="text" name="detailAddr" value="">
				</td>
			</tr>
			<tr align="right">
				<td class="title" colspan="2"><input type="submit" value="Sign Up">&nbsp;<input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form>
</body>
</html>