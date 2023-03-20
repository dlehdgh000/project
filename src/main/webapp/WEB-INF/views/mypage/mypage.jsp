<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
.font {
font-family: 'GongGothicMedium';
}
</style>
</head>
<body>
<div id = "outer_wrap">
		<div id = "wrap">
	<h1 style="font-family: 'GongGothicMedium';">
		현재 예매 내역 <A href="${contextPath}/mypage/myOrderDetail.do"> <IMG
			src="${contextPath}/resources/image/플러스.png" width = "15px">
		</A>
	</h1>
	<table class="list_view">
		<tbody align=center>
			<tr >
				<td class="font"><strong>예매영화</strong></td>
				<td class="font"><strong>관람시간</strong></td>
				<td class="font"><strong>좌석</strong></td>
				<td class="font"><strong>인원수</strong></td>
			</tr>
			<c:choose>
				<c:when test="${ orderInfoList == null }">
					<tr>
						<td colspan=6 class="fixed"><strong>예매 내역이 없습니다.</strong></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${orderInfoList }" varStatus="i">
						<c:if test="${orderInfoList != null }">
						<tr>
							<td class="font"><strong>${item.movie_title }</strong></td>
							<td class="font"><strong>${item.movie_screening_date }/${item.movie_running_time }</strong></td>
							<td class="font"><strong>${item.movie_place } ,${item.movie_seat_number }번 좌석</strong></td>
							<td class="font"><strong>${item.movie_people_qty }</strong></td>							
							</tr>
						</c:if>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				
		</tbody>
	</table>
	<br>
	<br>
	<br>
	<h1 style="font-family: 'GongGothicMedium';">
		작성한 리뷰 
	</h1>
	<table class="list_view">
		<tbody align=center>
			<tr >
				<td class="font"><strong>글번호</strong></td>
				<td class="font"><strong>제목</strong></td>
				<td class="font"><strong>조회수</strong></td>
				<td class="font"><strong>추천수</strong></td>
				<td class="font"><strong>평점</strong></td>
				<td class="font"><strong>등록일</strong></td>
			</tr>
					<c:forEach var="item" items="${reviewInfoList }">
						<tr>
							<td class="font"><strong>${item.boardNO }</strong></td>
							<td class="font"><strong><a href="${contextPath}/board/reviewView.do?reviewBoardNO=${item.boardNO}">${item.boardTitle }</a></strong></td>
							<td class="font"><strong>${item.boardView }</strong></td>
							<td class="font"><strong>${item.boardPush }</strong></td>
							<td class="font"><strong>${item.starpoint / 2}</strong></td>
							<td class="font"><strong>${item.boardWriteDate }</strong> </td>
						</tr>
					</c:forEach>
			
		</tbody>
	</table>
	<br>
	<br>
	<br>
	<h1 class="font">
		나의 정보 <a href="${contextPath}/mypage/myDetailInfo.do"> 
		<img src="${contextPath}/resources/image/플러스.png" width = "15px"/></a>
	</h1>
	
	<table border=1 width=100% height = 30% cellpadding=10 cellspacing=20>
			<tr >
				<td style="width:100px" class="font"><strong>ID</strong></td>
				<td style="width:200px" class="font"><strong>${memberInfo.member_id }</strong></td>
			</tr>
			<tr >
				<td class="font"><strong>휴대폰번호</strong></td>
				  <td class="font"><strong>${memberInfo.member_hp1 }-${memberInfo.member_hp2 }-${memberInfo.member_hp3 }</strong>
				</td>
			</tr>
			<tr >
				<td class="font"><strong>이름</strong></td>
				<td class="font"><strong>${memberInfo.member_name }</strong>
				</td>
			</tr>
			<tr >
				<td class="font"><strong>가입일</strong></td>
				<td class="font"><strong>${memberInfo.joinDate }</strong>
				</td>
			</tr>
	</table>
	</div>
	</div>
	
</body>
</html>