<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>index</title>

<style>
@font-face {
	font-family: 'KimjungchulGothic-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

body {
	font-family: "KimjungchulGothic-Bold";
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #FCEDAA;
	overflow-x: hidden;
	/*   transition: 0.5s; */
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #363636;
	display: block;
	/*   transition: 0.3s; */
}

.sidenav a:hover {
	color: #A9CFE2;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	/*   transition: margin-left .5s; */
	padding: 16px;
}

span.toggle {
  position: fixed;
  top: 0;
  left: 0;
  font-size: 30px; 
  cursor: pointer;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

</style>
</head>
<body>
	
<div id="mySidenav" class="sidenav">
<span class = "toggle" onclick="toggleNav()">&#9776;</span>
<a href="/board/list">게시판</a>
<a href="/teacher/list">티쳐리스트</a>
<a href="/child/listall"> 원아 전체목록 </a> 
<a href="/childlog/list?childid=${sessionScope.loginId}">내 일지</a>
<a href="/childlog/add">일지작성</a>
<div id="tlList">선생님 일지</div>
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