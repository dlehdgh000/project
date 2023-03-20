<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<style>
#font{
font-family: 'GongGothicMedium';
font-size : 20px;
}

img {
	display: block;
	margin: auto;
}

.timeselectinput {
	margin-top: 20px;
}

.button {
	border: 1px solid #000000; /*---테두리 정의---*/
	background-Color: #ffffff; /*--백그라운드 정의---*/
	font: 12px 굴림; /*--폰트 정의---*/
	color: #000000; /*--폰트 색깔---*/
	width: 250;
	height: 50; /*--버튼 크기---*/
	margin-top: 20px;
	border-radius : 10px;
}

.button:hover {
	background: gray;
	color: white;
}



</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

	window.onload = function() {
		datepicker = new Date();
		console.log("datepicker.toISOString() >>>" + datepicker.toISOString());
		datepicker = datepicker.toISOString().slice(0, 10);
		console.log("datepicker >>>> " + datepicker);
		bir = document.getElementById("datepicker");
		bir.value = datepicker;
	}
	
	$( function() {
	    $( "#datepicker" ).datepicker();
	  } );
	
	// DatePicker
	// 기본 영어 => 한글로 변환
	

	$.datepicker._gotoToday = function(id) { 
		$(id).datepicker('setDate', new Date());
		$(".ui-datepicker").hide().blur();
	};
	
	// Datepicker 적용할 id 가져오기
	$(function() {
	  $("#mypoll_fromDate").datepicker();
	  $("#mypoll_toDate").datepicker();
	  $("#refund_fromDate").datepicker();
	  $("#refund_toDate").datepicker();
	  $("#refund_endSurvey").datepicker();
	} );
	
</script>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">

			<div style="text-align: center; margin-top: 20px;">
					
				<form name="timeselectForm" method="post" action="${contextPath }/order/seatselect.do" enctype="text">
				
					<input type="text" class="timeselectinput" id="datepicker" name="movie_screening_date" style="height:45px; border-radius:10px" readonly />
				
				
				<select name="movie_running_time" class="select">
						<option value="11:00" selected="selected">11:00</option>
						<option value="13:00">13:00</option>
						<option value="15:00">15:00</option>
						<option value="17:00">17:00</option>
						<option value="17:00">19:00</option>
				</select> 
					<select name="movie_place" class="select">
						<option value="1관" selected="selected">1관</option>
						<option value="2관">2관</optime>
						<option value="3관">3관</optime>
					</select><br> 
					<input type="submit" class="button" value="좌석 선택하기" id="font" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>