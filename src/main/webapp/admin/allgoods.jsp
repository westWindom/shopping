<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>所有商品</title>
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
	    	window.location.href="${pageContext.request.contextPath}/admin/allgoods.htgo?current="+api.getCurrent();
	    }
	});
});
</script>
<style type="text/css">
.branchs {
	margin-top: 20px;
}

.branch {
	width: 200px;
	display: inline-block;
}

.aditanddelete {
	text-align: right;
}

.branch {
	
}

input {
	width: 100%;
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
		<caption>所有商品信息如下：</caption>
		<thead>
			<tr>
				<th>名称</th>
				<th>价格</th>
				<th>数量</th>
				<th>种类</th>
				<th>操作</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>


			<c:forEach items="${goodsinfo}" var="cart" varStatus="cr">
				<form method="POST" action="editgoods.htgo">
					<tr>
						<td><input type="text" name="goodsName" class="branchgdsn"
							style="background: lightGray" readonly
							value="${cart.getGoodsName()}"></td>
						<td><input type="text" class="branchgdsp" disabled="disabled"
							value="${cart.getGoodsprice()}"></td>
						<td><input type="text" class="branchgdsnum"
							disabled="disabled" value="${cart.getGoodsNum()}"></td>
						<td><select disabled>
								<c:if test="${cart.getGoodsCategory()==1}">
									<option selected>数码</option>
									<option>手机</option>
									<option>电脑</option>
									<option>DIY</option>
									<option>外设</option>
									<option>智能</option>
									<option>其它</option>
								</c:if>
								<c:if test="${cart.getGoodsCategory()==2}">
									<option>数码</option>
									<option selected>手机</option>
									<option>电脑</option>
									<option>DIY</option>
									<option>外设</option>
									<option>智能</option>
									<option>其它</option>
								</c:if>
								<c:if test="${cart.getGoodsCategory()==3}">
									<option>数码</option>
									<option>手机</option>
									<option selected>电脑</option>
									<option>DIY</option>
									<option>外设</option>
									<option>智能</option>
									<option>其它</option>
								</c:if>
								<c:if test="${cart.getGoodsCategory()==4}">
									<option>数码</option>
									<option>手机</option>
									<option>电脑</option>
									<option selected>DIY</option>
									<option>外设</option>
									<option>智能</option>
									<option>其它</option>
								</c:if>
								<c:if test="${cart.getGoodsCategory()==5}">
									<option>数码</option>
									<option>手机</option>
									<option>电脑</option>
									<option>DIY</option>
									<option selected>外设</option>
									<option>智能</option>
									<option>其它</option>
								</c:if>
								<c:if test="${cart.getGoodsCategory()==6}">
									<option>数码</option>
									<option>手机</option>
									<option>电脑</option>
									<option>DIY</option>
									<option>外设</option>
									<option selected>智能</option>
									<option>其它</option>
								</c:if>
								<c:if test="${cart.getGoodsCategory()==0}">
									<option>数码</option>
									<option>手机</option>
									<option>电脑</option>
									<option>DIY</option>
									<option>外设</option>
									<option>智能</option>
									<option selected>其它</option>
								</c:if>
						</select></td>
						<td><a href="#" style="text-decoration: none"><input
								type="submit" value="编辑"></a></td>
						<td><a
							href="deletegoods.htgo?goodsName=${cart.getGoodsName()}"
							style="text-decoration: none"><input type="button" value="删除"></a>
						</td>
					</tr>
				</form>
			</c:forEach>

		</tbody>
	</table>
	<div class="box" style="float: right"></div>
</body>
</html>