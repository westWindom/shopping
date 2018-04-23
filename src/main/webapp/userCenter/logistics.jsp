<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物流设置</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="../logisticsupdate.htgo" method="post" id="form"
		target="_parent">
		您的物流:<input type="text" value="${logistics}" id="logistics" disabled>
		<br />
		<br /> 重新选择： <br /> <label class="radio-inline"> <input
			type="radio" name="logistics" id="optionsRadios3" value="申通快递"
			checked> 申通快递
		</label> <label class="radio-inline"> <input type="radio"
			name="logistics" id="optionsRadios4" value="顺丰速运"> 顺丰速运
		</label> <label class="radio-inline"> <input type="radio"
			name="logistics" id="optionsRadios4" value="圆通速递"> 圆通速递
		</label> <br /> <label class="radio-inline"> <input type="radio"
			name="logistics" id="optionsRadios4" value="天天快递"> 天天快递
		</label> <label class="radio-inline"> <input type="radio"
			name="logistics" id="optionsRadios4" value="韵达快运"> 韵达快运
		</label> <label class="radio-inline"> <input type="radio"
			name="logistics" id="optionsRadios4" value="宅急送快递">宅急送快递
		</label> <br /> <label class="radio-inline"> <input type="radio"
			name="logistics" id="optionsRadios4" value="中通速递"> 中通速递
		</label> <label class="radio-inline"> <input type="radio"
			name="logistics" id="optionsRadios4" value="EMS邮政特快"> EMS邮政特快
		</label> <label class="radio-inline"> <input type="radio"
			name="logistics" id="optionsRadios4" value="中诚快递"> 中诚快递
		</label> <br /> <label class="radio-inline"> <input type="radio"
			name="logistics" id="optionsRadios4" value="汇通快递"> 汇通快递
		</label> <br /> <input type="submit" value="更新物流"
			style="margin-top: 20px; margin-left: 10px;">
	</form>
	<br>

</body>
</html>