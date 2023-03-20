<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("utf-8");
%>
<head>

<!-- 타일즈에 적용할 CSS 링크 -->
<link href="${contextPath}/resources/css/stylesheet.css"
	rel="stylesheet" />
<script src="${contextPath}/resources/jquery/jquery-1.6.2.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/jquery.easing.1.3.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/stickysidebar.jquery.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/tabs.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/carousel.js"
	type="text/javascript"></script>

<style>
body {
	margin: 0;
}
</style>
<!-- tiles_*.xml 에 title 에 쓴 이름대로 브라우저에 출력됌 -->
<title><tiles:insertAttribute name="title" /></title>

</head>
<body>
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<div class="clear"></div>
	<article>
		<tiles:insertAttribute name="body" />
	</article>
	<div class="clear"></div>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
	</div>
	</div>
</body>
