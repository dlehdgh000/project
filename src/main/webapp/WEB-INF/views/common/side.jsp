<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
	
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<nav>
	<ul>
		<li>
			<h3>예매내역</h3>
			<ul>
				<li><a href="${contextPath}/mypage/listMyOrderHistory.do">현재
						예매 현황</a></li>
				<li><a href="#">최근 예매 내역</a></li>
				<li><a href="#">취소 예매 내역</a></li>
			</ul>
		</li>
		<li>
			<h3>회원정보내역</h3>
			<ul>
				<li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보관리</a></li>
				<li><a href="#">회원탈퇴</a></li>
			</ul>
		</li>
	</ul>
</nav>
<div class="clear"></div>
<div id="banner" style="font-size: 15px;">
	이달의 영화 <img width="197" height="300"
		src="${contextPath}/resources/image/앤트맨포스트.jpg"> </a>
</div>
<DIV id="notice">
	<H2>공지사항</H2>
	<UL>

		<c:forEach var="i" begin="1" end="5" step="1">
			<li><a href="#">공지사항입니다.${ i}</a></li>
		</c:forEach>
	</ul>
</div>


<div id="banner">
	<a href="#"><img width="190" height="362"
		src="${contextPath}/resources/image/side_banner1.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="104"
		src="${contextPath}/resources/image/call_center_logo.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="69"
		src="${contextPath}/resources/image/QnA_logo.jpg"></a>
</div>
</html>