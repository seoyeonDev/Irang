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
	$('#STA_YMD').click(function(){
		$('#END_YMD').attr("min", "$('#STA_YMD').val()");
	});
	$('#END_YMD').click(function(){
		$('#STA_YMD').attr("max", "$('#END_YMD').val()");
	});
});

// 선생님이 확인버튼 누름
function check(int num) {
	const xhttp = new XMLHttpRequest(); 
	
    xhttp.onload = function(){  
    	let obj = JSON.parse(xhttp.responseText);
		let check = document.getElementById("check_"+num);
		if (obj.flag == 'true') {
    		check.innerHTML = '확인함'; 
		} else {
			alert('error!');
		}
	}
	
	let param = "?chlognum=" + num; 
	xhttp.open("GET", "/childlog/tcheck"+param);
	xhttp.send();
}
</script>
</head>
<body>
<!-- 월 별 보기... selectbox가 자동으로 현재 시간에 맞춰서 생겼으면 좋겠다.. -->

<!-- 날짜 검색 -->
<input type="date" id="STA_YMD"> ~ <input type="date" id="END_YMD">
<input type="button" value="검색">

<!-- 미확인 일지만 보여주는 버튼~~ -->


<br/>
<c:if test="${fn:startsWith(sessionScope.loginId, 'c')}">
<a href="/childlog/add">일지작성</a>
</c:if>

<c:forEach var="vo" items="list">
<div>
	<c:if test="${vo.tcheck eq 1}"> <!-- 확인함 -->
		<span>확인</span>
	</c:if>
	<c:if test="${vo.tcheck eq 0}"> <!-- 미확인 -->
		<span id="check_${vo.chlognum}">미확인</span>
		<c:if test="${fn:startsWith(sessionScope.loginId, 't')}">
			<input type="button" name="tcheck" value="확인" onclick="check(${vo.chlognum})">
		</c:if>
	</c:if>
	<br/>
	<a href="/childlog/detail?chlognum=${vo.chlognum }"><img src="/childlog/read_img?fname=${img }" style="width:200px;height:200px"></a>
	${vo.wdate }<br/>
	${vo.content }<br/>
</div>
</c:forEach>

</body>
</html>