<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<style>
.button {
	border: 1px solid #000000;
	background-Color: #ffffff;
	font: 25px 굴림;
	font-weight: bold;
	color: #000000;
	width: 50;
	height: 50;
	margin-top: 20px;
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

<script>
	function fn_modify_seat(movie_place) {

		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/admin/modifySeat.do",
			data : {
				movie_place : movie_place
			},
			success : function(data, textStatus) {
				if (data.trim() == 'mod_success') {
					alert("좌석 정보를 수정했습니다.");
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

	function fn_modify_seat1(movie_place) {

		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/admin/modifySeat1.do",
			data : {
				movie_place : movie_place
			},
			success : function(data, textStatus) {
				if (data.trim() == 'mod_success') {
					alert("좌석 정보를 수정했습니다.");
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
		$('.1st').show(); //페이지를 로드할 때 표시할 요소
		$('.2st').hide(); //페이지를 로드할 때 숨길 요소
		$('.3st').hide(); //페이지를 로드할 때 숨길 요소
		$('.active1').click(function(){
		$ ('.1st').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.3st').hide(); //클릭 시 첫 번째 요소 숨김
		$ ('.2st').show(); //클릭 시 두 번째 요소 표시
		return false;
		
		});
		$('.active2').click(function(){
			$ ('.1st').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.2st').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.3st').show(); //클릭 시 두 번째 요소 표시
			return false;
			
			});
		$('.active').click(function(){
			$ ('.2st').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.3st').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.1st').show(); //클릭 시 두 번째 요소 표시
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
							<a href="#none" class="active" id="btnMovie">1관</a>
						</h3>
						<h3>
							<a href="#none" id="btnReserMovie" class="active1">2관</a>
						</h3>
						<h3>
							<a href="#none" id="btnReserMovie" class="active2">3관</a>
						</h3>
					</div>
				</div>
			
			<form name="frm_mod_seat" method=post>
				<div style="text-align: center;">
				<div class = "1st">
					<h1>1관</h1>
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
					<br> <input type="button" class="favorite styled"
						style="margin-top: 10px; margin-bottom: 10px;" value="1관 좌석풀기"
						onClick="fn_modify_seat('1관')" /> <input type="button"
						class="favorite styled"
						style="margin-top: 10px; margin-bottom: 10px;" value="1관 좌석매진"
						onClick="fn_modify_seat1('1관')" />
						</div>
						
						<div class = "2st">
						
					<h1>2관</h1>
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
					<br> <input type="button" class="favorite styled"
						style="margin-top: 10px; margin-bottom: 10px;" value="2관 좌석풀기"
						onClick="fn_modify_seat('2관')" /> <input type="button"
						class="favorite styled"
						style="margin-top: 10px; margin-bottom: 10px;" value="2관 좌석매진"
						onClick="fn_modify_seat1('2관')" />
						</div>
						
						<div class = "3st">
						
					<h1>3관</h1>
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
					<br> <input type="button" class="favorite styled"
						style="margin-top: 10px; margin-bottom: 10px;" value="3관 좌석풀기"
						onClick="fn_modify_seat('3관')" /> <input type="button"
						class="favorite styled"
						style="margin-top: 10px; margin-bottom: 10px;" value="3관 좌석매진"
						onClick="fn_modify_seat1('3관')" />
						
				</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>