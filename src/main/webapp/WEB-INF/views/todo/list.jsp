<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script>
	const rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/todo.js?ver=2022-08-08-030"></script>
</head>
<body>
	<h1>todo 리스트 화면</h1>
	<a href="${rootPath}/todo/input">메모 작성</a>

	<table class="todo">
		<tr>
			<th>seq</th>
			<th>작성자</th>
			<th>todo</th>
			<th>날짜</th>
			<th>시간</th>
			<th>완료/미완료</th>
			<th>완료시간</th>
			<th>완료날짜</th>
		</tr>
		<c:forEach items="${TODOLIST}" var="todo" varStatus="INDEX">
			<tr data-seq="${todo.t_seq}">
				<td><td>${INDEX.count}</td>
				<td>${todo.t_author}</td>
				<td>${todo.t_todo}</td>
				<td>${todo.t_date}</td>
				<td>${todo.t_time}</td>
				<td class="td-button">${todo.t_check}</td>
				<!-- <td><a href="${rootPath}/todo/${todo.t_seq}/completion"><button type="button">${todo.t_check}</button></a></td> -->
				<td>${todo.t_completion_date}</td>
				<td>${todo.t_completion_time}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>