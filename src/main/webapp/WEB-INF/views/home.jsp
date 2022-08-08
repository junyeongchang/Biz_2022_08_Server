<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
</head>
<body>
	<h1>반갑습니다.</h1>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" />
	</sec:authorize>
	<div><a href="${rootPath}/user/login">로그인</a></div>
	<div><a href="${rootPath}/user/join">회원가입</a></div>
	<sec:authorize access="isAuthenticated()">
		<div><a href="${rootPath}/todo/list">TODO 보기</a></div>
		<form:form class="logout" action="${rootPath}/logout">
			<button>로그아웃</button>
		</form:form>
		<sec:authorize access="hasRole('ROLE_USER')">
			<div><a href="${rootPath}/user/mypage">MyPage</a></div>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div><a href="${rootPath}/admin">관리자</a></div>
		</sec:authorize>
	</sec:authorize>
			
</body>
</html>