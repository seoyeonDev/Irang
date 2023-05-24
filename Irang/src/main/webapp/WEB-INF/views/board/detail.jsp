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


<table border="1">
<tr><th>번호</th><td>${dto.product }</td></tr>
<tr><th>작성자</th><td>${dto.teacherid }</td></tr>
<tr><th>제목</th><td>${dto.title}</td></tr>
<tr><th>등록날짜</th><td>${dto.w_date }</td></tr>
<tr><th>내용</th><td>${dto.content}</td></tr>
<tr><th>이벤트날짜</th><td>${dto.e_date }</td></tr>
<tr><th>이미지</th><td>
<img src="/board/read_img?fname=${dto.img1}">
<img src="/board/read_img?fname=${dto.img2}">
<img src="/board/read_img?fname=${dto.img3}">
</td></tr>

</table>

<c:if test ="${sessionScope.loginId == dto.teacherid}">
<table border="1">
<tr><th>수정</th><td><a href="/board/editform?num=${dto.num}">수정</a></td></tr>
<tr><th>삭제</th><td><a href="/board/del?num=${dto.num}" >삭제</a></td></tr>
</table>
</c:if>




</body>
</html>