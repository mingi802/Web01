<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	var circle = {
		center: { x:1.0, y:2.0},
		radius: 2.5,
		area: function() {
			return Math.PI * this.radius * this.radius;
		},
		
		setRadius: function(radius) {
			this.radius = radius;
			console.log(circle.area());
		},	
		
		showCircleArea: function() {
			let text = document.getElementById("show-circle-area");
			console.log(circle.area());
			text.innerText=circle.area();
		}
	};
	
</script>
</head>
<body>
	<input type="number" id="put-circle-radius" onchange="circle.setRadius(this.value)">
	<input type="button" id="get-circle-area" value="원 면적 구하기" onclick="circle.showCircleArea()">
	
	<p>원의 면적</p>
	<span id="show-circle-area">0</span>
</body>
</html>