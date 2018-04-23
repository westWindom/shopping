<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发送消息</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico" rel="SHORTCUT ICON" />
</head>
<body>
	<form action="upmessage.htgo" method="post">
		<div>消息内容:</div>
		<div>
			<textarea rows="10" cols="20" name="text"></textarea>
		</div>
		<div>
			<div>接受者：</div>
			<div>
				<select name="accepter">
					<option value="">无</option>
					<c:forEach items="${userinfo }" var="user">
						<option value="${user.getRegName()}">${user.getRegName()}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div>
			<input type="submit" value="发送信息" />
		</div>
	</form>
</body>
</html>