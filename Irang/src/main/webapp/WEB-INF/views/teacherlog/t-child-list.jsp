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
		<a href="/teacherlog/tChildDetail?tl_num=${li.tl_num }">
			<img src="/teacherlog/read_img?fname=${li.img1 }">
			${li.tl_num }
			${li.child_id.childid }
			${li.tdate }
			${li.activity }
		</a>
		<br/>
	</c:forEach>
</body>
</html>