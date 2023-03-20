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
			<h2>이벤트 게시판</h2>
			<table>
				<tr>
					<th>글 번호</th>
					<td>${board.boardNO }</td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td>${board.boardTitle }</td>
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
				<tr>
					<th>작성 날짜</th>
					<td>${board.boardWriteDate }</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>