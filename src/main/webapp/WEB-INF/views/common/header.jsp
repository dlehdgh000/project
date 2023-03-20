	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<style>
.text {
	color: #000000;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}
</style>
<script type="text/javascript">
	var loopSearch = true;
	function keywordSearch() {
		if (loopSearch == false)
			return;
		var value = document.movie_keyword.movie_keyword.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/movie/keywordSearch.do",
			data : {
				keyword : value
			},
			success : function(data, textStatus) {
				var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다." + data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");

			}
		}); //end ajax	
	}

	function displayResult(jsonInfo) {
		var count = jsonInfo.keyword.length;
		if (count > 0) {
			var html = '';
			for ( var i in jsonInfo.keyword) {
				html += "<a href=\"javascript:select('" + jsonInfo.keyword[i]
						+ "')\">" + jsonInfo.keyword[i] + "</a><br/>";
			}
			var listView = document.getElementById("suggestList");
			listView.innerHTML = html;
			show('suggest');
		} else {
			hide('suggest');
		}
	}

	function select(selectedKeyword) {
		document.movie_keyword.movie_keyword.value = selectedKeyword;
		loopSearch = false;
		hide('suggest');
	}

	function show(elementId) {
		var element = document.getElementById(elementId);
		if (element) {
			element.style.display = 'block';
		}
	}

	function hide(elementId) {
		var element = document.getElementById(elementId);
		if (element) {
			element.style.display = 'none';
		}
	}

	function fn_ticketing(isLogOn, ticketing, loginForm) {
		if (isLogOn != '' && isLogOn != 'false') {
			location.href = ticketing;
		} else {
			alert("로그인 후 예매가 가능합니다.")
			location.href = loginForm + '?action=/member/loginForm.do';
		}
	}
</script>
</head>
<body>
	<!-- 네비게이션바 -->
	<div class="ad">
		<a href="${contextPath }/movie/movieDetail.do?movie_id=15" target = "_blank"> <img
			src="${contextPath }/resources/image/adbanner.png" />
		</a>
	</div>
	<div id="outer_wrap">
		<div id="wrap">
			<header>

				<div class="header">
					<div class="header_content">
						<div class="contents">
							<h1 onclick="location.href = '${contextPath}/main/main.do' ">
								<a href="${contextPath}/main/main.do"><img
									src="${contextPath }/resources/image/logo99.png"
									alt="logo"></a>
							</h1>


							<ul class="memberInfo_wrap">
								<c:choose>
									<c:when test="${isLogOn == true and not empty member }">
										<li><a href="${contextPath}/member/logout.do"><img
												src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
												alt="로그아웃"><span>로그아웃</span></a></li>
										<li><a href="${contextPath}/mypage/mypage.do"><img
												src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
												alt="MY PAGE"><span>MY PAGE</span></a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${contextPath}/member/loginForm.do"><img
												src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
												alt="로그인"><span>로그인</span></a></li>
										<li><a href="${contextPath}/member/memberForm.do"><img
												src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
												alt="회원가입"><span>회원가입</span></a></li>
									</c:otherwise>
								</c:choose>
							</ul>

						</div>
					</div>
				</div>
			</header>
			<div style="text-align: center;">
				<div class="dropdown">
					<button class="dropbtn" style = "color : red;"
						onclick="fn_ticketing('${isLogOn}','${contextPath}/order/ticketing.do','${contextPath}/member/loginForm.do') ">
						빠른예매</button>
				</div>
				<div class="dropdown">
					<button class="dropbtn"
						onclick="location.href = '${contextPath}/board/notice.do'">
						공지사항</button>
				</div>
				<div class="dropdown">
					<button class="dropbtn"
						onclick="location.href= '${contextPath}/board/event.do'">
						이벤트</button>
				</div>
				<div class="dropdown">
					<button class="dropbtn"
						onclick="location.href= '${contextPath}/board/review.do'">
						영화리뷰</button>
				</div>
				<c:if test="${isLogOn==true and member.member_id =='admin' }">
					<div class="dropdown">
						<button class="dropbtn"
							onclick="location.href= '${contextPath }/admin/insertMovie.do'">영화등록</button>
					</div>
					<div class="dropdown">
						<button class="dropbtn"
							onclick="location.href= '${contextPath }/admin/movieManage.do'">
							영화관리</button>
					</div>
					<div class="dropdown">
						<button class="dropbtn"
							onclick="location.href= '${contextPath }/admin/seatManage.do'">
							좌석관리</button>
					</div>
					<div class="dropdown">
						<button class="dropbtn"
							onclick="location.href= '${contextPath }/admin/boardListManage.do'">
							게시글관리</button>
					</div>
				</c:if>
					<div class = "dropdown" style = "float:right;">
			<form action="${contextPath}/movie/searchMovie.do"
				name="movie_keyword" method="get">
				<div class="search">
					<input type="text" name="movie_keyword" class="input"
						placeholder="검색어 입력" onKeyUp="keywordSearch()"> <a
						href="${contextPath}/movie/searchMovie.do"> <input
						type="image"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
						class="img" alt="제출">
					</a>
				</div>
				<div id="suggest" class = "dropdown-content">
						<div id="suggestList"></div>
					</div>
			</form>

				
	</div>
		</div>
	</div>
</div>	
</body>
