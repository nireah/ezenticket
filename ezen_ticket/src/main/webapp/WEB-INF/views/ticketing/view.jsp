<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 상세보기</title>

<script type="text/javascript">
$(function() {

	// 현재일 구하기
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth();
	var day = now.getDate();
	var sysdate = new Date(year, month, day);

	// 콘서트일 구하기
	var conDate = $("#concertDate").text().substr(0,8);
	var conDate = conDate.split(".");
	var concertDate = new Date("20"+conDate[0], conDate[1]-1, conDate[2]);

	// 시간으로 변환 후 차이 구하기
	var RMTime = concertDate.getTime() - sysdate.getTime();

	// 시간을 일로 변환하기
	var RMDays = RMTime / (1000*60*60*24);

	// 잔여일이 음수일 경우 취소버튼 보이지 않게 하기
	if(RMDays < 0) {
		$("#deleteBtn").hide();
	}

	// 취소버튼을 누를 경우
	$("#deleteBtn").click(function(){

		// 콘서트 당일인 경우
		if(RMDays == 0) {
			alert("공연 당일은 취소가 불가능 합니다.");
			return false;
			
		} else if(RMDays <= 2) {
			alert("공연일 " + RMDays + "일 전이므로 티켓 금액의 70%가 \n결제시 입력하신 계좌로 환불 가능합니다.");
		} else if(RMDays <= 6) {
			alert("공연일 " + RMDays + "일 전이므로 티켓 금액의 80%가 \n결제시 입력하신 계좌로 환불 가능합니다.");
		} else if(RMDays <= 9) {
			alert("공연일 " + RMDays + "일 전이므로 티켓 금액의 90%가 \n결제시 입력하신 계좌로 환불 가능합니다.");
		} else {
			alert("취소 금액 전체가 결제시 입력하신 계좌로 환불 가능합니다.");
		}
		
		if(!confirm("예매를 취소 하시겠습니까?")) return false;
	});
	
});
</script>

<style type="text/css">

</style>

</head>
<body>
<c:if test="${msg == 1}">
	<div class="alert alert-warning alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>예매가 완료되었습니다.</strong>
	</div>
</c:if>
<c:if test="${msg == 2}">
	<div class="alert alert-danger alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>예매가 완료되지 않았습니다. 다시한번 시도해 주세요.</strong>
	</div>
</c:if>
<%-- <c:if test="${msg == 3}"> --%>
<!-- 	<div class="alert alert-danger alert-dismissible"> -->
<!-- 		<button type="button" class="close" data-dismiss="alert">×</button> -->
<!-- 		<strong>삭제가 완료되지 않았습니다. 다시한번 시도해 주세요.</strong> -->
<!-- 	</div> -->
<%-- </c:if> --%>
<div class="card shadow md-4">
	<div class="card-header py-3" style="background: #471C87; color: white">
		<div class="row">
			<div class="col-md-6" style="margin: auto 0;">
				예매 정보 보기
			</div>
			<div class="col-md-6">
				<div class="float-right">
					<c:if test="${login.id eq vo.id}">
<%-- 						<a class="btn btn-light" href="update.do?ticketNo=${vo.ticketNo}">예매 수정</a> --%>
						<a id="deleteBtn" class="btn btn-light" href="delete.do?ticketNo=${vo.ticketNo}&concertDate=${vo.concertDate}">예매 취소</a>
					</c:if>
					<c:if test="${login.gradeNo == 9 }">
						<a	class="btn btn-light" href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}">리스트</a>
					</c:if>
					<c:if test="${login.gradeNo == 1 }">
						<a	class="btn btn-light" href="list.do">리스트</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="card-body">
		<table class="table" style="text-align: center; width: 70%; margin: 0 auto;">
			<tbody>
				<tr>
					<th>예매번호</th>
					<td>${vo.ticketNo}</td>
				</tr>
				<c:if test="${login.gradeNo == 9}">
					<tr>
						<th>아이디</th>
						<td>${vo.id}</td>
					</tr>
				</c:if>
				<tr>
					<th>콘서트명</th>
					<td>${vo.name}</td>
				</tr>
				<tr>
					<th>관람일</th>
					<td id="concertDate">${vo.concertDate}</td>
				</tr>
				<c:if test="${vo.local ne null}">
					<tr>
						<th>지역</th>
						<td>${vo.local}</td>
					</tr>
				</c:if>
				<tr>
					<th>장소</th>
					<td>${vo.placeName}</td>
				</tr>
				<tr>
					<th>예매일</th>
					<td>${vo.ticketDate}</td>
				</tr>
				<tr>
					<th>결제방식</th>
					<td>${vo.type}</td>
				</tr>
				<tr>
					<th>좌석가격</th>
					<td><fmt:formatNumber pattern="#,###">${vo.price}</fmt:formatNumber> 원</td>
				</tr>
				<tr>
					<th>수수료</th>
					<td><fmt:formatNumber pattern="#,###">${vo.fee}</fmt:formatNumber> 원</td>
				</tr>
				<tr>
					<th>총 지불금액</th>
					<td><fmt:formatNumber pattern="#,###">${vo.total}</fmt:formatNumber> 원</td>
				</tr>
				<tr>
					<th>인원수</th>
					<td>${vo.cnt} 명</td>
				</tr>
				<tr>
					<th>좌석정보</th>
					<td>
						<c:forEach items="${list}" var="vo">
							${vo.seatGrade} - ${vo.seatNo}
							<br>
						</c:forEach>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>