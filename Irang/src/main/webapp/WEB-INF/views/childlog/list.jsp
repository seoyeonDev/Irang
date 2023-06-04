<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/childloglist.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script>

// 선생님이 확인버튼 누름
function check(num) {
	const xhttp = new XMLHttpRequest(); 
	
    xhttp.onload = function(){  
		document.getElementById("check_"+num).innerHTML = '확인';
		document.getElementById("check_"+num).style.color = "blue"
		document.getElementById("tcheck_"+num).style.display="none";
	}
	
	let param = "?chlognum=" + num; 
	xhttp.open("GET", "/childlog/tcheck"+param);
	xhttp.send();
}

// 시작 날짜 누르면
function start(){
	let startdate = document.getElementById("start").value;
	//alert(startdate);
	document.getElementById("end").setAttribute('min', startdate);
	//alert(document.getElementById("end").getAttribute("min"));
}

// 끝 날짜 누르면
function end(){
	let enddate = document.getElementById("end").value;
	//alert(enddate);
	document.getElementById("start").setAttribute('max', enddate);
	//alert(document.getElementById("start").getAttribute("max"));
}

// 날짜 기간 검색 
function datesearch(childid) {
	let param = '?childid='+childid;
	param += '&start=' + document.getElementById("start").value;
	param += '&end=' + document.getElementById("end").value;
	location.href="/childlog/datesearch"+param;
}
</script>
</head>
<body id="chlogbody">
<div class = "chlog_title">
	<span id="title">일지 리스트</span>
</div>

<input type="button" class="everybtn" value="전체리스트" onclick="location.href='/childlog/list?childid=${childid}'">
<!-- 미확인 일지만 보여주는 버튼~~ -->
<input type="button" class="yetbtn" value="미확인일지" onclick="location.href='/childlog/unchecked?childid=${childid}'">

<!-- 날짜 검색 -->
<div class="search">
	<input type="date" id="start" onchange="start()"> ~ <input type="date" id="end" onchange="end()">
	<input type="button" class="searchbtn" value="검색" onclick="datesearch('${childid}')">
</div>


<br/>
<%-- <c:if test="${fn:startsWith(sessionScope.loginId, 'c')}"> --%>
<!-- 	<input type="button" value="일지작성" onclick="location.href='/childlog/add'"> -->
<%-- </c:if> --%>
<br/>

<div class="chloglist">
<c:if test="${empty list }">
	검색 결과가 없습니다.
</c:if>
</div>

<div class="chloglist row row-cols-1 row-cols-md-3 g-4">
	<c:forEach var="dto" items="${list}">
		<div class="col">
			<div class="card h-100" style="max-width: 16rem;">
		    	<div class="card-header">
					<c:if test="${dto.tcheck eq 1}"> <!-- 확인함 -->
						<span style="color:blue; text-align:right;">확인</span>
					</c:if>
					<c:if test="${dto.tcheck eq 0}"> <!-- 미확인 -->
						<span style="color:red; text-align:right;" id="check_${dto.chlognum}">미확인</span>
						<c:if test="${fn:startsWith(sessionScope.loginId, 't')}">
							<input type="button" name="tcheck" id="tcheck_${dto.chlognum}" value="확인" onclick="check(${dto.chlognum})">
						</c:if>
					</c:if>
		   		</div>
		   		<c:if test="${not empty dto.img}">
					<a href="/childlog/detail?chlognum=${dto.chlognum }"><img src="/childlog/read_img?fname=${dto.img }" class="card-img-top"></a>
				</c:if>
				<c:if test="${empty dto.img}">
					<a href="/childlog/detail?chlognum=${dto.chlognum }"><img src="../image/nopic.jpg" class="card-img-top"></a>
				</c:if>
		    	<div class="card-body">
		    		<h5 class="card-title cont">${dto.content }</h5>
		   		</div>
		   		 <div class="card-footer">
      				<small class="text-muted">${dto.wdate }</small>
    			</div>
		    </div>
		</div>
	</c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>