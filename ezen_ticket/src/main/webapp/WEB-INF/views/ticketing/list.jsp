<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 리스트</title>

<script type="text/javascript">
$(function(){

	<c:if test="${!empty pageObject.word}">
		$("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
		$("#word").val("${pageObject.word}");
	</c:if>
	
	$(".dataRow").click(function() {
		let no = $(this).find(".no").text();
		location = "view.do?ticketNo=" + no
				+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
				+ "&key=${pageObject.key}&word=${pageObject.word}";
	});
	
});
</script>


<style type="text/css">
.dataRow:hover{
	background: #eee;
	cursor: pointer;
}
</style>

</head>
<body>
<c:if test="${msg == 1}">
	<div class="alert alert-warning alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>예매취소가 완료되었습니다.</strong>
	</div>
</c:if>
<c:if test="${msg == 2}">
	<div class="alert alert-danger alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>예매취소가 완료되지 않았습니다. 다시한번 시도해 주세요.</strong>
	</div>
</c:if>
<div class="card shadow md-4">
	<div class="card-header py-3" style="background: #471C87; color: white">
		<div class="row">
			<div class="col-md-8" style="margin: auto 0;">예매 리스트</div>
			<c:if test="${login.gradeNo == 9}">
				<div class="col-md-4 float-right">
					<form action="list.do" method="post">
						<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
						<div class="input-group mb-3" style="margin: 13px 0 0 0;">
							<select class="form-control" id="key" name="key">
								<option value="c">공연명</option>
								<option value="i">아이디</option>
							</select>
							<input class="form-control" placeholder="Search" id="word" name="word">
							<button class="btn" style="background: #BDD7EE; color: #471C87;">검색</button>
						</div>
					</form>
				</div>
			</c:if>
		</div>
	</div>
	<div class="card-body">
		<c:if test="${login.gradeNo == 1}">
			<div class="alert alert-warning alert-dismissible" style="text-align: center;">
				<strong>최근 1년 이내의 내역을 확인할 수 있습니다.</strong><br>
				그 외의 내역은 관리자에게 문의해 주세요:)
			</div>
		</c:if>
		<table class="table" style="width: 80%; margin: 0 auto;">
			<thead>
				<tr>
					<th>티켓번호</th>
					<c:if test="${login.gradeNo == 9}"><th>아이디</th></c:if>
					<th>공연명</th>
					<th>공연일</th>
					<th>공연장소</th>
					<th>인원수</th>
					<th>예매일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="vo">
					<tr class="dataRow">
						<td class="no">${vo.ticketNo }</td>
						<c:if test="${login.gradeNo == 9}"><td>${vo.id}</td></c:if>
						<td>${vo.name }</td>
						<td>${vo.concertDate }</td>
						<td>${vo.placeName }</td>
						<td>${vo.cnt }</td>
						<td>${vo.ticketDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${login.gradeNo == 9}">
			<div style="display: flex; justify-content: center; margin: 30px 0 0 0;"><pageNav:pageNav listURI="list.do" pageObject="${pageObject }" /></div>
		</c:if>
	</div>
</div>
</body>
</html>