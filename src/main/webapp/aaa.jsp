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
    function queren()

    {

        var se=confirm("我胖吗");

        if (se==true)

        {

            alert("不胖");

        }

        else

        {

            alert("不胖");

        }

    }

    function tishi()

    {

        var t=prompt("请输入您的名字","KING视界")

        if (t!=null && t!="")

        {

            document.write("精彩MV就在，" + t + "！属于你的世界")

        }

    }

    function  duihua() {

    }


</script>
</head>
<body>

<input type="button" onclick="queren()" value="今晚吃鸡" />

</body>
</html>