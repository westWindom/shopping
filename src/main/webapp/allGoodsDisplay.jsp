<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品中心</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />
<link href="${pageContext.request.contextPath}/css/headmall.css"
	type="text/css" rel="stylesheet"></link>
<link href="${pageContext.request.contextPath}/css/allgoodsdisplay.css"
	type="text/css" rel="stylesheet"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
<!-- 如果为空格就跳转到main.do -->
<c:if test="${empty goodsinfo}">
	<c:redirect url="/goodsdisplay.htgo"></c:redirect>
</c:if>
<script type="text/javascript">
$(function(){
	$('.box').pagination({
		totalData:${total},
		current:${current},
		showData:10,
	    jump:true,
	    coping:true,
	    homePage:'首页',
	    endPage:'末页',
	    prevContent:'上页',
	    nextContent:'下页',
	    callback:function(api){
	    	//进行数据库的查询
	    	if($("price").val()==0){
	    		window.location.href="${pageContext.request.contextPath}/goodsdisplay.htgo?current="+api.getCurrent()+"&category="+$("#category").val();
	    	}else{
	    		window.location.href="${pageContext.request.contextPath}/goodsdisplay.htgo?current="+api.getCurrent()+"&category="+$("#category").val()+"&price="+$("#price").val();
	    	}
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
	<%@include file="head2.jsp"%>
	<style>
#cart_info {
	width: 144px;
}
</style>
	<div
		style="width: 1519px; margin: 0 auto; text-align: center; padding-left: 90px;">
		<div class="goodscategorys" style="text-align: left;">
			<div class="goodssort" style="margin-left: 120px;">
				<form action="regoodssdisplay.htgo" method="post">
					<div id="categorycon" style="display: inline-block;">
						种类： <select id="category" name="category">
							<option value=0>所有</option>
							<option value=1>数码相机</option>
							<option value=2>手机</option>
							<option value=3>电脑</option>
							<option value=4>DIY</option>
							<option value=5>智能</option>
						</select>
					</div>
					<div id="pricecon" style="display: inline-block; margin-left: 50px">
						价格： <select name="price" id="price">
							<option value=0>无</option>
							<option value=1>价格从低到高</option>
							<option value=2>价格从高到低</option>
						</select>
					</div>
					<div id="categorysubmit" style="margin-top: 10px;">
						<input class="btn btn-default" type="submit" value="筛选" />
					</div>
				</form>
			</div>
		</div>
		<div style="text-align: left;">
			<div
				style="margin-left: 120px; margin-top: 20px; color: #070606; font-size: 15px; font-family: initial;">结果：</div>
			<div id="resultinfo"
				style="width: 1166px; margin-left: 120px; position: absolute;">

				<c:if test="${empty goodsinfo}">
					<c:redirect url="/mainhandler.htgo"></c:redirect>
				</c:if>

				<c:forEach items="${goodsinfo}" var="eachgoods">
					<div class="resultgoodstemplate">
						<div class="resultgoodspic">
							<a href="goodsdetail.jsp?goodsName=${eachgoods.getGoodsName()}"><img
								style="width: 190px; height: 190px;" alt=""
								src="${pageContext.request.contextPath}/img/goods/${eachgoods.getGoodsPic()}"></a>
						</div>
						<div id="resultgoodstitle">
							<div style="font-size: 16px;">¥${eachgoods.getGoodsprice()}</div>
							<div
								style="font-size: 16px; text-overflow: ellipse; overflow: hidden; overflow: hidden; text-overflow: ellipsis; word-wrap: none; white-space: nowrap;">${eachgoods.getGoodsName()}</div>
						</div>
					</div>
				</c:forEach>
				<div class="box" style="margin: 40px 20px 80px 20px"></div>
				<br />
				<%@include file="footer2.jsp"%>
			</div>
		</div>
	</div>
</body>
<script>
/*对价格的下拉框进行设置*/
var category=document.getElementById("category");
var goodscategory=${goodscategory};
switch(goodscategory){
case 0:
	category[0].selected="selected";
	break;
case 1:
	category[1].selected="selected";
	break;
case 2:
	category[2].selected="selected";
	break;
case 3:
	category[3].selected="selected";
	break;
case 4:
	category[4].selected="selected";
	break;
case 5:
	category[5].selected="selected";
	break;
}
/*对价格的下拉框进行设置*/
var price=document.getElementById("price");
var goodsprice=${price};
switch(goodsprice){
case 0:
	price[0].selected="selected";
	break;
case 1:
	price[1].selected="selected";
	break;
case 2:
	price[2].selected="selected";
	break;
}
</script>
</html>