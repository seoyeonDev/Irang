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
<a href="/board/list">게시판</a>
<a href="/teacher/list">티쳐리스트</a>
<a href="/child/listall"> 원아 전체목록 </a> 
<c:if test="${fn:startsWith(sessionScope.loginId, 'c')}">
<a href="/childlog/list?childid=${sessionScope.loginId}">sessionScope.loginId의 일지</a>
<a href="/childlog/add">일지작성</a>
</c:if>

<a href="#" id="tlList">선생님 일지</a>

<script> 

$(document).ready(function(){
         let loginId = '${sessionScope.loginId}';
         console.log(loginId.charAt(0));
         let url = '';

         if(loginId.charAt(0)=='c'){
            url = '/teacherlog/childList?childid=';
         } else if(loginId.charAt(0)=='t'){
            url = '/teacherlog/list?teacherid=';
         }
         
         $(document).on("click", "#tlList", function(){
            location.href = url + loginId;
         });
      });
</script>
</div>
	<span class = "toggle" onclick="toggleNav()">&#9776;</span>
	
	
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