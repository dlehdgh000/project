<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<style>
table {
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}

tr {
	padding: 10px;
	height: 58px;
}

td {
	padding: 10px;
	border: 1px solid #ddd;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	window.onload = function() {
		selectBoxInit();
	}

	function selectBoxInit() {

		var hp1 = '${member.member_hp1}';
		var selHp1 = document.getElementById('member_hp');
		var optionHp1 = selHp1.options;
		var val;
		for (var i = 0; i < optionHp1.length; i++) {
			val = optionHp1[i].value;
			if (hp1 == val) {
				optionHp1[i].selected = true;
				break;
			}
		}

	}

	function fn_modify_member_info(attribute) {
		if (attribute == 'member_pw') {
			console.log($("input[name= 'member_pw']").val());
			var member_pw = $("input[name= 'member_pw']").val();
			var value = member_pw.toString().trim();
			console.log(member_pw.toString().trim());

		} else if (attribute == 'member_hp') {
			console.log($("#hp1 option:selected").val());
			console.log($("input[name='hp2']").val());
			console.log($("input[name='hp3']").val());

			var h1 = $("#hp1 option:selected").val();
			var h2 = $("input[name='hp2']").val();
			var h3 = $("input[name='hp3']").val();

			var arr = [ h1, h2, h3 ];
			var value = arr.toString().trim();
			console.log(arr.toString().trim());
		}
		console.log(attribute);

		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/mypage/modifyMyInfo.do",
			data : {
				attribute : attribute,
				value : value,
			},
			success : function(data, textStatus) {
				if (data.trim() == 'mod_success') {
					alert("회원 정보를 수정했습니다.");
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
		}); //end ajax

	}
</script>
</head>

<body>
	<h3 style="text-align: center;">내 상세 정보</h3>
	<form name="frm_mod_member">
		<div id="detail_table">
			<table style="margin-left: auto; margin-right: auto;">
				<tbody>
					<tr class="dot_line">
						<td class="fixed_join" style="background: #5e58584b">아이디</td>
						<td><input name="member_id" type="text" size="20"
							value="${member.member_id }" disabled /></td>
						<td></td>
						<br>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join" style="background: #5e58584b">비밀번호</td>
						<td><input type="password" name="member_pw" size="20"
							value="${member.member_pw }" /></td>
						<td><input type="button" value="수정하기" class="favorite styled"
							onClick="fn_modify_member_info('member_pw')" /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join" style="background: #5e58584b">이름</td>
						<td><input name="member_name" size="20"
							value="${member.member_name }" disabled /></td>
						<td></td>
					</tr>

					<tr class="dot_line">
						<td class="fixed_join" style="background: #5e58584b">휴대폰번호</td>
						<td><select name="hp1" id="hp1">
								<option value="${member.member_hp1 }">${member.member_hp1 }</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input type="text" name="hp2" maxlength="4"
							value="${member.member_hp2 }"> - <input type="text"
							name="hp3" maxlength="4" value="${member.member_hp3 }"><br>
							<br></td>
						<td><input type="button" value="수정하기" class="favorite styled"
							onClick="fn_modify_member_info('member_hp')" /></td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="clear">
			<br>
			<br>
			<table align=center>
				<tr>
					<td><input type="hidden" name="command"
						value="modify_my_info" />
						<button type="button" class="favorite styled"
							onclick="location.href='./mypage.do'">수정완료</button></td>
				</tr>
			</table>
		</div>
		<input type="hidden" name="h_hp1" value="${memberInfo.hp1}" />
	</form>
</body>
</html>