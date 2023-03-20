<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<script>
	function fn_review(isLogOn, event, loginForm) {
		if (isLogOn != '' && isLogOn != 'false') {
			location.href = event;
		} else {
			alert("관리자 로그인 후 글쓰기가 가능합니다.")
			location.href = loginForm + '?action=/member/loginForm.do';
		}
	}
</script>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<section class="notice">
				<div class="movieChartBeScreen_btn_wrap" style = "margin-top : 20px">
					<div class="tabBtn_wrap">
						<h3>
							<a href="#none">이벤트</a>
						</h3>
					</div>
				</div>
				<!-- board list area -->
				<div id="board-list">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col" class="th-num">번호</th>
									<th scope="col" class="th-title">제목</th>
									<th scope="col" class="th-date">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${eventList == '[]' }">
										<tr height="10">
											<td colspan="3">
												<p align="center">
													<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
												</p>
											</td>
										</tr>
									</c:when>
									<c:when test="${eventList != null }">
										<c:forEach var="eventList" items="${eventList }"
											varStatus="eventListNum">
											<tr>
												<td>${eventListNum.count }</td>
												<th><a
													href="${contextPath}/board/eventView.do?eventBoardNO=${eventList.boardNO}">${eventList.boardTitle }</a>
												</th>
												<td>${eventList.boardWriteDate }</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
						<c:if test="${isLogOn==true and member.member_id =='admin' }">
							<div style="text-align: right; margin-top: 20px;">
								<input type="button" value="글쓰기" class="favorite styled"
									onClick="fn_review('${isLogOn}','${contextPath}/board/eventForm.do','${contextPath}/member/loginForm.do') " />
							</div>
						</c:if>
				</div>

			</section>
		</div>
	</div>
</body>
</html>