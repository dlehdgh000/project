<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<head>
<link href="${contextPath}/resources/css/table.css" rel="stylesheet" />
<script>
	function fn_review_movie(movie_id, oneLineId, oneLineContent) {
		var review = document.review;
		var id = "";
		var content = ""
		if (oneLineId == 'id') {
			id = review.id.value;
			content = review.content.value;
		}

		$.ajax({
			type : "post",
			async : true,
			url : "${contextPath}/movie/oneLineReview.do",
			data : {
				movie_id : movie_id,
				id : id,
				content : content
			},
			success : function(data, textStatus) {
				if (data.trim() == 'success') {
					alert("한줄평을 작성하셨습니다.")
					location.reload();
				} else if (data.trim() == 'failed') {
					alert("다시 작성해 주세요.");
				}
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다." + data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");

			}

		});
	}
</script>
<style>

</style>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<!-- foreach 구문 사용 -->
			<div class = "movieDetail page-content-group">
				<div class = "container">
				<c:forEach var="movieList" items="${movieList}"
				varStatus="movieListNum">
				
				<div class="col-poster-image">
						<div class="poster-image light" style="background-image: url('${contextPath}/thumbnails.do?movie_id=${movieList.movie_id}&fileName=${movieList.filename}')"></div>
				</div>
	<div class="col-content">
		<div class="movie-title-frame">
			<div class="text1">
				${movieList.movie_title }</div>
			<div class="level">
			<c:if test = "${movieList.movie_rank == '전체 관람가'}">
			<div class="movie-rate-badge movie-rate-badge-all"></div>
			</c:if>
			<c:if test = "${movieList.movie_rank == '12세 이상 관람가'}">
			<div class="movie-rate-badge movie-rate-badge-12"></div>
			</c:if>
			<c:if test = "${movieList.movie_rank == '15세 이상 관람가'}">
			<div class="movie-rate-badge movie-rate-badge-15"></div>
			</c:if>
			<c:if test = "${movieList.movie_rank == '18세 이상 관람가'}">
			<div class="movie-rate-badge movie-rate-badge-18"></div>
			</c:if>
			${movieList.movie_rank }</div>
		</div>
		<table class="pb-form-table">
			<tbody>
				<tr>
					<th>개봉일</th>
					<td>${movieList.movie_openday }</td>
				</tr>
				<tr>
					<th>감독</th>
					<td>${movieList.movie_director }</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>${movieList.starpoint / 2 }</td>
				</tr>
				<tr>
					<th>주연</th>
					<td>${movieList.movie_actor }</td>
				</tr>
				<tr>
					<th>장르</th>
					<td>${movieList.movie_genre}</td>
				</tr>
				<tr>
					<th>러닝타임</th>
					<td>${movieList.movie_time}</td>
				</tr>
				<tr>
					<th>줄거리</th>
				<td>${movieList.movie_story}</td>
				</tr>
			</tbody>
		</table>
			</div>
	</div>
				<h1 style = "font-family: 'GongGothicMedium'; font-weight : 100">한줄평</h1>
				<table>
					<c:choose>
						<c:when test="${oneLineReviewList == '[]'}">
							<a style = "font-family: 'GongGothicMedium'; font-weight : 100" >가장 먼저 <strong>${movieList.movie_title }</strong> 에 대한 한줄평을 남겨보세요!</a>
							<br>
						</c:when>


						<c:when test="${oneLineReviewList != null }">
							<c:forEach var="oneLineReviewList" items="${oneLineReviewList }">
								<tr>
									<th><img src="${contextPath }/resources/image/profile.jpg"
										width=50px height=50px /></th>
									<td><a style="color: blue;"><strong>${oneLineReviewList.id }</strong></a><br>${oneLineReviewList.content }</td>
								</tr>
							</c:forEach>
						</c:when>

					</c:choose>
					<form name="review" method="post">
						<tr>
							<th>닉네임</th>
							<td><input type="text" name="id" maxlength="20" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><input type="text" name="content" maxlength="50" /><input
								type="button" value="작성"
								onClick="fn_review_movie('${movieList.movie_id}','id','content')" /></td>
						</tr>
					</form>
					</c:forEach>
				</table>
				</div>		
			</div>
			</div>
</body>
