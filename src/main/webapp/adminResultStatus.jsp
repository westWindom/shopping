<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商场管理员登录</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />

<style type="text/css">
#successMessage {
	position: relative;
	height: 50%;
	text-align: center;
	padding: 50px;
}
</style>
</head>
<body>
	<%@include file="head1.jsp"%>
	<div id="successMessage">
		<div>${info}</div>
		<br>
		<div>
			<span id="second">5</span>秒后，自动跳转
		</div>
		<br> 若没跳转，请点击<a id="blue_link" href="${url}">前往</a>
	</div>
</body>
<script type="text/javascript">
var second = document.getElementById("second").innerText;
setInterval("redirect()", 1000); 
function redirect()
{
document.getElementById("second").innerText = --second;
if (second < 1)
	location.href = "${url}"; 
}
</script>
</html>