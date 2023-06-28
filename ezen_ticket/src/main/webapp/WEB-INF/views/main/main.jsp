<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

<script type="text/javascript">
$(function() {

// 	if("${login.gradeNo}" == 1) {
		$("#img1").click(function() {
			location = "/concert/view.do?no=1&page=1&perPageNum=8";
		});
		
		$("#img2").click(function() {
			location = "/concert/view.do?no=2&page=1&perPageNum=8";
		});
// 	}
	
});
</script>

<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
.carousel-inner img:hover {
	cursor: pointer;
}
</style>

</head>
<body>
<div class="container">

	<div class="row">
		<div class="col-md-5" style="font-size: 20pt;">
			<br><br><br><br>
			지금 바로 예매해보세요 👉👉
		</div>
	
		<div id="demo" class="carousel slide col-md-5" data-ride="carousel" style="width: 40%;">
			<br>
			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
	<!-- 			<li data-target="#demo" data-slide-to="2"></li> -->
			</ul>
		
			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img id="img1" src="/upload/concert/mrtrot.jpg">
				</div>
				<div class="carousel-item">
					<img id="img2" src="/upload/concert/day6.jpg">
				</div>
	<!-- 			<div class="carousel-item"> -->
	<!-- 				<img src="/upload/concert/default.jpg"> -->
	<!-- 			</div> -->
			</div>
		
			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
				class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
</div>
</body>
</html>