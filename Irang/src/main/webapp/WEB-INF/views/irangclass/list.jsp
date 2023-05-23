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
<a href="/irangclass/add">class 추가하기</a><br/>
<c:forEach var="ic" items="${list }">
num: ${ic.classnum }
name: ${ic.classname }<br/>
</c:forEach>
</body>
</html>