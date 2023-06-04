<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학급 목록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/teacher.css" type="text/css">
</head>
<body>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		<div style="text-align:center;">
		<span class="title">클래스 목록</span>
		</div>
<button class="btn" onclick='location.href="/irangclass/add"'>클래스 추가</button>

<table class="irangclasstable">
		<c:forEach var="ic" items="${list }">
		<tr>
			<td class="classname">num</td>
			<td class="classcontent">${ic.classnum }</td>

			<td class="classname">name</td>
			<td class="classcontent">${ic.classname }</td>	
			
			<td> <button class="btn classbtn" onclick='location.href="/irangclass/delete?num=${ic.classnum }"'>학급 삭제</button>
		</tr>
		</c:forEach>	
</table>

</body>
</html>