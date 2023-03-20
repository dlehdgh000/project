<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="movieModifyList" value="${movieMap.movieModifyList }" />
<c:set var="imageFileList" value="${movieMap.imageFileList }" />

<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath}/resources/css/table.css" rel="stylesheet" />
<script>
	function fn_modify_movie(movie_id, attribute) {
		var frm_mod_movie = document.frm_mod_movie;
		var value = "";
		if (attribute == 'movie_title') {
			value = frm_mod_movie.movie_title.value;
		} else if (attribute == 'movie_genre') {
			value = frm_mod_movie.movie_genre.value;
		} else if (attribute == 'movie_time') {
			value = frm_mod_movie.movie_time.value;
		} else if (attribute == 'movie_director') {
			value = frm_mod_movie.movie_director.value;
		} else if (attribute == 'movie_story') {
			value = frm_mod_movie.movie_story.value;
		} else if (attribute == 'movie_producer') {
			value = frm_mod_movie.movie_producer.value;
		} else if (attribute == 'movie_actor') {
			value = frm_mod_movie.movie_actor.value;
		}

		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/admin/modifyMovieInfo.do",
			data : {
				movie_id : movie_id,
				attribute : attribute,
				value : value
			},
			success : function(data, textStatus) {
				if (data.trim() == 'mod_success') {
					alert("영화 정보를 수정했습니다.");
				} else if (data.trim() == 'failed') {
					alert("다시 시도해 주세요.");
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

	function readURL(input, preview) {
		//  alert(preview);
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#' + preview).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function modifyImageFile(fileId, movie_id, image_id, fileType) {
		// alert(fileId);
		var form = $('#FILE_FORM')[0];
		var formData = new FormData(form);
		formData.append("fileName", $('#' + fileId)[0].files[0]);
		formData.append("movie_id", movie_id);
		formData.append("image_id", image_id);
		formData.append("fileType", fileType);

		$.ajax({
			url : '${contextPath}/admin/modifyMovieImageInfo.do',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success : function(result) {
				alert("이미지를 수정했습니다!");
			}
		});
	}
</script>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<div class="movieChartBeScreen_btn_wrap">
				<div class="tabBtn_wrap">
					<h3>
						<a href="#none" class="active">영화 수정</a>
					</h3>
				</div>
			</div>

			<form name="frm_mod_movie" method=post
				action="${contextPath}/admin/allModifyMovie.do">
				<c:forEach var="item" items="${movieModifyList }" varStatus="status">
					<input type="hidden" value="${item.movie_id }" name="movie_id" />
					<br>
					<table>
						<tr>
							<th>영화 제목</th>
							<td><input type="text" value="${item.movie_title }"
								name="movie_title" /> <input type="button"
								class="favorite styled" value="수정반영"
								onClick="fn_modify_movie('${item.movie_id }','movie_title')" /></td>
						</tr>
						<tr>
							<th>영화 장르</th>
							<td><input type="text" value="${item.movie_genre }"
								name="movie_genre" /> <input type="button"
								class="favorite styled" value="수정반영"
								onClick="fn_modify_movie('${item.movie_id }','movie_genre')" /></td>
						</tr>
						<tr>
							<th>상영 시간</th>
							<td><input type="text" value="${item.movie_time }"
								name="movie_time" /> <input type="button"
								class="favorite styled" value="수정반영"
								onClick="fn_modify_movie('${item.movie_id }','movie_time')" /></td>
						</tr>
						<tr>
							<th>영화 감독</th>
							<td><input type="text" value="${item.movie_director }"
								name="movie_director" /> <input type="button"
								class="favorite styled" value="수정반영"
								onClick="fn_modify_movie('${item.movie_id }','movie_director')" />
							</td>
						</tr>
						<tr>
							<th>주연 배우</th>
							<td><input type="text" value="${item.movie_actor }"
								name="movie_actor" /> <input type="button"
								class="favorite styled" value="수정반영"
								onClick="fn_modify_movie('${item.movie_id }','movie_actor')" /></td>
						</tr>
						<tr>
							<th>줄거리</th>
							<td><textarea name="movie_story" rows="20" cols="60">${item.movie_story }</textarea>
								<input type="button" class="favorite styled" value="수정반영"
								onClick="fn_modify_movie('${item.movie_id }','movie_story')" /></td>
						</tr>
						<tr>
							<th>개봉일</th>
							<td><input type="text" name="movie_openday1" size="4"
								maxlength="4" placeholder="연도" />/ <input type="text"
								name="movie_openday2" size="2" maxlength="2" placeholder="월" />/
								<input type="text" name="movie_openday3" size="2" maxlength="2"
								placeholder="일" /></td>
						</tr>
						<tr>
							<th>관람등급</th>
							<td><select name="movie_rank">
									<option value="${item.movie_rank }">${item.movie_rank }</option>
									<option value="전체 관람가">전체 관람가</option>
									<option value="12세 이상 관람가">12세 이상 관람가</option>
									<option value="15세 이상 관람가">15세 이상 관람가</option>
									<option value="18세 이상 관람가">18세 이상 관람가</option>
							</select></td>
						</tr>
						<tr>
							<th>제작사</th>
							<td><input type="text" value="${item.movie_producer }"
								name="movie_producer" /> <input type="button"
								class="favorite styled" value="수정반영"
								onClick="fn_modify_movie('${item.movie_id }','movie_producer')" /></td>
						</tr>
						<tr>
							<th>상영상태</th>
							<td><select name="movie_status">
									<option value="${item.movie_status }">
										<c:if test="${item.movie_status == 'y'}"> 상영중</c:if>
										<c:if test="${item.movie_status == 'n'}"> 상영종료</c:if>
										<c:if test="${item.movie_status == 'e'}"> 상영예정</c:if></option>
									<option value="e">상영예정</option>
									<option value="y">상영중</option>
									<option value="n">상영종료</option>
							</select></td>
						</tr>

						</form>
						<tr>
							<th>버튼</th>
							<td><input type="button" class="favorite styled"
								value="영화 삭제하기"
								onClick="location.href='${contextPath}/admin/deleteMovie.do?movie_id=${item.movie_id }'" />
								<input type="submit" class="favorite styled" value="전체 수정하기" />
							</td>
							</c:forEach>
						</tr>
						<tr>
							<th>포스터</th>
							<td>
								<form id="FILE_FORM" method="post" enctype="multipart/form-data">
									<c:forEach var="imageFileList" items="${imageFileList }"
										varStatus="itemNum">
										<input type="file" id="detail_image" name="detail_image"
											onchange="readURL(this,'preview${itemNum.count }');" />
										<img id="preview${itemNum.count }" alt="HTML5 &amp; CSS3"
											src="${contextPath}/thumbnails.do?movie_id=${imageFileList.movie_id}&fileName=${imageFileList.fileName}"
											width=250 height=400 />
										<input type="button" value="수정" class="favorite styled"
											onClick="modifyImageFile('detail_image','${imageFileList.movie_id}','${imageFileList.image_id}','${imageFileList.fileType}')" />
									</c:forEach>
							</td>
						</tr>
						</form>
					</table>
		</div>
	</div>
</body>
</html>
