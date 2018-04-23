<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>所有订单</title>
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
	    	window.location.href="${pageContext.request.contextPath}/admin/allorder.htgo?current="+api.getCurrent();
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
	display: block;
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
	<table class="table table-striped">
		<caption style="text-align: left;">所有订单信息如下：</caption>
		<thead>
			<tr>
				<th>商品名称</th>
				<th>订单数量</th>
				<th>是否付款</th>
				<th>购买者</th>
				<th>价格</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orderlist}" var="cart" varStatus="cr">
				<tr>
					<td><input type="text" name="goodsName" class="branchgdsn"
						style="background: lightGray" readonly
						value="${cart.getGoodsName()}"></td>
					<td><input type="text" name="orderNum" class="branchgdsn"
						style="background: lightGray" readonly
						value="${cart.getOrderNum()}"></td>
					<td><input type="text" name="ispay" class="branchgdsn"
						style="background: lightGray" readonly value="${cart.getIspay()}">
					</td>
					<td><input type="text" name="buyer" class="branchgdsn"
						style="background: lightGray" readonly value="${cart.getBuyer()}">
					</td>
					<td><input type="text" name="orderprice" class="branchgdsn"
						style="background: lightGray" readonly
						value="${cart.getOrderprice()}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="box" style="margin: 10px 20px 10px 20px"></div>
</body>
</html>