<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<script>
	function fn_delete_board(boardNO) {
		$.ajax({
			type : "get",
			async : true,
			url : "${contextPath}/admin/deleteBoard.do",
			data : {
				boardNO : boardNO
			},
			success : function(data, textStatus) {
				if (data.trim() == 'delete_success') {
					alert("게시글 삭제를 완료했습니다.");
					location.reload();
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
	function fn_delete_board1(boardNO) {
		$.ajax({
			type : "get",
			async : true,
			url : "${contextPath}/admin/deleteBoard1.do",
			data : {
				boardNO : boardNO
			},
			success : function(data, textStatus) {
				if (data.trim() == 'delete_success') {
					alert("게시글 삭제를 완료했습니다.");
					location.reload();
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
	function fn_delete_board2(boardNO) {
		$.ajax({
			type : "get",
			async : true,
			url : "${contextPath}/admin/deleteBoard2.do",
			data : {
				boardNO : boardNO
			},
			success : function(data, textStatus) {
				if (data.trim() == 'delete_success') {
					alert("게시글 삭제를 완료했습니다.");
					location.reload();
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
	
	$(document).ready(function() {
		$('.notice').show(); //페이지를 로드할 때 표시할 요소
		$('.event').hide(); //페이지를 로드할 때 숨길 요소
		$('.review').hide(); //페이지를 로드할 때 숨길 요소
		$('.active1').click(function(){
		$ ('.notice').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.reivew').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.event').show(); //클릭 시 두 번째 요소 표시
		return false;
		
		});
		$('.active2').click(function(){
			$ ('.notice').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.event').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.review').show(); //클릭 시 두 번째 요소 표시
			return false;
			
			});
		$('.active').click(function(){
			$ ('.event').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.review').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.notice').show(); //클릭 시 두 번째 요소 표시
			return false;
			
			});
		});
</script>
</head>
<body>

	<div id="outer_wrap">
		<div id="wrap">
			<div class="movieChartBeScreen_btn_wrap">
					<div class="tabBtn_wrap">
						<h3>
							<a href="#none" class="active" id="btnMovie">공지사항</a>
						</h3>
						<h3>
							<a href="#none" id="btnReserMovie" class="active1">이벤트게시판</a>
						</h3>
						<h3>
							<a href="#none" id="btnReserMovie" class="active2">영화리뷰게시판</a>
						</h3>
					</div>
				</div>
			<section class="notice">
				<div class="movieChartBeScreen_btn_wrap">
					<div class="tabBtn_wrap">
						<h3>
							<a href="#none">공지사항</a>
						</h3>
					</div>
				</div>
				<div id="board-list">
					<div class="container">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col" class="th-num">번호</th>
									<th scope="col" class="th-title">제목</th>
									<th scope="col" class="th-date">등록일</th>
									<th scope="col" class="th-date">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${noticeList == '[]' }">
										<tr height="10">
											<td colspan="4">
												<p align="center">
													<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
												</p>
											</td>
										</tr>
									</c:when>
									<c:when test="${noticeList != null }">
										<c:forEach var="noticeList" items="${noticeList }"
											varStatus="noticeListNum">
											<tr>
												<td>${noticeListNum.count }</td>
												<th><a
													href="${contextPath}/board/noticeView.do?noticeBoardNO=${noticeList.boardNO}">${noticeList.boardTitle }</a>
												</th>
												<td>${noticeList.boardWriteDate }</td>
												<td><input type="button" class="favorite styled"
													value="삭제하기"
													onClick="fn_delete_board('${noticeList.boardNO}')" />
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

			</section>
			<section class="event">
				<div class="movieChartBeScreen_btn_wrap">
					<div class="tabBtn_wrap">
						<h3>
							<a href="#none">이벤트</a>
						</h3>
					</div>
				</div>
				<!-- board list area -->
				<div id="board-list">
					<div class="container">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col" class="th-num">번호</th>
									<th scope="col" class="th-title">제목</th>
									<th scope="col" class="th-date">등록일</th>
									<th scope="col" class="th-date">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${eventList == '[]' }">
										<tr height="10">
											<td colspan="4">
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
												<td><input type="button" class="favorite styled"
													value="삭제하기"
													onClick="fn_delete_board1('${eventList.boardNO}')" />
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

			</section>
			<section class="review">
				<div class="movieChartBeScreen_btn_wrap">
					<div class="tabBtn_wrap">
						<h3>
							<a href="#none">영화리뷰</a>
						</h3>
					</div>
				</div>
				<!-- board list area -->
				<div id="board-list">
					<div class="container">
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
					</div>
				</div>
			</section>
		</div>

	</div>

</body>
</html>