<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style type="text/css">
h2{
	color: #471C87;
	font-weight: bold;
	text-align: center;
	margin: 40px;
}
input, #btn{
	margin: 10px 0;
}
#btn{
	height: 85px;
	background: #471C87;
	color: white;
}
</style>

</head>
<body>
<div class="container" style="text-align: center;">
	<div style="width: 70%; margin: 0 auto;">
		<h2>로그인</h2>
		<br>
		<c:if test="${msg == 1}">
			<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<strong>로그인 실패!</strong> 다시한번 시도해 주세요.
			</div>
		</c:if>
		<form action="login.do" method="post" id="loginForm">
			<div class="row">
				<div class="col-md-10">
					<input id="id" class="form-control" name="id" placeholder="아이디">
					<input id="pw" type="password" class="form-control" name="pw" placeholder="비밀번호">
				</div>
				<div class="col-md-2">
					<button id="btn" class="btn btn-default pull-right">로그인</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>