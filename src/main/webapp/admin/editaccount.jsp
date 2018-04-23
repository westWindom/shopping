<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>编辑用户</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico" rel="SHORTCUT ICON" />
<style type="text/css">
* {
	margin: 0;
	padding: 0
}

span {
	width: 250px;
	height: 20px;
	text-align: right;
	font-family: fantasy;
	font-size: 18px;
	margin: 3px;
	display: inline-block;
}

div input {
	width: 300px;
	height: 20px;
	text-align: left;
	font: 10px fantasy;
	margin: 3px;
	display: inline-block;
}
</style>
</head>
<body>
	<p style="color: blue;">用户信息：</p>
	<form action="javascript:void(0)" method="post">
		<div>
			<span>用户名：</span><input type="text" value="${useraccount.getUser()}"
				name="user" readonly />
		</div>
		<div>
			<span>余额：</span><input type="text" value="${useraccount.getMoney()}"
				name="money" />
		</div>
		<button type="submit" value="提交">提交</button>
	</form>
	<script type="text/javascript">
var buttons=document.getElementsByTagName("button");
var form=document.getElementsByTagName("form")[0];
buttons[0].addEventListener("click",function(){
	form.action="submitaccount.htgo";
	form.submit();
})
</script>
</body>
</html>