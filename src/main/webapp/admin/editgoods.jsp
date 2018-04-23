<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>編輯商品</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico" rel="SHORTCUT ICON" />
<style type="text/css">
* {
	margin: 0;
	padding: 0
}

span {
	width: 90px;
	height: 20px;
	text-align: right;
	font-family: fantasy;
	font-size: 18px;
	margin: 3px;
	display: inline-block;
}

div input {
	width: 300px;
	height: 20px;
	text-align: left;
	font: 10px fantasy;
	margin: 3px;
	display: inline-block;
}
</style>
</head>
<body>
	<p style="color: blue;">商品信息：</p>
	<form action="javascript:void(0)" method="post"
		enctype="multipart/form-data">
		<div>
			<span>商品名称：</span><input type="text"
				value="${goodsinfo.getGoodsName()}" name="goodsName"
				readonly="readonly" />
		</div>
		<div>
			<span>商品价格：</span><input type="text"
				value="${goodsinfo.getGoodsprice() }" name="goodsprice" />
		</div>
		<div>
			<span>商品库存：</span><input type="text"
				value="${goodsinfo.getGoodsNum() }" name="goodsNum" />
		</div>
		<div>
			<span>制造商：</span><input type="text"
				value="${goodsinfo.getGoodsMaker() }" name="goodsMaker" />
		</div>
		<div>
			<span>描述：</span><input type="text"
				value="${goodsinfo.getGoodsDesc() }" name="goodsDesc" />
		</div>
		<div>
			<span>图片：</span><input type="file" name="goodspicfile" />图片格式：jepg,jpg,png。图片大小：1M
		</div>
		<div>
			<span>目录：</span><select name="goodsCategory">
				<c:if test="${goodsinfo.getGoodsCategory()==1}">
					<option value="1" selected>数码</option>
					<option value="2">手机</option>
					<option value="3">电脑</option>
					<option value="4">DIY</option>
					<option value="5">外设</option>
					<option value="6">智能</option>
					<option value="0">其它</option>
				</c:if>
				<c:if test="${goodsinfo.getGoodsCategory()==2}">
					<option value="1">数码</option>
					<option value="2" selected>手机</option>
					<option value="3">电脑</option>
					<option value="4">DIY</option>
					<option value="5">外设</option>
					<option value="6">智能</option>
					<option value="0">其它</option>
				</c:if>
				<c:if test="${goodsinfo.getGoodsCategory()==3}">
					<option value="1">数码</option>
					<option value="2">手机</option>
					<option value="3" selected>电脑</option>
					<option value="4">DIY</option>
					<option value="5">外设</option>
					<option value="6">智能</option>
					<option value="0">其它</option>
				</c:if>
				<c:if test="${goodsinfo.getGoodsCategory()==4}">
					<option value="1">数码</option>
					<option value="2">手机</option>
					<option value="3">电脑</option>
					<option value="4" selected>DIY</option>
					<option value="5">外设</option>
					<option value="6">智能</option>
					<option value="0">其它</option>
				</c:if>
				<c:if test="${goodsinfo.getGoodsCategory()==5}">
					<option value="1">数码</option>
					<option value="2">手机</option>
					<option value="3">电脑</option>
					<option value="4">DIY</option>
					<option value="5" selected>外设</option>
					<option value="6">智能</option>
					<option value="0">其它</option>
				</c:if>
				<c:if test="${goodsinfo.getGoodsCategory()==6}">
					<option value="1">数码</option>
					<option value="2">手机</option>
					<option value="3">电脑</option>
					<option value="4">DIY</option>
					<option value="5">外设</option>
					<option value="6" selected>智能</option>
					<option value="0">其它</option>
				</c:if>
				<c:if test="${goodsinfo.getGoodsCategory()==0}">
					<option value="1">数码</option>
					<option value="2">手机</option>
					<option value="3">电脑</option>
					<option value="4">DIY</option>
					<option value="5">外设</option>
					<option value="6">智能</option>
					<option value="0" selected>其它</option>
				</c:if>
			</select>
		</div>
		<button type="submit" value="提交">提交</button>
		<a href="deletegoods.htgo?goodsName=${goodsinfo.getGoodsName()}"><button
				type="button" value="删除商品">删除商品</button></a>
	</form>
	<script type="text/javascript">
var buttons=document.getElementsByTagName("button");
var form=document.getElementsByTagName("form")[0];
buttons[0].addEventListener("click",function(){
	form.action="submitgoods.htgo";
	form.submit();
})
buttons[1].addEventListener("click",function(){
	form.action="deletegoods.htgo";
	form.submit();
})
</script>
</body>
</html>