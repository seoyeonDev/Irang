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
	<c:forEach var="li" items="${items }">
		<a href="/teacherlog/tChildDetail?tl_num=${li.tlnum }">
			<img src="/teacherlog/read_img?fname=${li.img1 }">
			${li.tlnum }
			${li.childid.childid }
			${li.tdate }
			${li.activity }
		</a>
		<br/>
	</c:forEach>
</body>
</html>