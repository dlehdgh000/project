<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style>
.loginform {
	margin: 0px auto;
	padding: 0px;
	width: 400px;
	font-family: 'GongGothicMedium';
}
</style>
<script src="https://kit.fontawesome.com/d5de41110f.js" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" charset="text/html; charset=UTF-8">
<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>  
</head>
<body>
	<div class = "loginForm">
		<h2>Login</h2>

		<form action="${contextPath}/member/login.do" method="post" id="login-form">
			
			<table>
				<tbody>
					<input type="text" value="" name="member_id" placeholder="EMAIL"/>
					<input type="password" value="" name="member_pw" placeholder="PASSWORD"/>
					<a style="text-decoration:none" href="${contextPath}/member/memberForm.do"><i class="fa-solid fa-user"></i>회원가입</a>	
				</tbody>
			</table>
			
			<input type="submit" value="Login"> 
			<input type="button" style = "font-size : 16px;" value="reset">
			
			
		</form>
		
	</div>

</body>
</html>