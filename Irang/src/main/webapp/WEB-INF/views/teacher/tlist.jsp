<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 전체목록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/teacher.css" type="text/css">
</head>
<body>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		
		
<%-- 		<a href="/teacher/mypage?teacherid=${sessionScope.loginId }">마이페이지</a> --%>
<%-- 		<c:if test="${not empty sessionScope.loginId}"> --%>
<%-- 		<br/><h1> ${sessionScope.loginId } 로그인중입니다.</h1> --%>
<%-- 		</c:if> --%>
<div style="text-align:center;">
		<span class="title">선생님 목록</span>
		</div>
<!-- 	이름으로 검색 -->
<div id="getbynamesearch">
	<form action="/teacher/getbyname" >
		<span id="titlename">선생님 검색 </span> 
		<input type="text" name="name" placeholder="선생님 이름을 입력해주세요." class="getbynamesearchtext">
		<input class="btn" type="submit" value="검색">
	</form>
</div>
	<div class="row">
		<c:if test="${empty list }">검색된 결과가 없습니다.</c:if>
	</div>
	<div class="row body" style="margin:10px;">
	<c:forEach var="li" items="${list }">
		<div class="card" style="width: 18rem;">
			<img src="/teacher/read_img?fname=${li.profile }" class="card-img-top" alt="../image/nopic.jpg" onerror="this.onerror=null; this.src='../image/nopic.jpg';">
			<div class="card-body">
				<h5 class="card-title">${li.name }</h5>
				<p class="card-text">
						<c:if test="${fn:startsWith(sessionScope.loginId, 't')}">
							<form action="/teacher/editlist" class="selboxlist">
									<input type="hidden" name="name" value="${li.name }">
									<input type="hidden" name="phone"  value="${li.phone }">
									<input type="hidden" name="pwd"  value="${li.pwd }">
									<input type="hidden" name="teacherid"  value="${li.teacherid }">
									<select id="inputState" class="form-control changeclass" name="classnum">
						            	<c:forEach var="cl" items = "${classlist }"  >
						            		<option class="inline-elements" value="<c:out value="${cl.classnum}"/>" <c:if test="${cl.classnum == li.classnum.classnum}"> selected </c:if>><c:out value="${cl.classname }"  />
						            	</c:forEach>
					            	</select>
								<button class="btn inline-elements" style="">변경</button>
							</form>			
				      </c:if>
				      <c:if test="${fn:startsWith(sessionScope.loginId, 'c')}">
				    	${li.classnum.classname}
				   		</c:if>
				</p>
			</div>
		</div>
	</c:forEach>
	</div>
</body>
</html>