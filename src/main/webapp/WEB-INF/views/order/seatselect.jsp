<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>

<!-- css -->
<style>
img {
	display: block;
	margin: auto;
}

.button {
	border: 1px solid #000000; /*---테두리 정의---*/
	background-Color: #ffffff; /*--백그라운드 정의---*/
	font: 25px 굴림; /*--폰트 정의---*/
	font-weight: bold; /*--폰트 굵기---*/
	color: #000000; /*--폰트 색깔---*/
	width: 50;
	height: 50; /*--버튼 크기---*/
	margin-top: 20px;
	border-radius : 5px;
}

.button:hover {
	background: gray;
	color: white;
}

.button[disabled] {
	background-color: red;
}

text {
	font-size: large;
}
</style>

<script type="text/javascript">
	function test(e, url) {
		console.log('itemId :' + $(e).attr('id'));
		$(e).prop("disabled", true);

		var seatNum = $(e).attr('id');

		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
		var seatNumInput = document.createElement("input");
		seatNumInput.setAttribute("type", "hidden");
		seatNumInput.setAttribute("name", "seatNum");
		seatNumInput.setAttribute("value", seatNum);

		form.appendChild(seatNumInput);
		document.body.appendChild(form);
		form.submit();
	}
</script>

</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<img src="${contextPath}/resources/image/screen.png" style = "border-radius : 20px;"/>
			<!-- 예매하기 이미지 -->

			<div style="text-align: center; margin-top: 20px;">

				<c:if test="${movie_place == '1관' }">
					<c:forEach var="seatList" items="${seatList }"
						varStatus="seatListNum">
						<c:if
							test="${seatList.movie_seat_number >= 3 && seatList.movie_seat_number == 3 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 9 && seatList.movie_seat_number == 9 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 11 && seatList.movie_seat_number == 11 }">
							<br>
						</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 13 && seatList.movie_seat_number == 13 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 19 && seatList.movie_seat_number == 19 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 21 && seatList.movie_seat_number == 21 }">
							<br>
						</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 23 && seatList.movie_seat_number == 23 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 29 && seatList.movie_seat_number == 29 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 31 && seatList.movie_seat_number == 31 }">
							<br>
						</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 33 && seatList.movie_seat_number == 33 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 39 && seatList.movie_seat_number == 39 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 41 && seatList.movie_seat_number == 41 }">
							<br>
						</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 43 && seatList.movie_seat_number == 43 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 49 && seatList.movie_seat_number == 49 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 51 && seatList.movie_seat_number == 51 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
						</c:if>
						<c:if test="${seatList.seatstatus == 'n' }">
							<input type="button" class="button" name="seat"
								value="${seatList.movie_seat_number }" disabled />
						</c:if>
						<c:if test="${seatList.seatstatus != 'n' }">
							<input type="button" class="button" name="seat"
								value="${seatList.movie_seat_number }" id="${seatListNum.count}"
								onClick="test(this,'${contextPath}/order/ticketingForm.do');" />
						</c:if>
					</c:forEach>
				</c:if>

				<c:if test="${movie_place == '2관' }">
					<c:forEach var="seatList" items="${seatList1 }"
						varStatus="seatListNum">
						<c:if
							test="${seatList.movie_seat_number >= 5 && seatList.movie_seat_number == 5 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 9 && seatList.movie_seat_number == 9 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 13 && seatList.movie_seat_number == 13 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 17 && seatList.movie_seat_number == 17 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>						
						<c:if
							test="${seatList.movie_seat_number >= 21 && seatList.movie_seat_number == 21 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 25 && seatList.movie_seat_number == 25 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 29 && seatList.movie_seat_number == 29 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 33 && seatList.movie_seat_number == 33 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 37 && seatList.movie_seat_number == 37 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 41 && seatList.movie_seat_number == 41 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 45 && seatList.movie_seat_number == 45 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 49 && seatList.movie_seat_number == 49 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 51 && seatList.movie_seat_number == 51 }"></c:if>
						
						<c:if test="${seatList.seatstatus == 'n' }">
							<input type="button" class="button" name="seat"
								value="${seatList.movie_seat_number }" disabled />
						</c:if>
						<c:if test="${seatList.seatstatus != 'n' }">
							<input type="button" class="button" name="seat"
								value="${seatList.movie_seat_number }" id="${seatListNum.count}"
								onClick="test(this,'${contextPath}/order/ticketingForm.do');" />
						</c:if>
					</c:forEach>
				</c:if>

				<c:if test="${movie_place == '3관' }">
					<c:forEach var="seatList" items="${seatList2 }"
						varStatus="seatListNum">
						<c:if
							test="${seatList.movie_seat_number >= 3 && seatList.movie_seat_number == 3 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 7 && seatList.movie_seat_number == 7 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 8 && seatList.movie_seat_number == 8 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>							
						<c:if
							test="${seatList.movie_seat_number >= 12 && seatList.movie_seat_number == 12 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>							
						<c:if
							test="${seatList.movie_seat_number >= 13 && seatList.movie_seat_number == 13 }"><br></c:if>		
						<c:if
							test="${seatList.movie_seat_number >= 15 && seatList.movie_seat_number == 15 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>	
						<c:if
							test="${seatList.movie_seat_number >= 19 && seatList.movie_seat_number == 19 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>											
						<c:if
							test="${seatList.movie_seat_number >= 21 && seatList.movie_seat_number == 21 }"><br><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 24 && seatList.movie_seat_number == 24 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>							
						<c:if
							test="${seatList.movie_seat_number >= 28 && seatList.movie_seat_number == 28 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>							
						<c:if
							test="${seatList.movie_seat_number >= 31 && seatList.movie_seat_number == 31 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 35 && seatList.movie_seat_number == 35 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>	
						<c:if
							test="${seatList.movie_seat_number >= 39 && seatList.movie_seat_number == 39 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>							
						<c:if
							test="${seatList.movie_seat_number >= 43 && seatList.movie_seat_number == 43 }"><br></c:if>
						<c:if
							test="${seatList.movie_seat_number >= 43 && seatList.movie_seat_number == 45 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if
							test="${seatList.movie_seat_number >= 49 && seatList.movie_seat_number == 49 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>

						
						<c:if test="${seatList.seatstatus == 'n' }">
							<input type="button" class="button" name="seat"
								value="${seatList.movie_seat_number }" disabled />
						</c:if>
						<c:if test="${seatList.seatstatus != 'n' }">
							<input type="button" class="button" name="seat"
								value="${seatList.movie_seat_number }" id="${seatListNum.count}"
								onClick="test(this,'${contextPath}/order/ticketingForm.do');" />
						</c:if>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>