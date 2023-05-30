<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/teacher.css" type="text/css">

</head>
<body>
<a href="/teacher/join">회원 가입</a>
<a href="/teacher/login">로그인</a>
<a href="/teacher/mypage?teacherid=${sessionScope.loginId }">마이페이지</a>
${sessionScope.loginId }로 로그인됨<br/>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		
<!-- 	이름으로 검색 -->
	<form action="/teacher/getbyname" >
	선생님 이름 <input type="text" name="name">
	<input type="submit" value="검색">
	</form>
	
<!-- <!-- 	학급으로 검색--> 
<!-- 		<div class="mb-3"> -->
<!-- 		    <select id="inputState" class="form-control"> -->
<!-- 		        <option selected>학급</option> -->
<%-- 		        <c:forEach var="cl" items="${classlist}"> --%>
<%-- 		            <option value="/teacher/getbyclass?classnum=${cl.classnum}"> --%>
<%-- 		                <c:out value="${cl.classname}" /> --%>
<!-- 		            </option> -->
<%-- 		        </c:forEach> --%>
<!-- 		    </select> -->
<!-- 		</div>	 -->

	
	<div class="row" style="margin:10px;">
	<c:forEach var="li" items="${list }">
		<div class="card" style="width: 18rem;">
			<img src="/teacher/read_img?fname=${li.profile }" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">${li.name }</h5>
				<p class="card-text">
					${li.classnum.classname}<br/>					
					
				</p>
			</div>
		</div>
	</c:forEach>
	</div>
</body>
</html>