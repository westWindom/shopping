<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员登录入口</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />
<link href="${pageContext.request.contextPath}/css/styles.css"
	type="text/css" media="screen" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/js/jquery-ui-1.8.16.custom.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.6.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.keyboard.extension-typing.js"></script>
<link type="text/css"
	href="${pageContext.request.contextPath}/css/keyboard.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.keyboard.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
</head>
<body>
</body>
<body id="login">
	<div id="wrappertop"></div>
	<div id="wrapper">
		<div id="content">
			<div id="header">
				<h1>
					<a href=""> <!--؅׃Logo <img src="logo.png"   height="50"  width="100"  alt="logo">--></a>
				</h1>
			</div>
			<div id="darkbanner" class="banner320">
				<h2>管理员登录</h2>
			</div>
			<div id="darkbannerwrap"></div>
			<form name="form1" method="post" action="admin/adminlogin.htgo">
				<fieldset class="form">
					<p>
						<label class="loginlabel" for="user_name"> 用户名:</label> <input
							class="logininput ui-keyboard-input ui-widget-content ui-corner-all"
							name="admin" id="user_name" type="text" value="" />
					</p>
					<p>
						<label class="loginlabel" for="user_password"> 密码:</label> <span>
							<input class="logininput" name="password" id="user_password"
							type="password" /><img id="passwd" class="tooltip"
							alt="Click to open the virtual keyboard"
							title="Click to open the virtual keyboard" src="img/keyboard.png" />
						</span>
					</p>
					<button id="loginbtn" type="button" class="positive" name="Submit">
						<img src="img/key.png" alt="Announcement" />点我登录
					</button>
					<ul id="forgottenpassword">
						<li class="boldtext">|</li>
						<li><input id="rememberMe" type="checkbox" name="remember"><label
							for="rememberMe">记住我</label></li>
					</ul>
				</fieldset>
			</form>
		</div>
	</div>
	<script type="text/javascript">
        $(document).ready(function() {
            $('#user_password').keyboard({
                openOn: null,
                stayOpen: true,
                layout: 'qwerty'
            }).addTyping();
            $('#passwd').click(function() {
                $('#user_password').getkeyboard().reveal();
            })

            $(".logininput").blur(function() {
                if ($(this).val() == "") {
                    $(this).css("border-color", "red");
                                    }
                else
                    $(this).css("border-color", "#D9D6C4");
            })

            $("#loginbtn").click(function() {
                var k = 0;
                var ajaxhtml = "";
                $(".logininput").each(function(i, obj) {
                    if ($(obj).val().trim() == "") {
                        k++;
                        $(this).css("border-color", "red");
                        $(this).focus();
                        return false;
                    }
                });
                if (k != 0) return;
                ajaxhtml = $("#loginbtn").html();
                $("#loginbtn").html("Loading....  <img src='img/loading.gif' alt='Announcement' /> ");
                $("#loginbtn").attr("disabled", "disabled");
                //进行表单提交
                $("form:first").submit();
             })
             //进行用户点击了记住我的操作
        });
    </script>
	<script type="text/javascript">
//判断之前是否有设置cookie，如果有，则设置【记住我】选择框  
if($.cookie('absms_crm2_userName')!=undefined){
    $("#rememberMe").attr("checked", true);  
}else{  
    $("#rememberMe").attr("checked", false);  
}  
  
//读取cookie  
if($('#rememberMe:checked').length>0){  
    $('#user_name').val($.cookie('absms_crm2_userName'));  
    $('#user_password').val($.cookie('absms_crm2_password'));  
}  
  
//监听【记住我】事件  
$("#rememberMe").click(function(){  
    if($('#rememberMe:checked').length>0){//设置cookie  
        $.cookie('absms_crm2_userName', $('#user_name').val());  
        $.cookie('absms_crm2_password', $('#user_password').val());  
    }else{//清除cookie  
        $.removeCookie('absms_crm2_userName');  
        $.removeCookie('absms_crm2_password');  
    }  
});  
</script>

</body>
</html>