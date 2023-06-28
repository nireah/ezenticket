<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소약관동의</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
$(function() {

	$("#btn").click(function() {
		if(!$("#agree").is(":checked")){
			alert("약관에 동의하지 않은 경우 결제가 불가능합니다.");
			return false;
		}
	});
	
});
</script>

</head>
<body>
<div style="width: 90%; margin: 30px auto;">
	<h4 style="text-align: center; margin: 30px; color: #471C87;">취소 수수료 약관에 동의 후 '결제하기' 버튼을 클릭해주세요.</h4>
	<div class="alert alert-warning alert-dismissible" style="text-align: center;">
		<strong>관람일 10일 전 이상: </strong> 수수료 미부과 <br>
		<strong>관람일 9일전 ~ 7일전까지: </strong> 티켓금액의 10% <br>
		<strong>관람일 6일전 ~ 3일전까지: </strong> 티켓금액의 20% <br>
		<strong>관람일 2일전 ~ 1일전까지: </strong> 티켓금액의 30% <br>
		<strong>관람일 당일: </strong> <span style="color: red">취소 불가</span>
	</div>
	<input type="checkbox" id="agree">
	<label for="agree">위 약관에 동의합니다.(필수)</label>
	<a href="payForm.sub" id="btn" class="btn float-right" style="background: #471C87; color: white;">결제하기</a>
</div>
</body>
</html>