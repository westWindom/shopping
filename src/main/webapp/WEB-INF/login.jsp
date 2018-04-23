<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物商城登录</title>
<style type="text/css">
html {
	width: 100%;
}

body {
	margin: 0px;
	width: 100%;
	background: #FCFCFC;
	overflow-x: visible;
	overflow-y: visible;
}

#upperPart {
	position: relative;
	background: #fff;
	border: 1px solid #e1e1e1;
}

#upperPartLeft {
	display: inline-block;
	position: relative;
	padding: 0px;
	left: 60px;
}

#upperPartRight {
	display: inline-block;
	position: relative;
	float: right;
	right: 90px;
	color: #999;
	vertical-align: text-top;
	font-family: monospace;
}

#blue_link {
	color: #06c;
	text-decoration: none;
}

#middlePart {
	margin: 0px;
	padding: 60px;
	border: 1px solid #e1e1e1;
}

#logo_login {
	display: inline-block;
	left: 100px;
	position: relative;
}

#table {
	display: inline-block;
	height: 350px;
	background: #fff;
	margin-left: 200px;
	position: relative;
}

.submit {
	display: inline-block;
	padding: 5px 10px;
	font-size: 24px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #4CAF50;
	border: none;
	border-radius: 15px;
}

.submit:hover {
	background-color: #3e8e41
}

#user {
	width: 200px;
	height: 30px;
}

#psw {
	width: 200px;
	height: 30px;
}

#copyright {
	text-align: center;
}
</style>
</head>
<body>
	<%
String rename=request.getParameter("reName");
%>
	<div id="upperPart">
		<a href="main.jsp"><img id="upperPartLeft" alt="logo_head"
			src="img/logo/logo_head.jpg"></a>
		<h5 id="upperPartRight">
			你好，欢迎来到回头购商城 <a id="blue_link" href="login.jsp">请登录</a>
		</h5>
	</div>
	<div id="middlePart">
		<form action="login.htgo" method="post">
			<div id="logo_login">
				<img alt="logo_login" src="img/logo/logo_login.jpg">
			</div>
			<div id="table">
				<table cellspacing="25">
					<thead>
						<tr>
							<td><h4>回头购商城登录</h4></td>
							<td><h5>
									<a id="blue_link" href="register.jsp">注册新账号</a>
								</h5></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" id="user" name="userName" /></td>
							<td>用户名</td>
						</tr>
						<tr>
							<td><input type="password" id="psw" name="userPassword" /></td>
							<td>密码</td>
						</tr>
						<tr>
							<td><input type="submit" class="submit" value="提交" /></td>
							<td><input type="submit" class="submit" value="重置" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<div id="copyright">
		<p>Copyright © 回头购商城 2017</p>
		<p>
			<a href="adminlogin.jsp" style="text-decoration: none; color: black;">管理员入口</a>
		</p>
	</div>
	<script type="text/javascript">
  var rename="<%=rename%>";
  if(rename != "null"){
	  document.getElementById("user").value=rename;
  }
</script>
</body>
</html>