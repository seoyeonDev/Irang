<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('#start').click(function(){
		$('#end').attr("min", "$('#start').val()");
	});
	$('#ent').click(function(){
		$('#start').attr("max", "$('#end').val()");
	});
	
});

// 선생님이 확인버튼 누름
function check(num) {
	const xhttp = new XMLHttpRequest(); 
	
    xhttp.onload = function(){  
		document.getElementById("check_"+num).innerHTML = '확인함';
		document.getElementById("tcheck").style.display="none";
	}
	
	let param = "?chlognum=" + num; 
	xhttp.open("GET", "/childlog/tcheck"+param);
	xhttp.send();
}

function datesearch(childid) {
	let param = '?childid='+childid;
	param += '&start=' + document.getElementById("start").value;
	param += '&end=' + document.getElementById("end").value;
	location.href="/childlog/datesearch"+param;
}
</script>
</head>
<body>
<input type="button" value="전체리스트" onclick="location.href='/childlog/list?childid=${childid}'">
<!-- 월 별 보기... selectbox가 자동으로 현재 시간에 맞춰서 생겼으면 좋겠다.. -->


<!-- 날짜 검색 -->
<div>
	<input type="date" id="start"> ~ <input type="date" id="end">
	<input type="button" value="검색" onclick="datesearch('${childid}')">
</div>

<!-- 미확인 일지만 보여주는 버튼~~ -->
<input type="button" value="미확인일지" onclick="location.href='/childlog/unchecked?childid=${childid}'">




<br/>
<c:if test="${fn:startsWith(sessionScope.loginId, 'c')}">
<a href="/childlog/add">일지작성</a>
</c:if>

<c:if test="${empty list }">
	검색 결과가 없습니다.
</c:if>

<c:forEach var="dto" items="${list}">
<div>
	<c:if test="${dto.tcheck eq 1}"> <!-- 확인함 -->
		<span>확인</span>
	</c:if>
	<c:if test="${dto.tcheck eq 0}"> <!-- 미확인 -->
		<span id="check_${dto.chlognum}">미확인</span>
		<c:if test="${fn:startsWith(sessionScope.loginId, 't')}">
			<input type="button" name="tcheck" id="tcheck" value="확인" onclick="check(${dto.chlognum})">
		</c:if>
	</c:if>
	<br/>
	
		<c:if test="${not empty dto.img}">
			<a href="/childlog/detail?chlognum=${dto.chlognum }"><img src="/childlog/read_img?fname=${dto.img }" style="width:200px;height:200px"></a> <br/>
		</c:if>
		<c:if test="${empty dto.img}">
			<a href="/childlog/detail?chlognum=${dto.chlognum }"><img src="../image/nopic.jpg" style="width:200px;height:200px"></a> <br/>
		</c:if>
	
	<br/>${dto.wdate }<br/>
	${dto.content }<br/>
</div>
</c:forEach>

</body>
</html>