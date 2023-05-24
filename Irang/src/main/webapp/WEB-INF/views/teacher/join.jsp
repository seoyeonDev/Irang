<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/teacher/join" method="post">
id<input type="text"  name="teacherid">
name<input type="text" name="name"><br/>
pwd<input type="password" name="pwd"><br/>
phone<input type="text"  name="phone"><br/>
classnum<input type="number"  name="classnum"><br/>
profile<input type="File"  name="profile"><br/>
<input type="submit" value="가입">
</form>
</body>
</html>