<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人中心</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />
<link href="${pageContext.request.contextPath}/css/personalCenter.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/headmall.css"
	type="text/css" rel="stylesheet"></link
<!-- 引入头部的css -->
<style type="text/css">
#headmall2_part_notifyinfodetail {
	margin: 10px 10px 10px 199px;
}
</style>
</head>
<body>
	<%@include file="head2.jsp"%>
	<div style="margin: 0 auto;">
		<div class="personalInfocon">
			<div class="personalmenu">
				<div id="order" class="menutemplate">我的订单</div>
				<div id="shopcart" class="menutemplate">我的购物车</div>
				<div id="comments" class="menutemplate">我的评论</div>
				<div id="systemmessage" class="menutemplate">系统消息</div>
				<div id="account" class="menutemplate">账户余额</div>
				<div id="myinfo" class="menutemplate">个人信息</div>
				<div id="acceptAddress" class="menutemplate">地址设置</div>
				<div id="logistics" class="menutemplate">物流选择</div>
				<div id="logOff" class="menutemplate">用户注销</div>
			</div>
			<div class="ifram">
				<iframe src="${page}" width="1063px" height="332px" frameborder="0"
					style="border: 0px"></iframe>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/personalCenter.js"></script>
<script type="text/javascript">
//获得用户点击的菜单栏目
checkMenu("${page}");
</script>
</html>