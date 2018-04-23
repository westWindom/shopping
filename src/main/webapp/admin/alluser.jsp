<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>所有用户</title>
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
		<caption style="text-align: left;">所有用户信息如下：</caption>
		<thead>
			<tr>
				<th>注册名称</th>
				<th>收货地址</th>
				<th>银行账号</th>
				<th>出生日期</th>
				<th>邮件地址</th>
				<th>身份证</th>
				<th>物流</th>
				<th>密码</th>
				<th>真实姓名</th>
				<th>性别</th>
				<th>操作</th>
				<th>操作</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userinfo}" var="cart" varStatus="cr">

				<form method="POST" action="edituser.htgo">
					<tr>
						<td><input type="text" name="regName" class="branchgdsn"
							style="background: lightGray" readonly
							value="${cart.getRegName()}"></td>
						<td><input type="text" disabled="disabled" class="branchgdsp"
							value="${cart.getAddress()}"></td>
						<td><input type="text" disabled="disabled"
							class="branchgdsnum" value="${cart.getBankId()}"></td>
						<td><input type="text" disabled="disabled"
							value="${cart.getBirthday()}"></td>
						<td><input type="text" disabled="disabled"
							value="${cart.getEmail()}"></td>
						<td><input type="text" disabled="disabled"
							value="${cart.getIdentify()}"></td>
						<td><input type="text" disabled="disabled"
							value="${cart.getLogistics()}"></td>
						<td><input type="text" disabled="disabled"
							value="${cart.getPassword()}"></td>
						<td><input type="text" disabled="disabled"
							value="${cart.getRealName()}"></td>
						<td><input type="text" disabled="disabled"
							value="${cart.getSex()}"></td>
						<td><a href="#" style="text-decoration: none"><input
								type="submit" value="编辑"></a></td>
						<td><a
							href="${pageContext.request.contextPath}/admin/deuser.jsp?username=${cart.getRegName()}"
							style="text-decoration: none"><input type="button" value="删除"></a>
						</td>
					</tr>
				</form>
			</c:forEach>
		</tbody>
	</table>

	<div class="box" style="margin: 10px 20px 10px 20px"></div>
</body>
</html>