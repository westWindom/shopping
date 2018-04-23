<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人信息</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico" rel="SHORTCUT ICON" />
</head>
<body>
	<div id="tablecon">
		<form action="../modifymyinfo.htgo" id="form" method="post"
			target="_parent">
			<table
				style="text-align: left; margin-top: 5px; margin-left: 80px; display: inline-block;"
				cellspacing="6" border="1px">
				<tr>
					<td>用户名：</td>
					<td><input id="regname" disabled="disabled" type="text"
						value="${userinfo.getRegName()}" style="background: #FAFAFA" /></td>
				</tr>
				<tr>
					<td>真名：</td>
					<td><input id="realname" name="realname" disabled="disabled"
						type="text" value="${userinfo.getRealName()}"
						style="background: #FAFAFA" placeholder="真实姓名" /></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="password" disabled="disabled" type="text"
						value="${userinfo.getPassword()}" style="background: #FAFAFA" /></td>
				</tr>
				<tr>
					<td>生日：</td>
					<td><input id="birthday" name="birthday" disabled="disabled"
						type="text" value="${userinfo.getBirthday()}"
						style="background: #FAFAFA" placeholder="0000-00-00" /></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input id="sex" name="sex" disabled="disabled" type="text"
						value="${userinfo.getSex()}" style="background: #FAFAFA"
						placeholder="男/女" /></td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td><input id="email" name="email" disabled="disabled"
						type="text" value="${userinfo.getEmail()}"
						style="background: #FAFAFA" /></td>
				</tr>
				<tr>
					<td>身份证：</td>
					<td><input id="identify" name="identify" disabled="disabled"
						type="text" value="${userinfo.getIdentify()}"
						style="background: #FAFAFA" placeholder="身份证" /></td>
				</tr>
				<tr>
					<td>银行卡号：</td>
					<td><input id="backid" name="backid" disabled="disabled"
						type="text" value="${userinfo.getBankId()}"
						style="background: #FAFAFA" placeholder="银行卡号" /></td>
				</tr>
			</table>
		</form>
		<input type="submit" value="完善信息" style="margin: 5px 80px" id="button" />
	</div>
</body>
<script type="text/javascript">
var realname=document.getElementById("realname");
var realnamecheck=false;
realname.addEventListener("blur",function(){
	if(realname.value.length<=1 || realname.value.length>=10){
		realnamecheck=false;
		alert("请输入规范的名称");
	}else{
		realnamecheck=true;
	}
},true);
var birthday=document.getElementById("birthday");
var birthdaycheck=false;
birthday.addEventListener("blur",function(){
	if(/^\d{4}-\d{2}-\d{2}$/g.test(birthday.value)||birthday.value==null){
		birthdaycheck=true;
	}else{
		birthdaycheck=false;
		alert("请输入规范格式的时间");
	}
},true);
var sex=document.getElementById("sex");
var sexcheck=false;
sex.addEventListener("blur",function(){
	if(/^[男,女]$/g.test(sex.value) || sex.value==null){
		sexcheck=true;
	}else{
		sexcheck=false;
		alert("请输入规范的性别");
	}
},true);
var identify=document.getElementById("identify");
var identifycheck=false;
identify.addEventListener("blur",function(){
	if(/[^(a-z0-9A-Z)]/g.test(identify.value) || identify.value.length==0){
		identifycheck=false;
		alert("请输入规范的身份证号");
	}else{
		identifycheck=true;
	}
},true);
var backid=document.getElementById("backid");
var backidcheck=false;
backid.addEventListener("blur",function(){
	if(/[^(0-9)]/g.test(backid.value) || backid.value.length==0){
		backidcheck=false;
		alert("请输入规范的银行卡号");
	}else{
		backidcheck=true;
	}
});

var button=document.getElementById("button");
button.addEventListener("click",function(){
	if(button.value=="完善信息"){
		var realname=document.getElementById("realname");
		realname.removeAttribute(regname.getAttribute("disabled"));
		var birthday=document.getElementById("birthday");
		birthday.removeAttribute(birthday.getAttribute("disabled"));
		var sex=document.getElementById("sex");
		sex.removeAttribute(sex.getAttribute("disabled"));
		var identify=document.getElementById("identify");
		identify.removeAttribute(identify.getAttribute("disabled"));
		var backid=document.getElementById("backid");
		backid.removeAttribute(backid.getAttribute("disabled"));
		var tablecon=document.getElementById("tablecon");
		button.value="确认修改";
	}else{
		if(realnamecheck==false){
			alert("请输入规范的名称");
		}else if(birthdaycheck==false){
			alert("请输入规范的日期");
		}else if(sexcheck==false){
			alert("请输入规范的性别");
		}else if(identifycheck==false){
			alert("请输入规范的身份证号");
		}else if(backidcheck==false){
			alert("请输入规范的银行卡号");
		}else{
			document.getElementById("form").submit();
		}
	}
},true)
</script>
</html>