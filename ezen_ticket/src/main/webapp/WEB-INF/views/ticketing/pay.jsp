<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘서트 결제</title>

<script type="text/javascript">
$(function() {

	function AddComma(num) {
        var regexp = /\B(?=(\d{3})+(?!\d))/g;
        return num.toString().replace(regexp, ',');
    }

	function DelComma(num){
	    return parseInt(num.replace(/,/g , ''));
	}
	
	let price = 0;
	$(".grade").each(function() {
		if($(this).val() == "R") {
			$(this).parents("#row").find("#seatPrice").val(AddComma("${cvo.priceR}"));
			price += parseInt("${cvo.priceR}");
		} else if($(this).val() == "S") {
			$(this).parents("#row").find("#seatPrice").val(AddComma("${cvo.priceS}"));
			price += parseInt("${cvo.priceS}");
		} else {
			$(this).parents("#row").find("#seatPrice").val(AddComma("${cvo.priceA}"));
			price += parseInt("${cvo.priceA}");
		}
	});

	$("#price").val(AddComma(price));

	let sum = parseInt(DelComma($("#price").val())) + parseInt(DelComma($("#fee").val()));
	$("#sum").val(AddComma(sum));
	
	$("#cancelBtn").click(function(){
		history.back();
	});


	$("#payBtn").click(function(){
		
		window.open("agree.sub", "payForm", "width= 800, height= 400, top= 250, left= 600");
		
	});

// 	$("#payForm").submit(function() {
		
// 		$("#price").val(DelComma($("#price").val()));
// 		$("#fee").val(DelComma($("#fee").val()));
// 		$("#sum").val(DelComma($("#sum").val()));

// 		if(!confirm("예매하시겠습니까?")) return false;
		
// 	});
	
});
</script>

<style type="text/css">
.float-right{
	margin: 5px 0 0 0;
}
.row{
	margin: 10px;
}
</style>

</head>
<body>
<div class="card shadow md-4">
	<div class="card-header py-3" style="background: #471C87; color: white">
		<div class="row" style="margin: 0;">
			<div class="col-md-6" style="margin: auto 0;">
				<i class="far fa-credit-card fa-lg" style="margin: auto 10px;"></i> 결제
			</div>
			<div class="col-md-6">
				<div class="float-right">
					<button type="button" class="btn btn-light" id="cancelBtn">이전으로</button>
				</div>
			</div>
		</div>
	</div>
	<div class="card-body">
		<form action="pay.do" method="post" id="payForm">
			<input type="hidden" name="id" value="${vo.id}">
			<input type="hidden" name="cnt" value="${vo.cnt}">
			<input type="hidden" name="dno" value="${vo.dno}">
			<div class="row">
				<div class="col-md-6" style="border: 3px solid #BDD7EE; padding: 10px; margin: 10px auto;">
					<div class="row">
						<div class="col-md-8">
							<div class="row" style="margin: 0">
								<p style="text-align: center; width: 30%; margin: 0 auto;">좌석등급</p>
								<p style="text-align: center; width: 50%; margin: 0 auto;">좌석가격</p>
							</div>
							<c:forTokens var="seatGrade" items="${vo.seatGrade}" delims=",">
								<div class="row" id="row" style="margin: 15px auto;">
									<input class="form-control grade" name="seatGrade" value="${seatGrade}" readonly="readonly" style="width: 30%; margin: 0 auto;">
									<input class="form-control" id="seatPrice" readonly="readonly" style="width: 50%; margin: 0 auto;">
								</div>
							</c:forTokens>
						</div>
						<div class="col-md-3">
							<p style="text-align: center;">좌석번호</p>
							<c:forTokens var="seatNo" items="${vo.seatNo}" delims=",">
								<input class="form-control" name="seatNo" value="${seatNo}" readonly="readonly" style="width: 80%; margin: 15px auto;">
							</c:forTokens>
						</div>
					</div>
				</div>
				<div class="col-md-5" style="border: 3px solid #BDD7EE; padding: 10px; margin: 10px auto;">
					<p style="text-align: center; margin: 10px;">결제할 가격</p>
					<div class="row">
						<div class="col-md-4">
							<label for="price" class="float-right">티켓 가격:</label>
						</div>
						<div class="col-md-7">
							<input class="form-control" id="price" name="price" readonly="readonly" style="width: 80%;">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label for="fee" class="float-right">수수료:</label>
						</div>
						<div class="col-md-7">
								<input class="form-control" id="fee" name="fee" value="<fmt:formatNumber value="${vo.cnt * 1000}" pattern="#,###" />" readonly="readonly" style="width: 80%;">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label for="sum" class="float-right">총 금액:</label>
						</div>
						<div class="col-md-7">
							<input class="form-control" id="sum" name="total" readonly="readonly" style="width: 80%;">
						</div>
					</div>
				</div>
			</div>
			<button type="button" id="payBtn" class="btn float-right" style="background: #471C87; color: white; margin: 15px;">결제</button>
		</form>
	</div>
</div>
</body>
</html>