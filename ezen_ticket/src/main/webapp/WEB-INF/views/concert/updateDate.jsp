<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 수정</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
$(function() {

	$("#updateForm").submit(function(){
		if(!confirm("수정하시겠습니까?")) return false;
	});
	
	$("#cancelBtn").click(function(){
		window.close();
	});
	
	$("#date").datepicker({
		dateFormat: "yy.mm.dd"
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
<c:if test="${msg == 1}">
	<div style="width: 70%; margin: 0 auto;">
		<div class="alert alert-danger alert-dismissible">
			이미 예매된 공연으로 수정이 <strong>불가능</strong> 합니다.
		</div>
		<button type="button" class="btn btn-light float-right" id="cancelBtn">취소</button>
	</div>
</c:if>
<c:if test="${msg ne 1}">
	<form action="updateDate.sub" method="post" id="updateForm">
		<input name="no" type="hidden" value="${vo.no}">
		<input name="dno" type="hidden" value="${vo.dno}">
		<div class="row">
			<div class="col-md-3">
				<label for="date" class="float-right">공연날짜:</label>
			</div>
			<div class="col-md-3">
				<input class="form-control" type="date" name="date" id="date" value="<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />" style="width: 100%;">
			</div>
			<div class="col-md-3">
				<input class="form-control" type="time" name="time" id="time" value="${time}" style="width: 100%;">
			</div>
		</div>
		<c:if test="${tour == 1}">
			<div class="row">
				<div class="col-md-3">
					<label for="local" class="float-right">지역:</label>
				</div>
				<div class="col-md-9">
					<input class="form-control" name="local" id="local" value="${vo.local}" style="width: 70%;">
				</div>
			</div>
		</c:if>
		<div class="row">
			<div class="col-md-3">
				<label for="placeNo" class="float-right">공연장소:</label>
			</div>
			<div class="col-md-9">
				<select class="form-control" name="placeNo" id="placeNo" style="width: 70%;">
					<option value="1" <c:if test="${vo.placeName eq '이젠문화회관 자바홀'}">selected</c:if>>이젠문화회관 자바홀</option>
					<option value="2" <c:if test="${vo.placeName eq '이젠대학교 대강당'}">selected</c:if>>이젠대학교 대강당</option>
				</select>
			</div>
		</div>
		<div class="float-right" style="margin: 0;">
			<button class="btn btn-light">수정</button>
			<button type="reset" class="btn btn-light">새로입력</button>
			<button type="button" class="btn btn-light" id="cancelBtn">취소</button>
		</div>
	</form>
</c:if>
</div>
</body>
</html>