<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 등록</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
$(function() {

	$("#writeForm").submit(function(){

		if (!$("#date").val()) {
			alert("날짜를 입력해주세요.");
			return false;
		}
		
		if (!$("#time").val()) {
			alert("시간을 입력해주세요.");
			return false;
		}

		if("${tour}" == 1) {
			if (!$("#local").val()) {
				alert("지역을 입력해주세요.");
				return false;
			}
		}
		
		if ($("#placeNo").val() == "- 장소 -") {
			alert("장소를 선택해주세요.");
			return false;
		}
		
		if(!confirm("등록하시겠습니까?")) return false;
	});
	
	$("#cancelBtn").click(function(){
		window.close();
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
<div class="container" style="margin: 40px auto;">
	<form action="writeDate.sub" method="post" id="writeForm">
		<input id="no" name="no" type="hidden" value="${no}">
		<div class="row">
			<div class="col-md-3">
				<label for="date" class="float-right">공연날짜:</label>
			</div>
			<div class="col-md-3">
				<input class="form-control" type="date" name="date" id="date" style="width: 100%;">
			</div>
			<div class="col-md-3">
				<input class="form-control" type="time" name="time" id="time" style="width: 100%;">
			</div>
		</div>
		<c:if test="${tour == 1}">
			<div class="row">
				<div class="col-md-3">
					<label for="local" class="float-right">지역:</label>
				</div>
				<div class="col-md-9">
					<input class="form-control" name="local" id="local" style="width: 70%;">
				</div>
			</div>
		</c:if>
		<div class="row">
			<div class="col-md-3">
				<label for="placeNo" class="float-right">공연장소:</label>
			</div>
			<div class="col-md-9">
				<select class="form-control" name="placeNo" id="placeNo" style="width: 70%;">
					<option selected>- 장소 -</option>
					<option value="1">이젠문화회관 자바홀</option>
					<option value="2">이젠대학교 대강당</option>
				</select>
			</div>
		</div>
		<div class="float-right" style="margin: 0;">
			<button class="btn btn-light">등록</button>
			<button type="reset" class="btn btn-light">새로입력</button>
			<button type="button" class="btn btn-light" id="cancelBtn">취소</button>
		</div>
	</form>
</div>
</body>
</html>