<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>선생님 일지 쓰기</h3>
	<form action="/teacherlog/add" method="post" enctype="multipart/form-data">
		<input type="hidden" name="teacher_id" value="${sessionScope.loginId }">
		child id : <input type="text" name="child_id">
		activity : <input type="text" name="activity">
		health : <input type="text" name="health">
		date : <input type="date" name="tdate">
		img1 <input type="file" name="f[0]">
		img2 <input type="file" name="f[1]">
		img3 <input type="file" name="f[2]">
		<input type="submit" value="일지 작성">
	</form>
</body>
</html>