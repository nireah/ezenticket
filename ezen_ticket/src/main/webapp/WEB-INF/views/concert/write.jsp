<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연 등록</title>

<script type="text/javascript">
$(function() {

	$("#writeForm").submit(function(){

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
		
		if(!confirm("등록하시겠습니까?")) return false;
		
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
	<form action="write.do" method="post" id="writeForm" enctype="multipart/form-data">
		<div class="card-header py-3" style="background: #471C87; color: white">
			<div class="row" style="margin: 0;">
				<div class="col-md-6" style="margin: auto 0;">
					공연 등록
				</div>
				<div class="col-md-6">
					<div class="float-right" style="margin: 0;">
						<button class="btn btn-light">등록</button>
						<button type="reset" class="btn btn-light">새로입력</button>
						<button type="button" class="btn btn-light" id="cancelBtn">취소</button>
					</div>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-md-4">
					<label for="name" class="float-right">공연명:</label>
				</div>
				<div class="col-md-8">
					<input class="form-control" name="name" id="name" style="width: 50%;">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="image" class="float-right">이미지:</label>
				</div>
				<div class="col-md-8">
					<input class="form-control" name="file" id="image" type="file" style="width: 50%;">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="category" class="float-right">공연타입:</label>
				</div>
				<div class="col-md-8">
					<select class="form-control" name="category" id="category" style="width: 50%;">
						<option selected="selected">- 카테고리 -</option>
						<option>아이돌</option>
						<option>힙합</option>
						<option>인디</option>
						<option>페스티벌</option>
						<option>트로트</option>
						<option>내한</option>
						<option>기타</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="actor" class="float-right">출연진:</label>
				</div>
				<div class="col-md-8">
					<input class="form-control" name="actor" id="actor" style="width: 50%;">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="age" class="float-right">관람연령:</label>
				</div>
				<div class="col-md-8">
					<div class="row" style="margin: 0;">
						<input class="form-control" type="checkbox" name="age" id="age" style="width: 20px;" value="전체관람가">
						<p style="font-size: 12pt; margin: 5px;">전체관람가</p>
					</div>
					<div class="row" style="margin: 0;" id="ageDiv">
						<input class="form-control" type="number" name="age" id="age2" style="width: 10%;">
						<p style="font-size: 12pt; margin: 5px;">세 이상 관람가능</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="runtime" class="float-right">관람시간:</label>
				</div>
				<div class="col-md-8">
					<div class="row" style="margin: 0;">
						<input class="form-control" type="number" step="10" name="runtime" id="runtime" style="width: 30%;">
						<p style="font-size: 12pt; margin: 5px;">분</p>
					</div>
				</div>
			</div>
			<div class="row" style="margin: 0 auto">
				<div class="col-md-4">
					<label for="priceR" class="float-right">R등급 가격:</label>
				</div>
				<div class="col-md-8">
					<div class="row" style="margin: 0;">
						<input class="form-control" type="number" step="1000" name="priceR" id="priceR" style="width: 30%;">
						<p style="font-size: 12pt; margin: 5px;">원</p>
					</div>
				</div>
			</div>
			<div class="row"  style="margin: 0 auto">
				<div class="col-md-4">
					<label for="priceS" class="float-right">S등급 가격:</label>
				</div>
				<div class="col-md-8">
					<div class="row" style="margin: 0;">
						<input class="form-control" type="number" step="1000" name="priceS" id="priceS" style="width: 30%;">
						<p style="font-size: 12pt; margin: 5px;">원</p>
					</div>
				</div>
			</div>
			<div class="row" style="margin: 0 auto">
				<div class="col-md-4">
					<label for="priceA" class="float-right">A등급 가격:</label>
				</div>
				<div class="col-md-8">
					<div class="row" style="margin: 0;">
						<input class="form-control" type="number" step="1000" name="priceA" id="priceA" style="width: 30%;" placeholder="필수입력사항">
						<p style="font-size: 12pt; margin: 5px;">원</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="content" class="float-right">상세정보:</label>
				</div>
				<div class="col-md-8">
					<textarea class="form-control" rows="3" name="content" id="content" style="width: 50%;"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label for="age" class="float-right">투어:</label>
				</div>
				<div class="col-md-8">
					<input class="form-control" type="checkbox" name="tour" style="width: 20px;" value="1">
				</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>