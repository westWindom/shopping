<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>所有评论</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico" rel="SHORTCUT ICON" />
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
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
	    	window.location.href="${pageContext.request.contextPath}/admin/allcomments.htgo?current="+api.getCurrent();
	    }
	});
});
</script>
<style type="text/css">
.branchs {
	margin-top: 20px;
	background: yellow;
	color: black;
}

.branch {
	width: 200px;
	display: inline-block;
}

.aditanddelete {
	margin: 10px;
	display: block;
	text-align: right;
}

.branch {
	
}

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
	<table class="table table-striped" style="width: 100%;">
		<caption style="text-align: left;">所有评论信息如下：</caption>
		<thead>
			<tr>
				<th>评论者</th>
				<th>商品名称</th>
				<th>评论内容</th>
				<th>评论时间</th>
				<th>评论等级</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${comments}" var="cart" varStatus="cr">
				<tr>
					<td>${cart.getUserName()}</td>
					<td>${cart.getGoods()}</td>
					<td>${cart.getComments()}</td>
					<td>${cart.getTime()}</td>
					<td>${cart.getGrade()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="box" style="margin: 10px 20px 10px 20px"></div>
</body>
</html>