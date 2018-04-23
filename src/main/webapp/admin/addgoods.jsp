<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加商品</title>
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
	添加商品：
	<p>
	<form action="addgoods.htgo" method="post"
		enctype="multipart/form-data">
		<div>
			<span>商品名称：</span><input type="text" name="goodsName" />
		</div>
		<div>
			<span>商品价格：</span><input type="text" name="goodsprice" />
		</div>
		<div>
			<span>商品库存：</span><input type="text" name="goodsNum" />
		</div>
		<div>
			<span>制造商：</span><input type="text" name="goodsMaker" />
		</div>
		<div>
			<span>描述：</span><input type="text" name="goodsDesc" />
		</div>
		<div>
			<span>图片：</span><input type="file" name="goodspicfile" />图片格式：jepg,jpg,png。图片大小：1M
		</div>
		<div>
			<span>目录：</span><select name="goodsCategory">
				<option value="1" selected>数码相机</option>
				<option value="2">手机</option>
				<option value="3">电脑</option>
				<option value="4">DIY</option>
				<option value="5">智能</option>
				<option value="6">外设</option>
				<option value="7">硬件</option>
				<option value="0">其它</option>
			</select>
		</div>
		<input type="submit" value="提交" />
	</form>
</body>
</html>