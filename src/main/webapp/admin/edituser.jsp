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
			<span>注册名称：</span><input type="text" value="${userinfo.getRegName()}"
				name="regName" readonly />
		</div>
		<div>
			<span>地址：</span><input type="text" value="${userinfo.getAddress() }"
				name="address" />
		</div>
		<div>
			<span>银行账号：</span><input type="text" value="${userinfo.getBankId() }"
				name="bankId" />
		</div>
		<div>
			<span>出生日期(yyyy-mm-dd)：</span><input type="text"
				value="${userinfo.getBirthday()}" name="birthday" />
		</div>
		<div>
			<span>邮箱：</span><input type="text" value="${userinfo.getEmail() }"
				name="email" />
		</div>
		<div>
			<span>身份证号码：</span><input type="text"
				value="${userinfo.getIdentify()}" name="identify" />
		</div>
		<div>
			<span>物流：</span><input type="text" value="${userinfo.getLogistics()}"
				name="logistics" />
		</div>
		<div>
			<span>密码：</span><input type="text" value="${userinfo.getPassword()}"
				name="password" />
		</div>
		<div>
			<span>真实姓名：</span><input type="text"
				value="${userinfo.getRealName()}" name="realName" />
		</div>
		<div>
			<span>性别：</span><input type="text" value="${userinfo.getSex()}"
				name="sex" />
		</div>

		<button type="submit" value="提交">提交</button>
		<button type="submit" value="删除用户">删除用户</button>
	</form>
	<script type="text/javascript">
var buttons=document.getElementsByTagName("button");
var form=document.getElementsByTagName("form")[0];
buttons[0].addEventListener("click",function(){
	form.action="submituser.htgo";
	form.submit();
})
buttons[1].addEventListener("click",function(){
	form.action="deleteuser.htgo";
	form.submit();
})
</script>
</body>
</html>