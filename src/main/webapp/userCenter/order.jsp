<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$('.box').pagination({
		totalData:${total},
		current:${current},
		showData:5,
	    jump:true,
	    coping:true,
	    homePage:'首页',
	    endPage:'末页',
	    prevContent:'上页',
	    nextContent:'下页',
	    callback:function(api){
	    	//进行数据库的查询
	    	window.location.href="${pageContext.request.contextPath}/userCenter/order.htgo?current="+api.getCurrent();
	    }
	});
});
</script>
<style type="text/css">
.box a, .box input, .box span {
	float: left;
	margin: 0 5px;
	width: 38px;
	height: 38px;
	line-height: 38px;
	background: #fff;
	border: 1px solid #ebebeb;
	color: #bdbdbd;
	font-size: 14px;
	text-align: center;
}

.box .active {
	float: left;
	margin: 0 5px;
	width: 38px;
	height: 38px;
	line-height: 38px;
	background: #e91e63;
	color: #fff;
	font-size: 14px;
	border: 1px solid #e91e63;
	text-align: center;
}
</style>
<body>
	<c:if test="${orderlist.size()==0}">
您还没有订单
</c:if>

	<c:if test="${orderlist.size()!=0}">
		<table class="table table-striped">
			<caption>我的订单信息如下：</caption>
			<thead>
				<tr>
					<th>商品名称</th>
					<th>商品数量</th>
					<th>商品单价</th>
					<th>是否付款</th>
					<th>操作</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderlist}" var="order">
					<c:if test="${order.getIspay()=='否'}">
						<tr>
							<td><a
								href="${pageContext.request.contextPath}/goodsdetail.htgo?goodsName=${order.getGoodsName()}"
								target="_parent">${order.getGoodsName()}<a></td>
							<td>${order.getOrderNum()}</td>
							<td>${order.getOrderprice()}</td>
							<td>${order.getIspay()}</td>
							<td><a
								href="../orderbookout.htgo?goodsname=${order.getGoodsName()}&goodsnum=${order.getOrderNum()}&goodsprice=${order.getOrderprice()}"
								target="_parent"><button>立即付款</button></a></td>
							<td><a
								href="../deleteorder.htgo?goodsname=${order.getGoodsName()}"
								target="_parent"><button onlick="alert('是否删除订单？')">删除订单</button></a></td>
						</tr>
					</c:if>
					<c:if test="${order.getIspay()=='是'}">
						<tr>
							<td><a
								href="${pageContext.request.contextPath}/goodsdetail.htgo?goodsName=${order.getGoodsName()}"
								target="parent">${order.getGoodsName()}</a></td>
							<td>${order.getOrderNum()}</td>
							<td>${order.getOrderprice()}</td>
							<td>${order.getIspay()}</td>
							<td></td>
							<td><a
								href="../deleteorder.htgo?goodsname=${order.getGoodsName()}"
								target="_parent"><button onlick="alert('是否删除订单？')">删除订单</button></a></td>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<!-- 添加分页插件 -->
	<div class="box" style="float: right"></div>
</body>
</html>