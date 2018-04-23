<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员中心</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />
<link href="${pageContext.request.contextPath }/css/adminmanage.css"
	type="text/css" rel="stylesheet"></link>
</head>
<body>
	<div class="managementmenu">
		<img alt="" src="img/logo/logo_head.jpg">
		<div class="managementmenupatt" onclick="fgoodsmanage()">商品管理</div>
		<div id="goodsmanage" style="display: none">
			<div class="managementmenupattchi">
				<a href="admin/allgoods.htgo" class="link" target="iframe">所有商品</a>
			</div>
			<div class="managementmenupattchi">
				<a href="admin/addgoods.jsp" class="link" target="iframe">添加商品</a>
			</div>
		</div>
		<div class="managementmenupatt" onclick="fusermanage()">用户管理</div>
		<div id="usermanage" style="display: none">
			<div class="managementmenupattchi">
				<a href="admin/alluser.htgo" class="link" target="iframe">用户信息</a>
			</div>
			<div class="managementmenupattchi">
				<a href="admin/allcomments.htgo" class="link" target="iframe">用户评论</a>
			</div>
			<div class="managementmenupattchi">
				<a href="admin/allaccount.htgo" class="link" target="iframe">用户余额</a>
			</div>
		</div>
		<div class="managementmenupatt">
			<a href="admin/allorder.htgo" class="link" target="iframe">订单管理</a>
		</div>
		<div class="managementmenupatt">
			<a href="admin/allcart.htgo" class="link" target="iframe">购物车管理</a>
		</div>
		<div class="managementmenupatt" onclick="fadmanage()">广告管理</div>
		<div id="admanage" style="display: none">
			<div class="managementmenupattchi">
				<a href="admin/alladgoods.htgo?adtype=bigscreen" class="link"
					target="iframe">大屏幕商品</a>
			</div>
			<div class="managementmenupattchi">
				<a href="admin/alladgoods.htgo?adtype=popular" class="link"
					target="iframe">热门商品</a>
			</div>
			<div class="managementmenupattchi">
				<a href="admin/alladgoods.htgo?adtype=recommand" class="link"
					target="iframe">推荐商品</a>
			</div>
			<div class="managementmenupattchi">
				<a href="admin/alladgoods.htgo?adtype=new" class="link"
					target="iframe">新品上市</a>
			</div>
		</div>
		<div class="managementmenupatt">
			<a href="admin/sendmessage.htgo" class="link" target="iframe">发送消息</a>
		</div>
	</div>
	<div class="manageiframe">
		<iframe src="" width="1100px" height="600px"
			style="border-width: 0px;" name="iframe"></iframe>
	</div>
</body>
<script type="text/javascript">
var goodsmanage=document.getElementById("goodsmanage");
var usermanage=document.getElementById("usermanage");
var admanage=document.getElementById("admanage");
function fgoodsmanage(){
	goodsmanage.style.display="block";
	usermanage.style.display="none";
	admanage.style.display="none";
}
function fusermanage(){
	goodsmanage.style.display="none";
	usermanage.style.display="block";
	admanage.style.display="none";
}
function fadmanage(){
	goodsmanage.style.display="none";
	usermanage.style.display="none";
	admanage.style.display="block";
}
</script>
</html>