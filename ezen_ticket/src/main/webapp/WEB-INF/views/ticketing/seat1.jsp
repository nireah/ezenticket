<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석선택</title>

<script type="text/javascript">
$(function() {

	$("#seatForm").submit(function() {
		let cnt = $("input:checkbox:checked").length;
		$("#cnt").val(cnt);
	});
	
});
</script>

<style type="text/css">
input[type="checkbox"] {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border: 2px solid #ddd;
    border-radius: 4px;
    display: inline-block;
    width: 20px;
    height: 20px;
    margin: 1px;
}
.r {
	background-color: #ff8fab;
}
.s {
	background-color: #ffb3c6;
}
.a {
	background-color: #ffe5ec;
}
input[type="checkbox"]:checked {
    background-color: #471C87;
}
input[type="checkbox"]:disabled {
    background-color: #ddd;
}
</style>

</head>
<body>
<%
	// 이미 예매된 리스트 받아오기
	List<String> list = new ArrayList<String>();
	list = (List<String>) request.getAttribute("seats");
%>
<form id="seatForm" action="info.do" method="post">
	<div style="width: 70%; margin: 20px auto;">
		<h1 style="text-align: center;">[STAGE]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
		<div class="float-right" style="margin: 20px;">
<!-- 			<button type="button" class="btn btn-sm" style="background: #ff8fab; color: black;">R석</button> -->
			<button type="button" class="btn btn-sm" style="background: #ffb3c6; color: black;">S석</button>
			<button type="button" class="btn btn-sm" style="background: #ffe5ec; color: black;">A석</button>
			<button type="button" class="btn btn-sm" style="background: #471C87; color: white;">선택한 좌석</button>
			<button type="button" class="btn btn-sm" style="background: #ddd; color: black;">선택 불가 좌석</button>
			<br>
		</div>
		<br>
		<br>
		<br>
		<input type="hidden" name="dno" value="${dno}">
		<input type="hidden" id="cnt" name="cnt">
		<div style="padding: 10px;">
			<% for(char c = 'A'; c <= 'S'; c++) { %>
				<div class="row">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<!-- 열 반복문 -->
					<% for(int i = 1; i <= 10; i++) {
						
						// 이미 예매된 좌석일 경우
						if (list != null && list.contains((char) c + "" + i)) {
							
							// 행 반복문
							if(c <= 'L') { %>
								<input type="checkbox" name="seatNo" value="S-<%=c %><%=i %>" disabled="disabled">
							<% } else { %>
								<input type="checkbox" name="seatNo" value="A-<%=c %><%=i %>" disabled="disabled">
							<% } 
							
						// 이미 예매된 좌석이 아닐 경우
						} else {
							if(c <= 'L') { %>
								<input type="checkbox" class="s" name="seatNo" value="S-<%=c %><%=i %>">
							<% } else { %>
								<input type="checkbox" class="a" name="seatNo" value="A-<%=c %><%=i %>">
							<% } 
						}
					} %>
					
					<!-- 좌석배치도에 알파벳 표시 -->
					<div style="width: 20px; text-align: center;"><%=c %></div>
					
					<% for(int i = 11; i <= 28; i++) {
						if (list != null && list.contains((char) c + "" + i)) {
							if(c <= 'L') { %>
								<input type="checkbox" name="seatNo" value="S-<%=c %><%=i %>" disabled="disabled">
							<% } else { %>
								<input type="checkbox" name="seatNo" value="A-<%=c %><%=i %>" disabled="disabled">
							<% } 
						} else {
							if(c <= 'L') { %>
								<input type="checkbox" class="s" name="seatNo" value="S-<%=c %><%=i %>">
							<% } else { %>
								<input type="checkbox" class="a" name="seatNo" value="A-<%=c %><%=i %>">
							<% } 
						}
					} %>
					<div style="width: 20px; text-align: center;"><%=c %></div>
					<% for(int i = 29; i <= 38; i++) {
						if (list != null && list.contains((char) c + "" + i)) {
							if(c <= 'L') { %>
								<input type="checkbox" name="seatNo" value="S-<%=c %><%=i %>" disabled="disabled">
							<% } else { %>
								<input type="checkbox" name="seatNo" value="A-<%=c %><%=i %>" disabled="disabled">
							<% } 
						} else {
							if(c <= 'L') { %>
								<input type="checkbox" class="s" name="seatNo" value="S-<%=c %><%=i %>">
							<% } else { %>
								<input type="checkbox" class="a" name="seatNo" value="A-<%=c %><%=i %>">
							<% } 
						}
					} %>
					
					<!-- L행 뒤에는 공백을 두어 복도 표현 -->
					<%=c == 'L' ? "<br><br>" : "" %>
				</div>
			<% } %>
		</div>
		<button class="btn float-right" style="background: #471C87; color: white;">예매하기</button>
	</div>
</form>
</body>
</html>