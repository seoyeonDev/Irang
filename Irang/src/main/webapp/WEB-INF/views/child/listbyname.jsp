<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>이름에 ${name }(이)가 들어간 아이 검색결과</h3>
<a href="/child/join">추가</a>
<a href="/child/listbyclass?classnum=1"><input type="button" value="1반" id="class_1"></a>
<a href="/child/listbyclass?classnum=2"><input type="button" value="2반" id="class_2"></a>

<form action="/child/listbyname" method="post">
<input type="text" id="name" name="name">
<input type="submit" id="namebtn" value="이름검색">
</form>

<table border="1">
<tr><th>반명</th><th>id</th><th>name</th><th>birthday</th><th>photo</th></tr>
<c:forEach var="list" items="${list }">
<tr>
	<td>${list.classnum.classname }</td>
	<td>${list.childid }</td>
	<td><a href="/child/childinfo?childid=${list.childid}">${list.name }</a></td>
	<td>${list.birthday }</td>
	<td><img src="/child/read_img?fname=${list.img }" style="width:200px; height:200px;"></td></tr>
</c:forEach>
</table>
</body>
</html>