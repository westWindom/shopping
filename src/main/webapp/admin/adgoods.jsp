<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${title}</title>
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
	    	window.location.href="${pageContext.request.contextPath}/admin/allcart.htgo?current="+api.getCurrent();
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
	<table class="table table-striped">
		<caption style="text-align: left;">所有用户的账户信息如下：</caption>
		<thead>
			<tr>
				<th>广告位号</th>
				<th>当前广告位商品</th>
				<th>状态</th>
				<th>选择当前广告位商品</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>

			<c:if test="${adnum!=0}">

				<c:forEach items="${adlist}" begin="0" end="${adnum-1}" step="1"
					var="adnow">
					<form action="upad.htgo" method="post">
						<tr>
							<td><input type="text" name="goodsId"
								value="${adnow.getGoodsId()}" readonly /></td>
							<td><input type="text" value="${adnow.getGoodsName()}"
								name="goodsName" readonly /> <input type="text"
								value="${adtype}" name="adtype" style="display: none" readonly />
							</td>
							<td><c:forEach items="${invalidgoods}" var="invalid">
									<c:if test="${invalid.getGoodsName()== adnow.getGoodsName()}">
										<input type="text" value="失效" readonly />
									</c:if>
								</c:forEach></td>
							<td><select name="reGoodsId">
									<option selected value="-1">选项</option>
									<c:forEach items="${goodsinfo}" var="goodsnow">
										<option value="${goodsnow.getGoodsId()}">${goodsnow.getGoodsName() }</option>
									</c:forEach>
							</select></td>
							<td><input type="submit" value="更改" /></td>
						</tr>
					</form>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

	<div class="box" style="margin: 10px 20px 10px 20px"></div>

</body>
</html>