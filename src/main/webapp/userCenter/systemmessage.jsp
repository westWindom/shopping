<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单</title>

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
	    	window.location.href="${pageContext.request.contextPath}/userCenter/comments.htgo?current="+api.getCurrent();
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
	<c:if test="${systemmessage.size()==0}">
您没有系统消息
</c:if>

	<table class="table table-striped">
		<caption>我的评论信息如下：</caption>
		<thead>
			<tr>
				<th>消息内容</th>
				<th>发送时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${systemmessage}" var="order">
				<tr>
					<td>${order.getContents()}</td>
					<td>${order.getTime()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<div class="box" style="float: right"></div>

</body>
</html>