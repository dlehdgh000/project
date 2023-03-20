<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="reviewList" value="${boardMap.reviewList }"/>
<c:set var="totalBoard" value="${boardMap.totalBoard }"/>
<c:set var="section" value="${boardMap.section }"/>
<c:set var="pageNum" value="${boardMap.pageNum }"/>

<html>
<head>
<script>
	function fn_review(isLogOn, review, loginForm) {
		if (isLogOn != '' && isLogOn != 'false') {
			location.href = review;
		} else {
			alert("로그인 후 글쓰기가 가능합니다.")
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
							<a href="#none">영화 리뷰</a>
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
									<th scope="col" class="th-date1">조회수</th>
									<th scope="col" class="th-date1">추천수</th>
									<th scope="col" class="th-date1">평점</th>
									<th scope="col" class="th-date">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${reviewList == '[]' }">
										<tr height="10">
											<td colspan="6">
												<p align="center">
													<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
												</p>
											</td>
										</tr>
									</c:when>
									<c:when test="${reviewList != null }">
										<c:forEach var="reviewList" items="${reviewList }"
											varStatus="reviewListNum">
											<tr>
												<td>${reviewListNum.count }</td>
												<th><a
													href="${contextPath}/board/reviewView.do?reviewBoardNO=${reviewList.boardNO}">${reviewList.boardTitle }</a>
												</th>
												<td>${reviewList.boardView }</td>
												<td>${reviewList.boardPush }</td>
												<td>${reviewList.starpoint / 2 }</td>
												<td>${reviewList.boardWriteDate }</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
						
<div class="cls2">
 <c:if test="${totalBoard != null }" >
      <c:choose>
        <c:when test="${totalBoard >100 }">  <!-- 글 개수가 100 초과인경우 -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	         <c:if test="${section >1 && page==1 }">
	          <a  href="${contextPath }/board/review.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; pre </a>
	         </c:if>
	          <a  href="${contextPath }/board/review.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
	         <c:if test="${page ==10 }">
	          <a  href="${contextPath }/board/review.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
	         </c:if>
	      </c:forEach>
        </c:when>
        <c:when test="${totalBoard ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	        <a   href="#">${page } </a>
	      </c:forEach>
        </c:when>
        
        <c:when test="${totalBoard< 100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
	      <c:forEach   var="page" begin="1" end="${totalBoard/10 +1}" step="1" >
	         <c:choose>
	           <c:when test="${page==pageNum }">
	            <a   href="${contextPath }/board/review.do?section=${section}&pageNum=${page}">${page } </a>
	          </c:when>
	          <c:otherwise>
	            <a 	  href="${contextPath }/board/review.do?section=${section}&pageNum=${page}">${page } </a>
	          </c:otherwise>
	        </c:choose>
	      </c:forEach>
        </c:when>
      </c:choose>
    </c:if>
</div>   
						
						<div style="text-align: right; margin-top: 20px;">
							<input type="button" value="글쓰기" class="favorite styled"
								onClick="fn_review('${isLogOn}','${contextPath}/board/reviewForm.do','${contextPath}/member/loginForm.do') " />
						</div>
				</div>

			</section>
		</div>
	</div>
</body>
</html>