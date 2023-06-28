<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연 수정</title>

<script type="text/javascript">
$(function() {

	$("#cancelBtn").click(function(){
		history.back();
	});
	
});
</script>

<style type="text/css">
.row{
	margin: 15px 0;
}

.float-right{
	margin: 5px 0 0 0;
}
h4{
	text-align: center;
	margin: 0 0 30px 0;
	color: #471C87;
}
</style>

</head>
<body>
<div class="card shadow md-4">
	<div class="card-header py-3" style="background: #471C87; color: white;">
		<div class="row" style="margin: 0;">
			<div class="col-md-6" style="margin: auto 0;">
				<i class="far fa-check-square fa-lg" style="margin: 0 10px;"></i> 예약 정보 확인
			</div>
			<div class="col-md-6">
				<div class="float-right">
					<button type="button" class="btn btn-light" id="cancelBtn">좌석 다시 선택</button>
				</div>
			</div>
		</div>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-md-3" style="border: 3px solid #BDD7EE; padding: 10px; margin: 10px 25px;">
				<h4>[예매자 정보]</h4>
				<div class="row">
					<div class="col-md-4">
						<label for="id" class="float-right">아이디:</label>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="id" id="id" value="${mvo.id}" readonly="readonly" style="width: 100%;">
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label for="name" class="float-right">이름:</label>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="name" id="name" value="${mvo.name}" readonly="readonly" style="width: 100%;">
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label for="birth" class="float-right">생년월일:</label>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="birth" id="birth" value="${mvo.birth}" readonly="readonly" style="width: 100%;">
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label for="tel" class="float-right">연락처:</label>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="tel" id="tel" value="${mvo.tel}" readonly="readonly" style="width: 100%;">
					</div>
				</div>
			</div>
			<div class="col-md-4" style="border: 3px solid #BDD7EE; padding: 10px; margin: 10px;">
				<h4>[공연 정보]</h4>
				<div class="row">
					<div class="col-md-4">
						<label for="name" class="float-right">공연명:</label>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="name" id="name" value="${dvo.name}" readonly="readonly" style="width: 100%;">
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label for="actor" class="float-right">출연진:</label>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="actor" id="actor" value="${dvo.actor}" readonly="readonly" style="width: 100%;">
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label for="concertDate" class="float-right">공연일:</label>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="concertDate" id="concertDate" value="${dvo.concertDate}" readonly="readonly" style="width: 100%;">
					</div>
				</div>
				<c:if test="${dvo.local ne null}">
					<div class="row">
						<div class="col-md-4">
							<label for="local" class="float-right">지역:</label>
						</div>
						<div class="col-md-8">
							<input class="form-control" name="local" id="local" value="${dvo.local}" readonly="readonly" style="width: 100%;">
						</div>
					</div>
				</c:if>
				<div class="row">
					<div class="col-md-4">
						<label for="placeName" class="float-right">공연장소:</label>
					</div>
					<div class="col-md-8">
						<input class="form-control" name="placeName" id="placeName" value="${dvo.placeName}" readonly="readonly" style="width: 100%;">
					</div>
				</div>
			</div>
			<div class="col-md-4" style="border: 3px solid #BDD7EE; padding: 10px; margin: 10px auto;">
				<h4>[나의 예매 정보]</h4>
					<p style="text-align: center;">좌석등급 - 좌석번호</p>
				<form action="pay.do">
					<input type="hidden" name="id" value="${mvo.id}">
					<input type="hidden" name="cnt" value="${vo.cnt}">
					<input type="hidden" name="dno" value="${dvo.dno}">
					<input type="hidden" name="priceR" value="${dvo.priceR}">
					<input type="hidden" name="priceS" value="${dvo.priceS}">
					<input type="hidden" name="priceA" value="${dvo.priceA}">
					<c:forTokens var="seatNo" items="${vo.seatNo}" delims=",">
						<div class="row">
							<div class="col-md-6">
								<input class="form-control float-right" name="seatGrade" value="${seatNo.substring(0, 1)}" readonly="readonly" style="width: 80%; margin: 0;">
							</div>
							<div class="col-md-6">
								<input class="form-control" name="seatNo" value="${seatNo.substring(2)}" readonly="readonly" style="width: 80%;">
							</div>
						</div>
					</c:forTokens>
					<button class="btn float-right" style="background:  #471C87; color: white;">예매하기</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>