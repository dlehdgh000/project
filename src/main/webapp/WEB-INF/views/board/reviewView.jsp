<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="board" value="${boardMap.board }" />
<c:set var="imageFileList" value="${boardMap.imageFileList }" />

<html>
<head>
<link href="${contextPath}/resources/css/table.css" rel="stylesheet" />
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<h1>리뷰 게시판</h1>
			<table border="0" align="center">
				<tr>
					<th>글 번호</th>
					<td><input type="text" value="${board.boardNO}" readOnly /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" value="${board.member_id}" readOnly /></td>
				</tr>
				<tr>
					<th>추천수</th>
					<td><input type="text" name="boardTitle"
						value="${board.boardPush}" readOnly /></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><input type="text" name="boardTitle"
						value="${board.boardView}" readOnly /></td>
				</tr>
				<tr>
					<th>평 점</th>
					<td><input type="text" name="boardTitle"
						value="${board.starpoint / 2}" readOnly /></td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td><input type="text" name="boardTitle"
						value="${board.boardTitle}" style="width: 490px;" readOnly /></td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><textarea rows="10" cols="67" maxlength="8000"
							name="boardTitle" readOnly>${board.boardContent}</textarea></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><input type="text" name="boardTitle"
						value="${board.boardWriteDate}" readOnly /></td>
				</tr>

				<c:if test="${not empty imageFileList && imageFileList!='null' }">
					<c:forEach var="item" items="${imageFileList }" varStatus="status">
						<tr>
							<th>이미지</th>
							<td><img
								src="${contextPath}/download.do?boardNO=${board.boardNO}&fileName=${item.fileName}"
								id="preview" /><br></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div style="text-align: center; margin: 10px 30px 30px 30px">
				<input type="button" class="favorite styled" value="추천하기"
					onClick="location.href='${contextPath }/board/push.do?reviewBoardNO=${board.boardNO }'" />
				<c:if test="${board.member_id == member.member_id }">
					<input type="button" class="favorite styled" value="수정하기" />
					<input type="button" class="favorite styled" value="삭제하기"
						onClick="location.href='${contextPath}/board/delete.do?boardNO=${board.boardNO }'" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>