<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<link href="${contextPath}/resources/css/table.css" rel="stylesheet" />
</head>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<div class="movieChartBeScreen_btn_wrap" style = "margin-top : 20px">
				<div class="tabBtn_wrap">
					<h3>
						<a href="#none">영화 등록</a>
					</h3>
				</div>
			</div>
			<form name="insertMovie" method="post"
				action="${contextPath }/admin/addMovie.do"
				enctype="multipart/form-data">
				<table>
					<tr>
						<th>영화 제목</th>
						<td><input type="text" name="movie_title"
							style="width: 490px;" /></td>
					</tr>
					<tr>
						<th>영화 장르</th>
						<td><input type="text" name="movie_genre"
							style="width: 490px;" /></td>
					</tr>
					<tr>
						<th>상영 시간</th>
						<td><input type="text" name="movie_time" size="10" /></td>
					</tr>
					<tr>
						<th>영화 감독</th>
						<td><input type="text" name="movie_director" size="15" /></td>
					</tr>
					<tr>
						<th>주연 배우</th>
						<td><input type="text" name="movie_actor" size="15" /></td>
					</tr>
					<tr>
						<th>줄거리</th>
						<td><textarea name="movie_story" rows="10" cols="65"
								maxlength="4000"></textarea></td>
					</tr>
					<tr>
						<th>개봉일</th>
						<td><input type="text" name="movie_openday1" size="4"
							maxlength="4" placeholder="연도" /> / <input type="text"
							name="movie_openday2" size="2" maxlength="2" placeholder="월" />
							/ <input type="text" name="movie_openday3" size="2" maxlength="2"
							placeholder="일" /></td>
					<tr>
						<th>관람등급</th>
						<td><select name="movie_rank">
								<option value="전체 관람가">전체 관람가</option>
								<option value="12세 이상 관람가">12세 이상 관람가</option>
								<option value="15세 이상 관람가">15세 이상 관람가</option>
								<option value="18세 이상 관람가">18세 이상 관람가</option>
						</select><br></td>
					</tr>
					<tr>
						<th>제작사</th>
						<td><input type="text" name="movie_producer"
							style="width: 490px;" /></td>
					</tr>
					<tr>
						<th>상영상태</th>
						<td><select name="movie_status">
								<option value="e">상영예정</option>
								<option value="y">상영중</option>
								<option value="n">상영종료</option>
						</select><br></td>
					</tr>
					<tr>
						<th>포스터 첨부</th>
						<td><input type="file" name="detail_image"
							onchange="readURL(this);" /> <img id="preview" src="#"
							text-align=left width=250 height=400 /></td>
					</tr>
				</table>
				<div style="text-align: center; margin-top: 20px;">
					<input type="submit" class="favorite styled" value="등록" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>