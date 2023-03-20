<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
	
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<h1>예매 내역 정보</h1>
			<table class="list_view">
				<tbody align=center>
					<tr style="background: #5e58584b">
						<td>티켓 번호</td>
						<td>예매 일자</td>
						<td>예매 영화명</td>
						<td>카드 번호</td>
						<td>카드사</td>
						<td>결제 시간</td>
						<td>티켓 금액</td>
					</tr>
					<c:forEach var="item" items="${orderInfoList }">
						<tr>
							<td>${item.ticket_number}</td>
							<td>${item.pay_order_time}</td>
							<td>${item.movie_title }</td>
							<td>${item.card_number }</td>
							<td>${item.card_com_name }</td>
							<td>${item.pay_order_time }</td>
							<td>${item.movie_price }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clear"></div>
			<br> <br> <br>
			<!-- 
	<H1>3.결제정보</H1>
	<DIV class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">결제방법</td>
					<td>
					   ${PAY_METHOD }
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">결제카드</td>
					<td>
					   ${CARD_COM_NAME}
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">할부기간</td>
					<td>
					   ${CARD_PAY_MONTH }
				    </td>
				</tr>
			</tbody>
		</table>
	</div> -->
			<div class="clear"></div>
			<br> <br> <br> <br> <br> 
		
			<div class="clear"></div>
		</div>
	</div>