<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<script>
$(document).ready(function() {
	$('.1st').show(); //페이지를 로드할 때 표시할 요소
	$('.2st').hide(); //페이지를 로드할 때 숨길 요소
	$('.3st').hide(); //페이지를 로드할 때 숨길 요소
	$('.active1').click(function(){
	$ ('.1st').hide(); //클릭 시 첫 번째 요소 숨김
	$ ('.3st').hide(); //클릭 시 첫 번째 요소 숨김
	$ ('.2st').show(); //클릭 시 두 번째 요소 표시
	return false;
	
	});
	$('.active2').click(function(){
		$ ('.1st').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.2st').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.3st').show(); //클릭 시 두 번째 요소 표시
		return false;
		
		});
	$('.active').click(function(){
		$ ('.2st').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.3st').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.1st').show(); //클릭 시 두 번째 요소 표시
		return false;
		
		});
	});
</script>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
		<div class="movieChartBeScreen_btn_wrap">
					<div class="tabBtn_wrap">
						<h3>
							<a href="#none" class="active" id="btnMovie">현재상영중</a>
						</h3>
						<h3>
							<a href="#none" id="btnReserMovie" class="active1">상영예정작</a>
						</h3>
						<h3>
							<a href="#none" id="btnReserMovie" class="active2">상영종료작</a>
						</h3>
					</div>
				</div>
		<div class = "1st">
			<div class="movieChartBeScreen_btn_wrap">
				<div class="tabBtn_wrap">
					<h3>
						<a href="#none" class="active">현재상영중</a>
					</h3>
				</div>
			</div>
			<div class = "effect-wrap">
			<c:forEach var="item" items="${movieManageList}" varStatus="status">
				<c:if test="${item.movie_status == 'y' }">
				<figure class = "effect5">
						<img alt="HTML5 &amp; CSS3"
						src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&fileName=${item.filename}"
						style = "width: 220px; height:310px; border-radius : 10px;" />
					<figcaption>
									<div style="text-align: center">
										<a
											href="${contextPath}/movie/movieDetail.do?movie_id=${item.movie_id}"
											class="myButton">상세보기</a> <a
											href="${contextPath }/admin/movieModify.do?movie_id=${item.movie_id}"
											class="myButton1">수정하기</a>
									</div>
								</figcaption>
				</figure>
				</c:if>
			</c:forEach>
			</div>
		</div>
		<div class = "2st">
			<div class="movieChartBeScreen_btn_wrap">
				<div class="tabBtn_wrap">
					<h3>
						<a href="#none" class="active">상영예정작</a>
					</h3>
				</div>
			</div>
			<div class = "effect-wrap">
			<c:forEach var="item" items="${movieManageList}" varStatus="status">
				<c:if test="${item.movie_status == 'e' }">
				<figure class = "effect5">
						<img alt="HTML5 &amp; CSS3"
						src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&fileName=${item.filename}"
						style = "width: 220px; height:310px; border-radius : 10px;" />
					<figcaption>
									<div style="text-align: center">
										<a
											href="${contextPath}/movie/movieDetail.do?movie_id=${item.movie_id}"
											class="myButton">상세보기</a> <a
											href="${contextPath }/admin/movieModify.do?movie_id=${item.movie_id}"
											class="myButton1">수정하기</a>
									</div>
								</figcaption>
				</figure>
				</c:if>
			</c:forEach>
			</div>
			</div>
			<div class = "3st">
			<div class="movieChartBeScreen_btn_wrap">
				<div class="tabBtn_wrap">
					<h3>
						<a href="#none" class="active">상영종료작</a>
					</h3>
				</div>
			</div>
			<div class = "effect-wrap">
			<c:forEach var="item" items="${movieManageList}" varStatus="status">
				<c:if test="${item.movie_status == 'n' }">
				<figure class = "effect5">
						<img alt="HTML5 &amp; CSS3"
						src="${contextPath}/thumbnails.do?movie_id=${item.movie_id}&fileName=${item.filename}"
						style = "width: 220px; height:310px; border-radius : 10px;" />
					<figcaption>
									<div style="text-align: center">
										<a
											href="${contextPath}/movie/movieDetail.do?movie_id=${item.movie_id}"
											class="myButton">상세보기</a> <a
											href="${contextPath }/admin/movieModify.do?movie_id=${item.movie_id}"
											class="myButton1">수정하기</a>
									</div>
								</figcaption>
				</figure>
				</c:if>
			</c:forEach>
			</div>
			</div>
		</div>
	</div>
</body>
</html>