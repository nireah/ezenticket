<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연 수정</title>

<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
$(function() {

	$("#updateForm").submit(function(){

		if (!$("#name").val()) {
			alert("공연명을 입력해주세요.");
			return false;
		}
		
		if ($("#category").val() == "- 카테고리 -") {
			alert("카테고리를 선택해주세요.");
			return false;
		}
		
		if (!$("#actor").val()) {
			alert("출연진을 입력해주세요.");
			return false;
		}
		
		if (!$("#age2").val() && !$("#age").is(":checked")) {
			alert("관람연령을 입력해주세요.");
			return false;
		}
		
		if (!$("#runtime").val()) {
			alert("관람시간을 입력해주세요.");
			return false;
		}
		
		if (!$("#priceA").val()) {
			alert("가격을 입력해주세요.");
			return false;
		}
		
		if(!confirm("수정하시겠습니까?")) return false;
	});
	
	$("#cancelBtn").click(function(){
		history.back();
	});

	
	$("#age").click(function(){
		let checked = $("#age").is(":checked");
		
		if(checked) {
			$("#age2").val("");
			$("#ageDiv").slideUp();
		}

		if(!checked) {
			$("#ageDiv").slideDown();
		}
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
</style>

</head>
<body>
<div class="card shadow md-4">
	<form action="update.do?no=${vo.no}&search=${search}&page=${param.page }&perPageNum=${param.perPageNum}" method="post" id="updateForm">
		<div class="card-header py-3" style="background: #471C87; color: white">
			<div class="row" style="margin: 0;">
				<div class="col-md-6" style="margin: auto 0;">
					${vo.name} 수정
				</div>
				<div class="col-md-6">
					<div class="float-right" style="margin: 0;">
						<button class="btn btn-light">수정</button>
						<button type="reset" class="btn btn-light">새로입력</button>
						<button type="button" class="btn btn-light" id="cancelBtn">취소</button>
					</div>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-md-4">
					<label for="no" class="float-right">공연번호:</label>
				</div>
				<div class="col-md-8">
					<input class="form-control" name="no" id="no" value="${vo.no}" readonly="readonly" style="width: 50%;">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="name" class="float-right">공연명:</label>
				</div>
				<div class="col-md-8">
					<input class="form-control" name="name" id="name" value="${vo.name}" style="width: 50%;">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="category" class="float-right">공연타입:</label>
				</div>
				<div class="col-md-8">
					<select class="form-control" name="category" id="category" style="width: 50%;">
						<option <c:if test="${vo.category eq '아이돌'}">selected</c:if>>아이돌</option>
						<option <c:if test="${vo.category eq '힙합'}">selected</c:if>>힙합</option>
						<option <c:if test="${vo.category eq '인디'}">selected</c:if>>인디</option>
						<option <c:if test="${vo.category eq '페스티벌'}">selected</c:if>>페스티벌</option>
						<option <c:if test="${vo.category eq '트로트'}">selected</c:if>>트로트</option>
						<option <c:if test="${vo.category eq '내한'}">selected</c:if>>내한</option>
						<option <c:if test="${vo.category eq '기타'}">selected</c:if>>기타</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="actor" class="float-right">출연진:</label>
				</div>
				<div class="col-md-8">
					<input class="form-control" name="actor" id="actor" value="${vo.actor}" style="width: 50%;">
				</div>
			</div>
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<label for="concertDate" class="float-right">공연날짜:</label> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-8"> -->
<%-- 					<c:forEach items="${date}" var="date"> --%>
<%-- 						<input class="form-control" name="concertDate" id="concertDate" value="${date.concertDate}"> --%>
<%-- 					</c:forEach> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<label for="placeNo" class="float-right">공연장소:</label> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-8"> -->
<%-- 					<input class="form-control" name="placeNo" id="placeNo" value="${vo.placeNo} (${vo.placeName})"> --%>
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="row">
				<div class="col-md-4">
					<label for="age" class="float-right">관람연령:</label>
				</div>
				<div class="col-md-8">
					<c:if test="${vo.age eq '전체관람가'}">
						<div class="row" style="margin: 0;">
							<input class="form-control" type="checkbox" checked="checked" name="age" id="age" style="width: 20px;" value="전체관람가">
							<p style="font-size: 12pt; margin: 5px;">전체관람가</p>
						</div>
						<div class="row" style="margin: 0; display: none;" id="ageDiv">
							<input class="form-control" type="number" name="age" id="age2" style="width: 10%;">
							<p style="font-size: 12pt; margin: 5px;">세 이상 관람가능</p>
						</div>
					</c:if>
					<c:if test="${vo.age ne '전체관람가'}">
						<div class="row" style="margin: 0;">
							<input class="form-control" type="checkbox" name="age" id="age" style="width: 20px;" value="전체관람가">
							<p style="font-size: 12pt; margin: 5px;">전체관람가</p>
						</div>
						<div class="row" style="margin: 0;" id="ageDiv">
							<input class="form-control" type="number" name="age" id="age2" value="${vo.age}" style="width: 10%;">
							<p style="font-size: 12pt; margin: 5px;">세 이상 관람가능</p>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="runtime" class="float-right">관람시간:</label>
				</div>
				<div class="col-md-8">
					<div class="row" style="margin: 0;">
						<input class="form-control" type="number" step="10" name="runtime" id="runtime" value="${vo.runtime}" style="width: 30%;">
						<p style="font-size: 12pt; margin: 5px;">분</p>
					</div>
				</div>
			</div>
			<c:if test="${vo.priceR != null}">
				<div class="row" style="margin: 0 auto">
					<div class="col-md-4">
						<label for="priceR" class="float-right">R등급 가격:</label>
					</div>
					<div class="col-md-8">
						<div class="row" style="margin: 0;">
							<input class="form-control" type="number" step="1000" name="priceR" id="priceR" value="${vo.priceR}" style="width: 30%;">
							<p style="font-size: 12pt; margin: 5px;">원</p>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${vo.priceS != null}">
				<div class="row"  style="margin: 0 auto">
					<div class="col-md-4">
						<label for="priceS" class="float-right">S등급 가격:</label>
					</div>
					<div class="col-md-8">
						<div class="row" style="margin: 0;">
							<input class="form-control" type="number" step="1000" name="priceS" id="priceS" value="${vo.priceS}" style="width: 30%;">
							<p style="font-size: 12pt; margin: 5px;">원</p>
						</div>
					</div>
				</div>
			</c:if>
			<div class="row" style="margin: 0 auto">
				<div class="col-md-4">
					<label for="priceA" class="float-right">A등급 가격:</label>
				</div>
				<div class="col-md-8">
					<div class="row" style="margin: 0;">
						<input class="form-control" type="number" step="1000" name="priceA" id="priceA" value="${vo.priceA}" style="width: 30%;">
						<p style="font-size: 12pt; margin: 5px;">원</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="content" class="float-right">상세정보:</label>
				</div>
				<div class="col-md-8">
					<textarea class="form-control" rows="3" name="content" id="content" style="width: 50%;">${vo.content}</textarea>
				</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>