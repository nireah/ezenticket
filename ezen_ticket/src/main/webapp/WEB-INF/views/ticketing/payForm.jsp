<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제정보입력</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
$(function() {

	function DelComma(stringNumber){
	    return parseInt(stringNumber.replace(/,/g , ''));
	}
	
	$("#card1").on("keyup", function() {
		if (this.value.length == 4) {
			$("#card2").focus();
		}
	});
	
	$("#card2").on("keyup", function() {
		if (this.value.length == 4) {
			$("#card3").focus();
		}
	});
	
	$("#card3").on("keyup", function() {
		if (this.value.length == 4) {
			$("#card4").focus();
		}
	});


	$("#submitBtn").click(function() {
		$("#price", opener.document).val(DelComma($("#price", opener.document).val()));
		$("#fee", opener.document).val(DelComma($("#fee", opener.document).val()));
		$("#sum", opener.document).val(DelComma($("#sum", opener.document).val()));
		if(!confirm("예매하시겠습니까?")) return false;
		
		$(opener.document).find("#payForm").attr("action","pay.do").submit();
		window.close();
	});
});
</script>

<style type="text/css">
.row{
	margin: 10px;
}
</style>

</head>
<body>
<div style="width: 90%; margin: 30px auto;">
	<div class="row">
		<div class="col-md-4">
			<label class="float-right">카드사: </label>
		</div>
		<div class="col-md-7 form-inline">
			<select class="form-control">
				<option selected>-카드사-</option>
				<option>농협</option>
				<option>신한</option>
				<option>국민</option>
				<option>우리</option>
				<option>하나</option>
				<option>카카오</option>
				<option>새마을</option>
				<option>우체국</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<label class="float-right">카드번호: </label>
		</div>
		<div class="col-md-7 form-inline">
			<input class="form-control" id="card1" style="width: 80px;">&nbsp;-&nbsp;
			<input class="form-control" id="card2" type="password" style="width: 80px;">&nbsp;-&nbsp;
			<input class="form-control" id="card3" type="password" style="width: 80px;">&nbsp;-&nbsp;
			<input class="form-control" id="card4" style="width: 80px;">
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<label class="float-right">유효기간: </label>
		</div>
		<div class="col-md-7 form-inline">
			<select class="form-control">
				<option selected>-월-</option>
				<option>01</option>
				<option>02</option>
				<option>03</option>
				<option>04</option>
				<option>05</option>
				<option>06</option>
				<option>07</option>
				<option>08</option>
				<option>09</option>
				<option>10</option>
				<option>11</option>
				<option>12</option>
			</select>
			<select class="form-control">
				<option selected>-연도-</option>
				<option>2023</option>
				<option>2024</option>
				<option>2025</option>
				<option>2026</option>
				<option>2027</option>
				<option>2028</option>
				<option>2029</option>
				<option>2030</option>
				<option>2031</option>
				<option>2032</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<label class="float-right">cvc번호: </label>
		</div>
		<div class="col-md-7 form-inline">
			<input class="form-control" type="password" style="width: 80px;">
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<label class="float-right">결제 비밀번호: </label>
		</div>
		<div class="col-md-7 form-inline">
			<input class="form-control" type="password" style="width: 120px;">
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<label class="float-right">환불 시 계좌: </label>
		</div>
		<div class="col-md-7 form-inline">
			<select class="form-control">
				<option selected>-은행-</option>
				<option>농협</option>
				<option>신한</option>
				<option>국민</option>
				<option>우리</option>
				<option>하나</option>
				<option>카카오</option>
				<option>새마을</option>
				<option>우체국</option>
			</select>
			<input class="form-control" style="width: 300px;" placeholder="-를 포함하여 정확히 입력해주세요.">
		</div>
	</div>
	
	<button id="submitBtn" class="btn float-right" style="background: #471C87; color: white; margin: 15px;">결제</button>
</div>
</body>
</html>