<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/boardlist.css">

<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>



<script>
	function a() {
		let type = document.getElementById("search").value;
		let span = document.getElementById("searchSpan");
		let html = "";

		if (type == "list") {
			document.f.action = "/board/list";
		} else if (type == "title") {
			html = "<input type='text' name ='title'>";
			document.f.action = "/board/findByTitle";
		} else if (type == "content") {
			html = "<input type='text' name ='content'>";
			document.f.action = "/board/findByContent";
		} else if (type == "teacherid") {
			html = "<input type='text' name='teacherid'>";
			document.f.action = "/board/findByTeacher";
		} else if (type == "edate") {
			html = "<input type ='date' name ='edate'>";
			document.f.action = "/board/findByedate";
		}
		span.innerHTML = html;
	}

	$(document).ready(function() {

	});
</script>

</head>
<body>
	<h3 style="text-align: center;">
		<span id="ti">아이랑 게시판</span>
	</h3>
	<br />
	<br />
	<br />
	<br />

	<div
		style="display: flex; align-items: center; justify-content: space-between;">
		<form action="" method="post" name="f">
			<span> <select name="search" id="search" onchange="a()">
					<option value="list">검색하기</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="teacherid">작성자</option>
					<option value="edate">이벤트날짜</option>
			</select>
			</span> <span id="searchSpan"> <input type="text">
			</span> <input type="submit" class="button button2" value="검색">
		</form>
		<c:if test="${fn:startsWith(sessionScope.loginId, 't')}">
			<a href="/board/add" class="button button2"
				style="margin-left: auto;">글쓰기</a>
		</c:if>
	</div>
	<br />
	<table class="table table-hober">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>이벤트날짜</th>
			</tr>
		</thead>

		<tbody>
			<c:choose>
				<c:when test="${dto.mgnum ==1}">
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.bnum }</td>
							<td><a href="/board/detail?bnum=${dto.bnum }">${dto.title}</a></td>
							<td>${dto.wdate }</td>
							<td>${dto.teacherid.teacherid }</td>
							<td>${dto.edate }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.bnum }</td>
							<td><a href="/board/detail?bnum=${dto.bnum }">${dto.title}</a></td>
							<td>${dto.wdate }</td>
							<td>${dto.teacherid.teacherid }</td>
							<td>${dto.edate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div class="text-center">
		<ul class="pagination">

		</ul>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>
</body>
</html>