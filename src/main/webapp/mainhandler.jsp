<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ---------------------我是headmall的java部分-------------------------------------- -->
<%@ page import="javax.servlet.http.*"%>
<!-- --------------------我是headmall的java部分---------------------------------------- -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网上购物商城</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />
<link href="${pageContext.request.contextPath}/css/mainmall.css"
	type="text/css" rel="stylesheet"></link>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jdSlide.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/slide.css" />

<link href="${pageContext.request.contextPath}/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.movebg.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<!-- 	
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=A63e90def3d0f5488ab9032056429a0d"></script>
 -->
<!-- 如果为空格就跳转到main.do -->
<c:if test="${empty recommend}">
	<c:redirect url="/mainhandler.htgo"></c:redirect>
</c:if>

</head>
<body>
	<%@include file="head2.jsp"%>
	<div id="bodycontainer">
		<div id="secondpart">
			<!-- slider -->
			<div class="wraper">
				<div class="nav">
					<ul>
						<li class="nav-item cur"
							onclick="layer.load(1, {shade: [0.1,'#fff']});"><a
							href="${pageContext.request.contextPath}/goodsdisplay.htgo?category=1"
							style="color: #fff"><span
								style="background-position: 0 -40px;"></span>数码相机</a></li>
						<li class="nav-item"
							onclick="layer.load(1, {shade: [0.1,'#fff']});"><a
							href="${pageContext.request.contextPath}/goodsdisplay.htgo?category=2"
							style="color: #fff"><span style="background-position: 0 0;"></span>手机</a></li>
						<li class="nav-item"
							onclick="layer.load(1, {shade: [0.1,'#fff']});"><a
							href="${pageContext.request.contextPath}/goodsdisplay.htgo?category=3"
							style="color: #fff"><span
								style="background-position: 0 -19px;"></span>电脑</a></li>
						<li class="nav-item"
							onclick="layer.load(1, {shade: [0.1,'#fff']});"><a
							href="${pageContext.request.contextPath}/goodsdisplay.htgo?category=4"
							style="color: #fff"><span
								style="background-position: 0 -133px;"></span>DIY</a></li>
						<li class="nav-item"
							onclick="layer.load(1, {shade: [0.1,'#fff']});"><a
							href="${pageContext.request.contextPath}/goodsdisplay.htgo?category=5"
							style="color: #fff"><span
								style="background-position: 0 139px;"></span>智能</a></li>
					</ul>
					<!--移动的滑动-->
					<div class="move-bg"></div>
					<!--移动的滑动 end-->
				</div>
			</div>
			<div>
				<div id="slide" style="margin-left: 259px"></div>
			</div>
			<script type="text/javascript">
	$("#slide").jdSlide({
		width:990,
		height:400,
		pics:[
<c:forEach var="item" items="${creenadinfo}">  
{src:"${pageContext.request.contextPath}/img/big/big_${item.getGoodsPic()}",href:"goodsdetail.htgo?goodsName=${item.getGoodsName()}",alt:"17素材",type:"img"},
</c:forEach>  
		]
	})
</script>
		</div>





		<div id="third" style="text-align: left">
			<!-- ------推荐商品-------- -->
			<div id="recommend_goods" class="third_chipart">
				<div id="recommend_goods_title" class="third_chipart_title">
					<div id="recommend_goods_title_fontleft"
						class="third_chipart_title_fontleft">推荐商品</div>
					<div id="recommend_goods_title_fontright"
						class="third_chipart_title_fontright"
						onclick="layer.load(1, {shade: [0.1,'#fff']});location.href='allGoodsDisplay.jsp'"
						style="cursor: pointer">更多>></div>
				</div>
				<div id="recommend_goods_body" class="third_chipart_body">

					<c:forEach var="item" items="${recommend }">
						<div id="goodstemplate" class="goodstemplate"
							onclick="layer.load(1, {shade: [0.1,'#fff']});">
							<a class="linkgoods"
								href="goodsdetail.htgo?goodsName=${item.getGoodsName()}"> <span
								id="goodstemplate_piccon00" class="goodstemplate_piccon"><img
									id="goodstemplate_picinfo00" class="goodstemplate_picinfo"
									src="${pageContext.request.contextPath}/img/goods/${item.getGoodsPic()}" /></span>
								<span id="goodstemplate_text00" class="goodstemplate_text">${item.getGoodsName()}</span>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- -------新品上市--------------- -->
			<div id="new_goods" class="third_chipart">
				<div id="new_goods_title" class="third_chipart_title">
					<div id="new_goods_title_fontleft"
						class="third_chipart_title_fontleft">新品上市</div>
					<div id="new_goods_title_fontright"
						class="third_chipart_title_fontright" style="cursor: pointer"
						onclick="layer.load(1, {shade: [0.1,'#fff']});location.href='allGoodsDisplay.jsp'"
						style="cursor: pointer">更多>></div>
				</div>
				<div id="recommend_goods_body" class="third_chipart_body">
					<c:forEach var="item" items="${newgoods }">
						<div id="goodstemplate" class="goodstemplate"
							onclick="layer.load(1, {shade: [0.1,'#fff']});">
							<a class="linkgoods"
								href="goodsdetail.htgo?goodsName=${item.getGoodsName()}"> <span
								id="goodstemplate_piccon20" class="goodstemplate_piccon"><img
									id="goodstemplate_picinfo00" class="goodstemplate_picinfo"
									src="${pageContext.request.contextPath}/img/goods/${item.getGoodsPic()}"></span>
								<span id="goodstemplate_text20" class="goodstemplate_text">${item.getGoodsName()}</span>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- -----------------热门商品----------- -->
			<div id="popular_goods" class="third_chipart">

				<div id="popular_goods_title" class="third_chipart_title">
					<div id="popular_goods_title_fontleft"
						class="third_chipart_title_fontleft">热门商品</div>
					<div id="popular_goods_title_fontright"
						class="third_chipart_title_fontright" style="cursor: pointer"
						onclick="layer.load(1, {shade: [0.1,'#fff']});location.href='allGoodsDisplay.jsp'"
						style="cursor: pointer">更多>></div>
				</div>
				<div id="recommend_goods_body" class="third_chipart_body">

					<c:forEach var="item" items="${popular }">
						<div id="goodstemplate" class="goodstemplate"
							onclick="layer.load(1, {shade: [0.1,'#fff']});">
							<a class="linkgoods"
								href="goodsdetail.htgo?goodsName=${item.getGoodsName()}"> <span
								id="goodstemplate_piccon40" class="goodstemplate_piccon"><img
									id="goodstemplate_picinfo00" class="goodstemplate_picinfo"
									src="${pageContext.request.contextPath}/img/goods/${item.getGoodsPic() }"></span>
								<span id="goodstemplate_text40" class="goodstemplate_text">${item.getGoodsName() }</span>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 1519px; margin: 0 auto;">
		<%@include file="footer2.jsp"%>
	</div>
	<script type="text/javascript">
$(function(){
	$(".nav").movebg({
		width:120/*滑块的大小*/,
		extra:40/*额外反弹的距离*/,
		speed:300/*滑块移动的速度*/,
		rebound_speed:400/*滑块反弹的速度*/
	});
})
</script>

</body>
</html>