<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<link href="${contextPath}/resources/css/table.css" rel="stylesheet" />
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<h1>공지사항</h1>
			<table>
				<tr>
					<th>글 번호</th>
					<td>${board.boardNO}</td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td>${board.boardTitle}</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td>${board.boardContent}</td>
				</tr>
				<tr>
					<th>작성 날짜</th>
					<td>${board.boardWriteDate}</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>