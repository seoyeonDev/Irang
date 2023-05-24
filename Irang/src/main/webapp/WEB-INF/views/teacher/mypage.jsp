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
<form action="/teacher/edit">
teacherid: ${dto.teacherid }<br/>
<input type="hidden" value="${dto.teacherid }" name="teacherid">
<input type="text" value="${dto.name }" name="name"><br/>
<input type="password" value="${dto.pwd }" name="pwd"><br/>
<input type="text" value="${dto.phone }" name="phone"><br/>
<input type="number" value="${dto.classnum }" name="classnum"><br/>
<input type="text" value="${dto.profile }" name="profile"><br/>
<input type="submit" value="수정">
<a href="/teacher/delete?teacherid=${sessionScope.loginId }"><button>탈퇴</button></a>
</form>
</body>
</html>