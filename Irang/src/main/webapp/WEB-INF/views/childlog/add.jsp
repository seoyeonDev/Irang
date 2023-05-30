<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>오늘의 특이사항 (아이 일지)</h3>
<form action="/childlog/add" method="post" enctype="multipart/form-data">
<%-- 	<input type="hidden" name="childid" value="${sessionScope.loginId }"> --%>
	child: <input type="text" name="childid"> <br/>
	img: <input type="file" name="f"><br/>
	content: <textarea cols="20" rows="5" name="content"></textarea><br/>
	<input type="submit" value="작성">
</form>

</body>
</html>