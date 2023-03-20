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
			<form name="noticeForm" method="post"
				action="${contextPath }/board/addNotice.do" enctype="text">
				<table>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="member_id" size="20"
							maxlength="40" value="${member.member_id }" readOnly /></td>
					</tr>
					<tr>
						<th>글 제목</th>
						<td><input type="text" name="boardTitle" size="100"
							maxlength="200" /></td>
					</tr>
					<tr>
						<th>글 내용</th>
						<td><textarea name="boardContent" rows="10" cols="65"
								maxlength="4000"></textarea></td>
				</table>
				<div style="text-align: center">
					<input type="submit" class="favorite styled" value="글쓰기" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>