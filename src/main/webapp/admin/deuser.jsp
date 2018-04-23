<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico" rel="SHORTCUT ICON" />
</head>
<body>
	<form action="deleteuser.htgo" method="post">
		<input type="text" value="${param['username']}" name="regName" />
	</form>
	<script type="text/javascript">
document.getElementsByTagName("form")[0].submit();
</script>
</body>
</html>