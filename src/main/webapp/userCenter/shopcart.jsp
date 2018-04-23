<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的购物车</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
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
	    	window.location.href="${pageContext.request.contextPath}/userCenter/shopcart.htgo?current="+api.getCurrent();
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
</head>
<body>
	<c:if test="${shopcart.size()==0}">
您的购物车还没有添加物品
</c:if>

	<table class="table table-striped">
		<caption>我的购物车信息如下：</caption>
		<thead>
			<tr>
				<th>商品名称</th>
				<th>商品数量</th>
				<th>商品单价</th>
				<th>商品总价</th>
				<th>操作</th>
				<th>操作</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${shopcart}" var="cart">

				<tr>
					<td><a
						href="${pageContext.request.contextPath}/goodsdetail.htgo?goodsName=${cart.getName()}"
						target="parent"
						style="text-decoration: none; color: cornflowerblue">${cart.getName()}<a></td>
					<td><input id="num${cart.getId()}" type="text"
						value="${cart.getNum()}"
						style="display: inline-block; width: 20px;" /></td>
					<td><span id="goodsprice${cart.getId()}">${cart.getGoodsprice()}</span>
					</td>
					<td><span id="goodsprices${cart.getId()}">${cart.getNum()*cart.getGoodsprice()}</span>
					</td>
					<td><a id="buy${cart.getId()}" target="_parent"><button>立即购买</button></a>
					</td>
					<td><a id="order${cart.getId()}" target="_parent"><button>下单</button></a>
					</td>
					<td><a id="deletes${cart.getId()}" target="_parent"><button>删除</button></a>
					</td>
					<script type="text/javascript">
var goodsnum${cart.getId()}=document.getElementById("num${cart.getId()}");
goodsnum${cart.getId()}.addEventListener("keyup",function(e){
	if((!(/^\d+$/g.test(goodsnum${cart.getId()}.value)))|| goodsnum${cart.getId()}.value==0){//数值不能为非数字，也不能为0
		alert("请输入合法的整数");
		goodsnum${cart.getId()}.value=${cart.getNum()};
		document.getElementById("goodsprices${cart.getId()}").innerText=${cart.getNum()*cart.getGoodsprice()};
	}else{
	var goodsprice${cart.getId()}=document.getElementById("goodsprice${cart.getId()}");
	document.getElementById("goodsprices${cart.getId()}").innerText=goodsnum${cart.getId()}.value*goodsprice${cart.getId()}.innerText;
	}
	
},true);
/*立即购买*/
var buy${cart.getId()}=document.getElementById("buy${cart.getId()}");
buy${cart.getId()}.addEventListener("click",function(e){
	buy${cart.getId()}.href="../shopcartbookout.htgo?goodsname=${cart.getName()}&goodsnum="+document.getElementById("num${cart.getId()}").value;
},true);
/*下单*/
var order${cart.getId()}=document.getElementById("order${cart.getId()}");
order${cart.getId()}.addEventListener("click",function(e){
	order${cart.getId()}.href="../shopcartsetorder.htgo?goodsname=${cart.getName()}&goodsnum="+document.getElementById("num${cart.getId()}").value;
},true);
/*删除*/
var deletes${cart.getId()}=document.getElementById("deletes${cart.getId()}");
deletes${cart.getId()}.addEventListener("click",function(e){
	deletes${cart.getId()}.href="../shopcartdelete.htgo?goodsname=${cart.getName()}&goodsnum="+document.getElementById("num${cart.getId()}").value;
},true);
</script>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<!-- 添加分页插件 -->
	<div class="box" style="float: right"></div>
</body>
</html>