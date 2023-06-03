<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 목록</title>
<link rel="stylesheet" href="/css/irangclass.css" type="text/css">

</head>
<body>

<div id="classadd">
	<form action="/irangclass/add" method="post">
		<table>
		<tr>
			<td>name</td>
			<td><input type="text" name="classname" class="text"></td>
			<td colspan="2"><input type="submit" value="클래스 생성하기" class="btn"></td>
		</tr>
		<c:forEach var="ic" items="${list }">
		<tr>
			<td class="title">num</td>
			<td>${ic.classnum }</td>

			<td class="title">name</td>
			<td>${ic.classname }</td>	
		</tr>
		</c:forEach>	
		</table>
	</form>	
</div>
</body>
</html>