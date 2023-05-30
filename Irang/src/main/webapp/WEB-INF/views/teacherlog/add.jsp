<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'KimjungchulGothic-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
#addbody{
	font-family: 'KimjungchulGothic-Bold';
}
</style>
</head>
<body id="addbody">
	<h3>메뉴</h3>
	<input type="button" value="선생님 일지 리스트 보러가기" id="tlList">
	
	 
	<hr/>
	<h3>선생님 일지 쓰기</h3>
	현재 로그인 중인 아이디 : ${sessionScope.loginId }
	<form action="/teacherlog/add" method="post" enctype="multipart/form-data">
		<div><input type="hidden" name="teacherid" value="${sessionScope.loginId }"></div>
		<div>child id : <input type="text" name="childid"></div>
		<div>activity : <input type="text" name="activity"></div>
		<div>health : <input type="text" name="health"></div>
		<div>date : <input type="date" name="tdate"></div>
		<div>img1 <input type="file" name="f[0]"></div>
		<div>img2 <input type="file" name="f[1]"></div>
		<div>img3 <input type="file" name="f[2]"></div>
		<div><input type="submit" value="일지 작성"></div>
	</form>
	
	<script>
		$(document).ready(function(){
			let loginId = '${sessionScope.loginId}';
			console.log(loginId.charAt(0));
			let url = '';

			if(loginId.charAt(0)=='c'){
				url = '/teacherlog/childList?childid=';
			} else if(loginId.charAt(0)=='t'){
				url = '/teacherlog/list?teacherid=';
			}
			
			$(document).on("click", "#tlList", function(){
				location.href = url + loginId;
			});
		});
	</script>
</body>
</html>