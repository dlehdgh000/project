<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<style>
.memberform {
	margin: 0px auto;
	padding: 0px;
	width: 400px;
	font-family: 'GongGothicMedium';
}

</style>
<script>
	function fn_overlapped() {
		var _id = $("#_member_id").val();
		if (_id == '') {
			alert("ID를 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/member/overlapped.do",
			dataType : "text",
			data : {
				id : _id
			},
			success : function(data, textStatus) {
				if (data == 'false') {
					alert("사용 가능한 ID입니다.");
					$('#btnOverlapped').prop("disabled", true);
					$('#_member_id').prop("disabled", true);
					$('#member_id').val(_id);
				} else {
					alert("사용할 수 없는 ID입니다.");
				}
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다.");
				ㅣ
			},
			complete : function(data, textStatus) {
			}
		});
	}
</script>
</head>
<body>
	<div class="memberform">
		<h2>필수 입력 사항</h2>
		<form method="post" action="${contextPath}/member/addMember.do"
			type="text" id="login-form">
			<table>
				<tbody>
					<tr class="dot_line">
						<input type="text" name="_member_id" id="_member_id"
							placeholder="아이디" class="font" />
						<input type="hidden" name="member_id" id="member_id"
							placeholder="Id" />
						<input type="button" style = "background-color : #000; font-size : 16px; color : white;" id="btnOverlapped" value="중복체크"
							onClick="fn_overlapped()" class="font" />
					</tr>
					<tr class="dot_line">
						<input name="member_pw" type="password" placeholder="비밀번호" />
					</tr>
					<tr class="dot_line">
						<input name="member_name" type="text" placeholder="이름" class="font" />
					<tr class="dot_line">
						<select name="member_hp1" style="width: 70px; height: 48px;">
							<option selected value="010">010</option>
							<option value="011">011</option>
					</tr>
					</select>
					<tr>
						<input type="text" name="member_hp2" placeholder="전화번호" style="max-width: 41%" />
					<tr>
						<input type="text" name="member_hp3" placeholder="전화번호" style="max-width: 41%" />
						<input type="submit" value="회원가입" class="font">
				</tbody>
			</table>
	</div>
	<div class="clear">

		<table align=center>

		</table>
		</form>
	</div>
</body>
</html>