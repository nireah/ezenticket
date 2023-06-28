<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연 상세보기</title>

<script type="text/javascript">
$(function() {

	$("#deleteBtn").click(function(){
		if(!confirm("삭제하시겠습니까?")) return false;
	});
	
	$("#deleteImageBtn").click(function(){
		if(!confirm("삭제하시겠습니까?")) return false;
	});
	
	$(".deleteD").click(function(){
		if(!confirm("삭제하시겠습니까?")) return false;
	});

	$("#updateImageForm").submit(function(){
		if(!confirm("수정하시겠습니까?")) return false;
	});
	
// 	$('[data-toggle="popover"]').popover();

	$("#updateImageBtn").click(function() {
		$("#updateImageDiv").slideDown();
	});
	$("#cancelBtn").click(function() {
		$("#updateImageDiv").slideUp();
	});


	$(".dBtn").click(function() {
		let dno = $(this).parents(".dDataRow").find(".dno").text();
		let placeNo = $(this).parents(".dDataRow").find(".placeNo").text();
		location="/ticketing/seat.do?dno="+dno+"&placeNo="+placeNo;
	});

	
	$(".writeD").click(function() {
		let no = $("#no").val();
		let tour = $("#tour").val();
		window.open("writeDate.sub?no="+no+"&tour="+tour, "writeD", "width= 800, height= 300, top= 250, left= 600");
	});
	
	$(".updateD").click(function() {
		let dno = $(this).parents(".dDataRow").find(".dno").text();
		let no = $("#no").val();
		let tour = $("#tour").val();
		window.open("updateDate.sub?no="+no+"&dno="+dno+"&tour="+tour, "updateD", "width= 800, height= 300, top= 250, left= 600");
	});
	
// 	$(".updateD").click(function() {
// 		let dno = $(this).parents(".dDataRow").find(".dno").text();
// 		let no = $("#no").val();
// 		let tour = $("#tour").val();
// 		location="/concert/updateDate.do?dno="+dno+"&no="+no+"&tour="+tour;
// 	});
	
	$(".deleteD").click(function() {
		let dno = $(this).parents(".dDataRow").find(".dno").text();
		let no = $("#no").val();
		location="/concert/deleteDate.do?dno="+dno+"&no="+no+"&search=${search}&page=${param.page }&perPageNum=${param.perPageNum}";
	});

});
</script>

<style type="text/css">
#updateImageDiv{
	display: none;
}
#updateImageDiv{
	border: solid 2px #471C87;
	padding: 10px;
	width: 99%;
}
.btn-sm{
	background: #471C87;
	color: white;
}
</style>

</head>
<body>
<c:if test="${msg == 1}">
	<div class="alert alert-warning alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>등록이 완료되었습니다.</strong>
	</div>
</c:if>
<c:if test="${msg == 2}">
	<div class="alert alert-danger alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>등록이 완료되지 않았습니다. 다시한번 시도해 주세요.</strong>
	</div>
</c:if>
<c:if test="${msg == 3}">
	<div class="alert alert-warning alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>수정이 완료되었습니다.</strong>
	</div>
</c:if>
<c:if test="${msg == 4}">
	<div class="alert alert-danger alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>수정이 완료되지 않았습니다. 다시한번 시도해 주세요.</strong>
	</div>
</c:if>
<c:if test="${msg == 5}">
	<div class="alert alert-danger alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		이미 예매된 공연으로 수정이 <strong>불가능</strong> 합니다.
	</div>
</c:if>
<c:if test="${msg == 6}">
	<div class="alert alert-warning alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>이미지 삭제가 완료되었습니다.</strong>
	</div>
</c:if>
<c:if test="${msg == 7}">
	<div class="alert alert-danger alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>이미지 삭제가 완료되지 않았습니다. 다시한번 시도해 주세요.</strong>
	</div>
</c:if>
<c:if test="${msg == 8}">
	<div class="alert alert-warning alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>삭제가 완료되었습니다.</strong>
	</div>
</c:if>
<c:if test="${msg == 9}">
	<div class="alert alert-danger alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		이미 예매된 공연으로 삭제가 <strong>불가능</strong> 합니다.
	</div>
</c:if>
<div class="card shadow md-4">
	<div class="card-header py-3" style="background: #471C87; color: white">
		<div class="row">
			<div class="col-md-6" style="margin: auto 0;">
				${vo.name }
			</div>
			<div class="col-md-6">
				<div class="float-right">
					<c:if test="${login.gradeNo == 9}">
						<a class="btn btn-light" href="update.do?no=${vo.no}&search=${search}&page=${param.page }&perPageNum=${param.perPageNum}">수정</a>
						<a id="deleteBtn" class="btn btn-light" href="delete.do?no=${vo.no}&category=${vo.category}&search=${search}&page=${param.page }&perPageNum=${param.perPageNum}">삭제</a>
					</c:if>
					<c:if test="${search eq null || search.length() == 0 || search.equals('null')}">
						<a class="btn btn-light" href="list.do?category=${vo.category}&page=${param.page }&perPageNum=${param.perPageNum}">리스트</a>
					</c:if>
					<c:if test="${search ne null && search.length() != 0 && !search.equals('null')}">
						<a class="btn btn-light" href="search.do?search=${search}&page=${param.page }&perPageNum=${param.perPageNum}">리스트</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="card-body">
		<input type="hidden" id="no" value="${vo.no}">
		<input type="hidden" id="tour" value="${vo.tour}">
		<div class="row">
			<div class="col-md-4">
				<img src="${vo.image}" class="float-right" style="width: 80%">
				<c:if test="${vo.image ne null}">
					<div class="float-right" style="margin: 10px 0;">
						<c:if test="${login.gradeNo == 9}">
							<div class="row">
								<button class="btn btn-sm" id="updateImageBtn" style="margin: 0 5px;">이미지 수정</button>
								<form action="updateImage.do?search=${search}&page=${param.page }&perPageNum=${param.perPageNum}" id="deleteImageForm" method="post" enctype="multipart/form-data">
									<input type="hidden" name="no" value="${vo.no}">
									<input type="hidden" name="deleteFile" value="${vo.image}">
									<button class="btn btn-sm" id="deleteImageBtn">이미지 삭제</button>
								</form>
							</div>
						</c:if>
					</div>
				</c:if>
				<div id="updateImageDiv" class="float-right">
					<form action="updateImage.do?search=${search}&page=${param.page }&perPageNum=${param.perPageNum}" id="updateImageForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="no" value="${vo.no}">
						<input type="hidden" name="deleteFile" value="${vo.image}">
						<div class="form-group form-inline">
							<label for="image">이미지 선택:</label>
							<input class="form-control" name="changeFile" id="image" type="file">
						</div>
						<div class="float-right">
							<button class="btn btn-default btn-sm">바꾸기</button>
							<button class="btn btn-default btn-sm" type="button" id="cancelBtn">취소</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-8">
				<table class="table float-left" style="text-align: center; width: 90%;">
					<tbody>
						<tr>
							<th>공연명</th>
							<td>${vo.name}</td>
						</tr>
						<tr>
							<th>출연진</th>
							<td>${vo.actor}</td>
						</tr>
						<tr>
							<th>관람연령</th>
							<td>${vo.age}</td>
						</tr>
						<tr>
							<th>공연시간</th>
							<td>${vo.runtime}</td>
						</tr>
						<tr>
							<th>가격</th>
							<td>
								<c:if test="${vo.priceR != 0 && vo.priceR ne null}">R석: <fmt:formatNumber pattern="#,###" value="${vo.priceR}" /><br></c:if>
								<c:if test="${vo.priceS != 0 && vo.priceS ne null}">S석: <fmt:formatNumber pattern="#,###" value="${vo.priceS}" /><br></c:if>
								A석: <fmt:formatNumber pattern="#,###" value="${vo.priceA}" />
							</td>
						</tr>
<%-- 						<c:if test="${vo.tour == 0}"> --%>
<!-- 							<tr> -->
<!-- 								<th>공연일</th> -->
<!-- 								<td> -->
<%-- 									<a class="btn btn-sm sub" href="#" title="공연일" data-toggle="popover" data-placement="right" data-content=" --%>
<%-- 								 	<c:forEach items="${date}" var="date">${date.concertDate} / </c:forEach>">자세히보기</a> --%>
<!-- 							 	</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th>공연장소</th> -->
<%-- 								<td>${vo.placeName}</td> --%>
<!-- 							</tr> -->
<%-- 						</c:if> --%>
						<tr>
							<th>상세정보</th>
							<td>${vo.content}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<table class="table" style="text-align: center; width: 100%; margin: 30px auto;">
			<thead>
				<tr style="background: #BDD7EE; color: black;">
					<th style="display: none;">날짜번호</th>
					<c:if test="${vo.tour == 1}"><th>지역</th></c:if>
					<th>공연일</th>
					<th>공연장소</th>
					<th><c:if test="${login.gradeNo == 9}"><button class="btn btn-sm writeD">등록</button></c:if></th>
					<th></th>
					<th style="display: none;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${date }" var="date">
					<tr class="dataRow dDataRow">
						<td class="dno" style="display: none;">${date.dno }</td>
						<c:if test="${date.local ne null}"><td>${date.local }</td></c:if>
						<td>${date.concertDate }</td>
						<td>${date.placeName }</td>
						<td>
							<c:if test="${login.gradeNo == 1}">
								<button class="btn btn-sm dBtn">예매</button>
							</c:if>
							<c:if test="${login.gradeNo == 9}">
								<button class="btn btn-sm updateD">수정</button>
								<button class="btn btn-sm deleteD">삭제</button>
							</c:if>
						</td>
						<td class="placeNo" style="display: none;">${date.placeNo}<td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>