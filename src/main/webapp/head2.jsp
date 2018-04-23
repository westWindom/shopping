<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="css/head2.css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="width: 1515px; margin: 0 auto;">
	<!--快捷访问栏开始-->
	<div id="shortcut">
		<div class="page_width">
			<c:set var="a" value="${sessionScope.userName}" />
			<c:choose>
				<c:when test="${not empty a}">
					<ul>
						<li class="welcome">您好！&nbsp;<c:out value="${a}"></c:out>&nbsp;&nbsp;欢迎来到网上购物商城
						</li>
						<li class="my_order"><a
							href="${pageContext.request.contextPath}/personalCenter.htgo?type=order">我的订单</a></li>
						<li><a
							href="${pageContext.request.contextPath}/personalCenter.htgo?type=shopcart">我的购物车</a></li>
						<li><a
							href="${pageContext.request.contextPath}/personalCenter.htgo?type=comments">我的评论</a></li>
						<li><a
							href="${pageContext.request.contextPath}/personalCenter.htgo?type=systemmessage">系统消息</a></li>
						<li class="sub"><a
							href="${pageContext.request.contextPath}/helpCenter.html"
							target="_blank">帮助中心</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li class="welcome">您好！欢迎来到京东商城！<span><a
								href="login.jsp">[请登录]</a>，新用户？<a href="register.jsp"
								class="link_reg">[免费注册]</a></span></li>
						<li class="my_order"><a href="#" onclick="alert('你还未登录')">我的订单</a></li>
						<li><a href="#" onclick="alert('你还未登录')">我的京东</a></li>
						<li><a href="#" onclick="alert('你还未登录')">我的购物车</a></li>
						<li><a href="#" onclick="alert('你还未登录')">我的评论</a></li>
						<li><a href="#" onclick="alert('你还未登录')">系统消息</a></li>
						<li></li>
						<li class="sub"><a
							href="${pageContext.request.contextPath}/helpCenter.html"
							target="_self">帮助中心</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			<span class="clear"></span>
		</div>
	</div>
	<!--头部导航开始-->
	<div id="header" class="page_width">

		<div id="logo">
			<a href="${pageContext.request.contextPath}/main.jsp"><img
				src="${pageContext.request.contextPath}/img/logo/logo_mall.png"
				width="251" height="55" /></a>
		</div>

		<div class="clear"></div>
		<div id="book_search">
			<div id="allsort">
				<div id="more_sort">
					<strong>产品分类</strong>
				</div>
			</div>
			<div id="search">
				<!--<div id="sub_search">-->
				<input type="text" id="keyword" value="数码相机" onfocus="this.value=''" />
				<!--</div>-->
				<input type="submit" id="btn_search" onclick="search()"
					style="cursor: pointer" value="搜 索" />
				<script type="text/javascript">
           function search(){
        	   var value=document.getElementById("keyword").value;
        	   
        	   window.location.href="search.jsp?key="+value;
           }
           </script>
			</div>

			<ul id="mycart">
				<li id="cart_info">购物车<b><font color="#066FC9"><c:if
								test="${not empty sessionScope.shopcartnum}">${sessionScope.shopcartnum}</c:if>
							<c:if test="${empty sessionScope.shopcartnum}">0</c:if></font></b>件
				</li>
				<li><a
					href="${pageContext.request.contextPath}/personalCenter.htgo?type=shopcart"><font
						color="#ffffff">去结算</font></a></li>
			</ul>
		</div>
	</div>
</div>