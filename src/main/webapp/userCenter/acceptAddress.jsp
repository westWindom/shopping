<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>地址设置</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico" rel="SHORTCUT ICON" />
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/css/bootstrap.min.css"></script>
<script src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
<script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
</head>
<body>

	您目前的收货地址为: ${address}
	<br>
	<br> 修改为：
	<br />
	<div id="distpicker2">
		<select id="province"></select> <select id="city"></select> <select
			id="district"></select>
	</div>
	<br /> 详细地址为:
	<input type="text" id="detailAddress" />
	<br />
	<br />
	<input type="button" value="更新地址" onclick="addressSubmit()" />
</body>
<script type="text/javascript">
	$("#distpicker2").distpicker({
		  province: '---- 所在省 ----',
		  city: '---- 所在市 ----',
		  district: '---- 所在区 ----'
	});
</script>
<script type="text/javascript">
function addressSubmit(){
	alert("你确定要更新地址吗？");
	
    var info=$("#province").val()+$("#city").val()+$("#district").val()+$("#detailAddress").val();
     window.open("../addressupdate.htgo?userGoodsLoc="+info,"_parent",true);
}
</script>
</html>