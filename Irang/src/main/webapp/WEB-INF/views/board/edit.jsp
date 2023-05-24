<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> 수정 폼 </h3>

<form action ="/board/edit" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>번호</th><td>${dto.product }</td></tr>
<tr><th>작성자</th><td>${dto.teacherid }</td></tr>
<tr><th>제목</th><td><input type = "text" name ="title"> ${dto.title}</td></tr>
<tr><th>등록날짜</th><td>${dto.w_date }</td></tr>
<tr><th>내용</th><td><textarea name="content" rows="5" cols="30">${dto.content }</textarea></td></tr>
<tr><th>이벤트날짜</th><td><input type="date" name="e_date">${dto.e_date }</td></tr>
<tr><th>이미지</th><td>

<table>
	<tr>
		<td>
			<c:if test="${not empty dto.img1}">
				<img src="/board/read_img?fname=${dto.img1}">
			</c:if>
			<c:if test="${empty dto.img1}">
				이미지 없음
			</c:if>
		</td>
		<td>
			<c:if test="${not empty dto.img2}">
				<img src="/board/read_img?fname=${dto.img2}">
			</c:if>
			<c:if test="${empty dto.img2}">
				이미지 없음
			</c:if>
		</td>
		<td>
			<c:if test="${not empty dto.img3}">
				<img src="/board/read_img?fname=${dto.img3}">
			</c:if>
			<c:if test="${empty dto.img3}">
				이미지 없음
			</c:if>
		</td>
		
	</tr>
	<tr>
		<td><input type="button" class="e" id="eb1" value="수정"><input type="button" class="d" id="db1" value="삭제"></td>
		<td><input type="button" class="e" id="eb2" value="수정"><input type="button" class="d" id="db2" value="삭제"></td>
		<td><input type="button" class="e" id="eb3" value="수정"><input type="button" class="d" id="db3" value="삭제"></td>
	</tr>
</table>

<tr><th>수정</th><td><a href="/board/edit?num=${dto.num}">수정</a></td></tr>
</table>
</form>

</body>
</html>