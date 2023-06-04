<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/sidemenu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>index</title>

</head>
<body>
	
<div id="mySidenav" class="sidenav">

<span class = "toggle" onclick="toggleNav()">&#9776;</span>
<img src="../image/logo2.png">

<a href="/board/list">게시판</a>
<a href="#" id="tlList">선생님 일지</a>
<a href="/teacher/list"> 선생님 리스트</a>

<c:if test="${fn:startsWith(sessionScope.loginId, 'c')}">
<a href="/childlog/list?childid=${sessionScope.loginId}">${sessionScope.loginId}의 일지</a>
<a href="/childlog/add">일지작성</a>

<div class="dropdown">
<a href="#" class="dropbtn">마이페이지</a>
<div class="dropdown-content">
<a href="/child/join"> 아이정보입력</a>
<a href="/child/listmyclass"> ${sessionScope.loginId}반 정보</a>
<a href="/child/logout">로그아웃</a>
</div>
</div>
</c:if>


<c:if test="${fn:startsWith(sessionScope.loginId, 't')}">
<a href="/child/childadd">아이회원등록</a>
<a href="/irangclass/list">클래스 리스트</a>
<a href="/child/listall"> 원아 전체목록 </a> 
<a id="addTlA" href="/teacherlog/add?teacherid=${sessionScope.loginId}">일지 작성</a>

<div class="dropdown">
<a href="/teacher/mypage" class="dropbtn">마이페이지</a>
<div class="dropdown-content">
<a href="/child/listmyclass2">우리반 관리</a>
<a href="/teacher/logout">로그아웃</a>
<a href="/teacher/delete">탈퇴</a>
</div>
</div>
</c:if>

</div>





<script> 

$(document).ready(function(){
    let loginId = '${sessionScope.loginId}';
    console.log(loginId.charAt(0));
    let url = '';

    if(loginId.charAt(0)=='c'){
       url = '/teacherlog/childList?childid=';
       $("#addTlA").hide();
    } else if(loginId.charAt(0)=='t'){
       url = '/teacherlog/list?teacherid=';
       $("#addTlA").show();
    }
    
    $(document).on("click", "#tlList", function(){
       location.href = url + loginId;
    });
 });
</script>
<!-- 	<span class = "toggle" onclick="toggleNav()">&#9776;</span> -->
	
	
	<script>
		window.onload = function() {
			openNav();
		}

		function toggleNav() {
			const sidenav = document.getElementById("mySidenav");
			const isOpen = sidenav.style.width === "250px";

			if (isOpen) {
				closeNav();
			} else {
				openNav();
			}
		}

		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
			document.getElementById("main").style.marginLeft = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
		}
	</script>
</body>
</html>