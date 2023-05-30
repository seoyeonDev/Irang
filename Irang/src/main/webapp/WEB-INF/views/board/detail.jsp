<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
img{
width : 50px; 
height :50px;
}
</style>
</head>
<body>


<table border="1">
<tr><th>번호</th><td>${dto.bnum}</td></tr>
<tr><th>중요도</th><td>${dto.mgnum}</td></tr>
<tr><th>작성자</th><td>${dto.teacherid.teacherid }</td></tr>
<tr><th>제목</th><td>${dto.title}</td></tr>
<tr><th>등록날짜</th><td>${dto.wdate }</td></tr>
<tr><th>내용</th><td>${dto.content}
<c:if test="${not empty dto.img1}">
<img src="/board/read_img?fname=${dto.img1}">
</c:if>
<c:if test="${not empty dto.img2}">
<img src="/board/read_img?fname=${dto.img2}">
</c:if>
<c:if test="${not empty dto.img3}">
<img src="/board/read_img?fname=${dto.img3}">
</c:if>



</td></tr>
<tr><th>이벤트날짜</th><td>${dto.edate }</td></tr>
</table>

<c:if test ="${sessionScope.loginId == dto.teacherid.teacherid}">
<table border="1">
<tr><th>수정</th><td><a href="/board/editform?bnum=${dto.bnum}">수정</a></td></tr>
<tr><th>삭제</th><td><a href="/board/del?bnum=${dto.bnum}">삭제</a></td></tr>
</table>
</c:if>




</body>
</html>