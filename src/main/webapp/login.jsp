<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网上购物商城登录</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css" />
<script type="text/javascript"
	src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.reveal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/reveal.css" />
<script src="${pageContext.request.contextPath}/js/gVerify.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>

<script type="text/javascript">
	$(function() {
		$("#submit")
				.click(
						function() {
							//进行Ajax提交
								$.post(
												"login.htgo",
												{
													"uname" : $("#user").val(),
													"upass" : $("#psw").val(),
													"value":$("#code_input").val(),
												},
												function(res) {
                                                   // alert(res.result);
													if (res.result == 1) {//登录成功

														layer.load(2, {
															shade : false
														}); //0代表加载的风格，支持0-2
														setTimeout(
																function() {
																	window.location.href = "${pageContext.request.contextPath}/mainhandler.jsp";
																}, 3000);
													} else if(res.result == 0) {//登录失败
														$(".reveal-modal").html(
																		"<h1>登录失败</h1><p>账号密码有误，重新登录</p><a class='close-reveal-modal'>&#215;</a>");
														$(".reveal-modal").css("visibility","visible");
														//登录失败，叫用户重写输入
														$(".big-link").trigger(
																"click");
														$("#user").val(
																res.uname);
														$(".pswclass").val("");
														//刷新验证码
														$("#codeImage").trigger("click");
													}else{//验证码输入错误
														//登录失败，叫用户重写输入,并且刷新验证码
														$("#codeImage").trigger("click");
														$("#identityResult").html("验证码不正确");
													}
												}, "JSON");
						});

		//判断之前是否有设置cookie，如果有，则设置【记住我】选择框  
		if ($.cookie('absms_crm2_userName') != undefined) {
			$("#rememberMe").attr("checked", true);
		} else {
			$("#rememberMe").attr("checked", false);
		}

		//读取cookie  
		if ($('#rememberMe:checked').length > 0) {
			$('#user').val($.cookie('absms_crm2_userName'));
			$('#psw').val($.cookie('absms_crm2_password'));
		}

		//监听【记住我】事件  
		$("#rememberMe").click(function() {
			if ($('#rememberMe:checked').length > 0) {//设置cookie  
				$.cookie('absms_crm2_userName', $('#user').val());
				$.cookie('absms_crm2_password', $('#psw').val());
			} else {//清除cookie  
				$.removeCookie('absms_crm2_userName');
				$.removeCookie('absms_crm2_password');
			}
		});
		
		$(".reveal-modal").on("click",".close-reveal-modal",function(){
			$(".reveal-modal").css("visibility","hidden");
		});
	});
</script>
</head>
<body>

<%
 int a=5;
 request.setAttribute("a","123");
 session.setAttribute("a","465");
%>
<c:out value="${a}"></c:out>
	<a href="#" class="big-link" data-reveal-id="myModal"></a>
	<div id="myModal" class="reveal-modal"></div>

	<%@include file="head1.jsp"%>

	<div id="container">

		<div id="middlePart">
			<div id="logo_login">
				<img alt="logo_login" src="img/logo/logo_login.jpg">
			</div>

			<div id="table">
				<table cellspacing="25">
					<thead>
						<tr>
							<td><h4>商城登录</h4></td>
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
							<td><input type="password" id="psw" class="pswclass"
								name="userPassword" /></td>
							<td>密码</td>
						</tr>
						<tr>
							<td><img type="image" src="authCode.htgo" id="codeImage" onclick="chageCode()" title="图片看不清？点击重新得到验证码" style="cursor:pointer;height: 33px;width:200px;"/><br/><span id="identityResult"></span></td>
							
							<td><input type="text" id="code_input" value=""
								placeholder="请输入验证码" /></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="rememberMe">记住我</td>
						</tr>
						<tr>
							<td><input type="button" id="submit" class="submit"
								value="提交" /></td>
							<td><input type="reset" class="submit" value="重置" /></td>
						</tr>
					</tbody>
				</table>
				<script type="text/javascript">
				   function chageCode(){
				        $('#codeImage').attr('src','authCode.htgo?abc='+Math.random());//链接后添加Math.random，确保每次产生新的验证码，避免缓存问题。
				    }
				</script>
			</div>
		</div>
	</div>
	<%@include file="footer1.jsp"%>
</body>
</html>