<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>

<!-- css -->
<style>
table.type02 {
	border-collapse: separate;
	border-spacing: 0;
	text-align: left;
	font-family: 'GongGothicMedium';
	justify-content:center;
	display : flex;
}

table.type02 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
}

table.type02 td {
	padding: 10px;
	vertical-align: middle;
}

img {
	display: block;
	margin: auto;
}

.rank {
	margin-left: 0px;
	margin-bottom: 0px;
}

a {
	color: gray;
	font-size : 22px;
}

.button {
	border: 1px solid #000000; /*---테두리 정의---*/
	background-Color: #ffffff; /*--백그라운드 정의---*/
	font-family: 'GongGothicMedium';
	font-size: 30px; /*--폰트 정의---*/
	color: #000000; /*--폰트 색깔---*/
	width: 100%;
	height: 100px; /*--버튼 크기---*/
	margin-bottom: 20px;
	border-radius : 10px;
}

.button:hover {
	background: gray;
	color: white;
}
</style>

<script>
function fn_form(url, movieNum, movieTitle){
	 var form = document.createElement("form");
	 form.setAttribute("method", "post");
	 form.setAttribute("action", url);
    var movieNumInput = document.createElement("input");
    movieNumInput.setAttribute("type","hidden");
    movieNumInput.setAttribute("name","movieNum");
    movieNumInput.setAttribute("value", movieNum);
    
    var movieTitleInput = document.createElement("input");
    movieTitleInput.setAttribute("type","hidden");
    movieTitleInput.setAttribute("name","movieTitle");
    movieTitleInput.setAttribute("value", movieTitle);
	 
    form.appendChild(movieNumInput);
    form.appendChild(movieTitleInput);
    document.body.appendChild(form);
	 form.submit();
}

</script>

<meta charset="UTF-8">
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">

			<table class="type02">
				<c:forEach var="titleList" items="${titleList }"
					varStatus="titleListNum">
					<!-- Controller 에서 보내준 List forEach로 뽑음 -->
					<tr>
						<th scope="row"><img alt="HTML5 &amp; CSS3"
							src="${contextPath}/thumbnails.do?movie_id=${titleList.movie_id}&fileName=${titleList.movie_filename}"
							style = "border-radius : 15px; width: 300px;"></th>
						<td><a> <input type="button" class="button"
								value="${titleList.movie_title}"
								onClick="fn_form('${contextPath}/order/timeselect.do', ${titleList.movie_id},'${titleList.movie_title}')" />
								<!-- List에서 movie_title forEach 돌면서 나옴 -->
						</a><br> <a>${titleList.movie_genre} </a>/<a>
								${titleList.movie_time }</a><br> <a>개봉일 :
								${titleList.movie_openday }</a> <!-- 장르, 상영 시간 --> <c:if
								test="${titleList.movie_rank == '12세 이상 관람가' }">
								<!-- 영화 등급 표시 -->
								<img class="rank" src="${contextPath}/resources/image/12.png"
									width="25px" />
							</c:if> <c:if test="${titleList.movie_rank == '15세 이상 관람가' }">
								<!-- 영화 등급 표시 -->
								<img class="rank" src="${contextPath}/resources/image/15.png"
									width="25px" />
							</c:if> <c:if test="${titleList.movie_rank == '18세 이상 관람가' }">
								<!-- 영화 등급 표시 -->
								<img class="rank" src="${contextPath}/resources/image/18.png"
									width="25px" />
							</c:if>
							<c:if test="${titleList.movie_rank == '전체 관람가' }">
								<!-- 영화 등급 표시 -->
								<img class="rank" src="${contextPath}/resources/image/1. ALL.png"
									width="25px" />
							</c:if></td>
					</tr>
				</c:forEach>
				<c:forEach var="titleList" items="${titleList1 }"
					varStatus="titleListNum">
					<!-- Controller 에서 보내준 List forEach로 뽑음 -->
					<tr>
						<th scope="row"><img alt="HTML5 &amp; CSS3"
							src="${contextPath}/thumbnails.do?movie_id=${titleList.movie_id}&fileName=${titleList.movie_filename}"
							style = "border-radius : 15px; width: 300px;"></th>
						<td><a> <input type="button" class="button"
								value="${titleList.movie_title}"
								onClick="fn_form('${contextPath}/order/timeselect.do', ${titleList.movie_id},'${titleList.movie_title}')" />
								<!-- List에서 movie_title forEach 돌면서 나옴 -->
						</a><br> <a>${titleList.movie_genre} </a>/<a>
								${titleList.movie_time }</a><br> <!-- 장르, 상영 시간 --> <a>개봉일
								: ${titleList.movie_openday }</a> <c:if
								test="${titleList.movie_rank == '12세 이상 관람가' }">
								<!-- 영화 등급 표시 -->
								<img class="rank" src="${contextPath}/resources/image/12.png"
									width="25px" />
							</c:if> <c:if test="${titleList.movie_rank == '15세 이상 관람가' }">
								<!-- 영화 등급 표시 -->
								<img class="rank" src="${contextPath}/resources/image/15.png"
									width="25px" />
							</c:if> <c:if test="${titleList.movie_rank == '18세 이상 관람가' }">
								<!-- 영화 등급 표시 -->
								<img class="rank" src="${contextPath}/resources/image/18.png"
									width="25px" />
							</c:if>
							<c:if test="${titleList.movie_rank == '전체 관람가' }">
								<!-- 영화 등급 표시 -->
								<img class="rank" src="${contextPath}/resources/image/1. ALL.png"
									width="25px" />
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>