<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<style>
.accent {
	color: black;
}
</style>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<div>
				<h1 style="color: red">
					'${movie_keyword }'<span class="accent"> 검색결과</span>
				</h1>

				<dl>
					<div>
						<h1 style="color: black">영화 ${ListSize }개가 검색되었습니다.</h1>
					</div>
					<!-- forEach구문  -->
					<c:forEach var="searchList" items="${searchList}"
						varStatus="movie_id">
						<a
							href="${contextPath}/movie/movieDetail.do?movie_id=${searchList.movie_id}">
							<img alt="HTML5 &amp; CSS3"
							src="${contextPath}/thumbnails.do?movie_id=${searchList.movie_id}&fileName=${searchList.filename}"
							style="width: 140px; height: 200px; margin-right: 15px; float: left" />
						</a>
						<h3>
							<strong>${searchList.movie_title}</strong>
						</h3>
						<p>
							<strong>개봉</strong>: ${searchList.movie_openday}
						</p>
						<p>
							<strong>장르</strong>: ${searchList.movie_genre}
						</p>
						<p>
							<strong>개요</strong>: ${searchList.movie_rank},
							${searchList.movie_time}
						</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
					</c:forEach>

				</dl>
			</div>
		</div>
	</div>
</body>
