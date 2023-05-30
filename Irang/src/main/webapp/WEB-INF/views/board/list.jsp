<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>



<script>
function a(){
	  let type = document.getElementById("search").value;
	let span = document.getElementById("searchSpan");
	let html = "";
	
	if (type == "list") {
	    document.f.action = "/board/list";
	  } else if (type == "title") {
	    html = "<input type='text' name ='title'>";
	    document.f.action = "/board/findByTitle";
	  } else if (type == "content") {
	    html = "<input type='text' name ='content'>";
	    document.f.action = "/board/findByContent";
	  } else if (type == "teacherid") {
	    html = "<input type='text' name='teacherid'>";
	    document.f.action = "/board/findByTeacher";
	  } else if (type == "edate") {
	    html = "<input type ='date' name ='edate'>";
	    document.f.action = "/board/findByedate";
	  }
	span.innerHTML = html;
}



</script>

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

table {
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

th {
	text-align: left;
}

thead {
	font-weight: bold;
	color: #fff;
	background: #A9CFE2;
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
}

a {
	color: #363636;
}
a:hover {
  color : #A9CFE2;
  text-decoration: underline;
}
a:link {
  text-decoration: none;
}
a:visited {
  text-decoration: none;
}
a:active {
  color : green;
  text-decoration: none;
}

@media all and (max-width: 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
	}
	th {
		text-align: right;
	}
	table {
		position: relative;
		padding-bottom: 0;
		border: none;
		box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	}
	thead {
		float: left;
		white-space: nowrap;
	}
	tbody {
		overflow-x: auto;
		overflow-y: hidden;
		position: relative;
		white-space: nowrap;
	}
	tr {
		display: inline-block;
		vertical-align: top;
	}
	th {
		border-bottom: 1px solid #A9CFE2;
	}
	td {
		border-bottom: 1px solid #A9CFE2;
	}
}

#ti {
	background: linear-gradient(180deg, rgba(255, 255, 255, 0) 65%, #A9CFE2
		35%);
}

.button {
	padding: 7px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 5px;
}

.button2 {
	background-color: white;
	color: #363636;
	border: 2px solid #A9CFE2;
}

.button2:hover {
	background-color: #A9CFE2;
	color: white;
}

/* Select 요소 스타일 */
select#search {
	height: 35px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* Input 요소 스타일 */
input[type="text"] {
	height: 35px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.button3 {
	padding: 7px 14px;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
	transition-duration: 0.4s;
	background-color: #A9CFE2;
	border: none;
}

.button3:hover {
	background-color: white;
	color: #363636;
	border: 2px solid #A9CFE2;
}

</style>
</head>
<body>
<h3 style = "text-align :center;"><span id ="ti">아이랑 게시판</span></h3>
<br/>
<br/>
<br/>
<br/>

<div style="display: flex; align-items: center; justify-content: space-between;">
  <form action="" method="post" name="f">
    <span>
      <select name="search" id="search" onchange="a()">
        <option value="list">검색하기</option>
        <option value="title">제목</option>
        <option value="content">내용</option>
        <option value="teacherid">작성자</option>
        <option value="edate">이벤트날짜</option>
      </select>
    </span>
    <span id="searchSpan">
      <input type="text">
    </span>
    <input type="submit" value="검색" class="button3">
  </form>
  <a href="/board/add" class="button button2" style="margin-left: auto;">글쓰기</a>
</div>
<br/>
<table class = "table table-hober" >
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성일</th>
<th>작성자</th>
<th>이벤트날짜</th>
</tr>
</thead>

<tbody>
<c:forEach var="dto" items="${list }">
<tr>
<td>${dto.bnum }</td>
<td><a href ="/board/detail?bnum=${dto.bnum }">${dto.title}</a></td>
<td>${dto.wdate }</td>
<td>${dto.teacherid.teacherid }</td>
<td>${dto.edate }</td>
</tr>
</c:forEach>
</tbody>
</table>
<div class = "text-center">
<ul class = "pagination">

</ul>
</div>



<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>