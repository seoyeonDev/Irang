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
	<c:if test="${sessionScope.loginId:startsWith(string, 'T') }">
		${vo.tl_num }
		${vo.tl_teacher_id.name }
		${vo.tdate }
		${vo.activity }
		${vo.health }
		${vo.img1 }
		<c:if test="${not empty vo.img1 }">
			<img src="/teacherlog/read_img?fname=${vo.img1 }">
		</c:if>
		<c:if test="${not empty vo.img2 }">
			<img src="/teacherlog/read_img?fname=${vo.img2 }">
		</c:if>
		<c:if test="${not empty vo.img3 }">
			<img src="/teacherlog/read_img?fname=${vo.img3 }">
		</c:if>
	</c:if>
	
	<form>
		<h3>댓글 작성하기</h3>
		댓글 <textarea rows="20" cols="20">댓글 작성하기</textarea>
		<input type="button" value="댓글 작성" id="cBtn">
	</form>
</body>
</html>