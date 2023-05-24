<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> 게시글 등록 </h3>
<form action="/board/add" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td><input type="text" name="teacherid" value="${sessionScope.loginId }" readonly></td></tr>
<tr><th>제목</th><td><input type="text" name="title"></td></tr>
<tr><th>내용</th><td><textarea name="content" rows="5" cols="30"></textarea></td></tr>
<tr><th>이벤트날짜</th><td><input type="date" name="e_date"></td></tr>
<tr><th>상품 이미지1</th><td><input type="file" name="f[0]"></td></tr>
<tr><th>상품 이미지2</th><td><input type="file" name="f[1]"></td></tr>
<tr><th>상품 이미지3</th><td><input type="file" name="f[2]"></td></tr>
<tr><th>등록</th><td><input type="submit" value="등록"></td></tr>
</table>
</form>
</body>
</html>