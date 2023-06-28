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
	background-color: #ffc2d1;
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
	List<String> list = new ArrayList<>();
	list = (List<String>) request.getAttribute("seats");
%>
<form id="seatForm" action="info.do" method="post">
	<div style="width: 90%; margin: 20px auto;">
		<h1 style="text-align: center;">[STAGE]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
		<div class="float-right" style="margin: 20px;">
			<button type="button" class="btn btn-sm" style="background: #ff8fab; color: black;">R석</button>
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
				<div class="row" style="margin: 0 0 0 140px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<% for(int i = 1; i <= 10; i++) {
						if (list != null && list.contains((char) c + "" + i)) {
							if(c <= 'H') { %>
								<input type="checkbox" name="seatNo" value="R-<%=c %><%=i %>" disabled="disabled">
							<% } else { %>
								<input type="checkbox" name="seatNo" value="S-<%=c %><%=i %>" disabled="disabled">
							<% }
						} else {
							if(c <= 'H') { %>
								<input type="checkbox" class="r" name="seatNo" value="R-<%=c %><%=i %>">
							<% } else { %>
								<input type="checkbox" class="s" name="seatNo" value="S-<%=c %><%=i %>">
							<% } 
						}
					} %>
					<div style="width: 20px; text-align: center;"><%=c %></div>
					<% for(int i = 11; i <= 28; i++) {
						if (list != null && list.contains((char) c + "" + i)) {
							if(c <= 'H') { %>
								<input type="checkbox" name="seatNo" value="R-<%=c %><%=i %>" disabled="disabled">
							<% } else { %>
								<input type="checkbox" name="seatNo" value="S-<%=c %><%=i %>" disabled="disabled">
							<% } 
						} else {
							if(c <= 'H') { %>
								<input type="checkbox" class="r" name="seatNo" value="R-<%=c %><%=i %>">
							<% } else { %>
								<input type="checkbox" class="s" name="seatNo" value="S-<%=c %><%=i %>">
							<% } 
						}
					} %>
					<div style="width: 20px; text-align: center;"><%=c %></div>
					<% for(int i = 29; i <= 38; i++) {
						if (list != null && list.contains((char) c + "" + i)) {
							if(c <= 'H') { %>
								<input type="checkbox" name="seatNo" value="R-<%=c %><%=i %>" disabled="disabled">
							<% } else { %>
								<input type="checkbox" name="seatNo" value="S-<%=c %><%=i %>" disabled="disabled">
							<% } 
						} else {
							if(c <= 'H') { %>
								<input type="checkbox" class="r" name="seatNo" value="R-<%=c %><%=i %>">
							<% } else { %>
								<input type="checkbox" class="s" name="seatNo" value="S-<%=c %><%=i %>">
							<% } 
						}
					} %>
					<%=c == 'S' ? "<br><br>" : "" %>
				</div>
			<% } %>
			<% for(char c = 'T'; c <= 'Z'; c++) { %>
				<div class="row">
					<% for(int i = 1; i <= 18; i++) {
						if (list != null && list.contains((char) c + "" + i)) { %>
							<input type="checkbox" name="seatNo" value="A-<%=c %><%=i %>" disabled="disabled">
						<% } else { %>
							<input type="checkbox" class="a" name="seatNo" value="A-<%=c %><%=i %>">
						<% } 
					} %>
					<div style="width: 20px; text-align: center;"><%=c %></div>
					<% for(int i = 19; i <= 36; i++) {
						if (list != null && list.contains((char) c + "" + i)) { %>
							<input type="checkbox" name="seatNo" value="A-<%=c %><%=i %>" disabled="disabled">
						<% } else { %>
							<input type="checkbox" class="a" name="seatNo" value="A-<%=c %><%=i %>">
						<% }
					} %>
					<div style="width: 20px; text-align: center;"><%=c %></div>
					<% for(int i = 37; i <= 54; i++) {
						if (list != null && list.contains((char) c + "" + i)) { %>
							<input type="checkbox" name="seatNo" value="A-<%=c %><%=i %>" disabled="disabled">
						<% } else { %>
							<input type="checkbox" class="a" name="seatNo" value="A-<%=c %><%=i %>">
						<% }
					} %>
				</div>
			<% } %>
		</div>
		<button class="btn float-right" style="background: #471C87; color: white;">예매하기</button>
	</div>
</form>
</body>
</html>