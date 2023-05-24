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
<h3>글 목록 </h3>
<table border="1">
<tr><th>num</th><th>제목</th><th>작성일</th><th>작성자</th></tr>
<c:forEach var="dto" items="${list }">
<tr>
<td><a href ="/board/detail?num=${dto.num }">${dto.num }</a></td>
<td>${dto.title}</td>
<td>${dto.w_date }</td>
<td>${dto.teacherid }</td>
</tr>
</c:forEach>
</table>
</body>
</html>