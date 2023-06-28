<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연 리스트</title>

<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
$(function() {

	$(".dataRow").click(function() {
		let no = $(this).data("no");
		location = "view.do?no=" + no + "&search=${search}"
				+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
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
	<div class="alert alert-primary alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>삭제가 완료되었습니다.</strong>
	</div>
</c:if>
<c:if test="${msg == 2}">
	<div class="alert alert-danger alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">×</button>
		이미 예매된 공연으로 삭제가 <strong>불가능</strong> 합니다.
	</div>
</c:if>
<div class="card shadow md-4">
	<div class="card-header py-3" style="background: #471C87; color: white">
		<div class="row">
			<div class="col-md-6" style="margin: auto 0;">
				<c:if test="${search eq null || search.length() == 0}">
					${category} 리스트
				</c:if>
				<c:if test="${search ne null && search.length() != 0}">
					"${search}" 검색결과
				</c:if>
			</div>
			<div class="col-md-6">
				<c:if test="${login.gradeNo == 9}">
				<c:if test="${search eq null || search.length() == 0}">
					<a class="btn btn-light float-right" href="write.do">공연등록</a>
				</c:if>
				</c:if>
			</div>
		</div>
	</div>
	<div class="card-body">
		<!-- 한 줄 출력 -->
		<div class="row">
			<!-- 데이터 수 만큼 반복 -->
			<c:forEach items="${list }" var="vo" varStatus="vs">
				<!-- 한 줄에 4개씩 출력하기 위해 4의 배수의 경우 줄 바꿈 -->
				<c:if test="${vs.index != 0 && vs.index % 4 == 0}">
					${"</div>"}
					${"<div class=\"row\">"}
				</c:if>
				<div class="col-md-3 dataRow" data-no="${vo.no}">
					<div class="card" style="margin: 10px 0;">
						<img class="card-img-top" src="${vo.image }" style="width: 100%">
						<div class="card-body">
							<h4 class="card-title">${vo.name }</h4>
							<p class="card-text">
								${vo.actor }<br>
								${vo.placeName }
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${login.gradeNo == 9}">
			<c:if test="${search eq null || search.length() == 0}">
				<div style="display: flex; justify-content: center; margin: 30px 0 0 0;"><pageNav:pageNav listURI="list.do" pageObject="${pageObject }" query="&category=${category}" /></div>
			</c:if>
			<c:if test="${search ne null && search.length() != 0}">
				<div style="display: flex; justify-content: center; margin: 30px 0 0 0;"><pageNav:pageNav listURI="search.do" pageObject="${pageObject }" query="&search=${search}" /></div>
			</c:if>
		</c:if>
	</div>
</div>

</body>
</html>