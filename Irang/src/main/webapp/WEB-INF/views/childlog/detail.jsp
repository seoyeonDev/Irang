<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/childlogdetail.css">
<title>Insert title here</title>
<script>
//선생님이 확인버튼 누름
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

// 일지 삭제버튼
function logdel(num, childid) {
	let result = confirm('일지를 삭제하시겠습니까?');
	if(result == true) {
		let param = "?chlognum=" + num;
		param += "&childid=" + childid;
		location.href = "/childlog/delete" + param;
	}
}
		

// 댓글 수정버튼  
function editFrom(num){
	let cont = document.getElementById("comcont_" + num);
	let content = cont.innerHTML;
	cont.innerHTML = "<textarea id='new_"+ num + "' rows='5' cols='30'>" + content + "</textarea>";
	
	let btn = document.getElementById("combtn_" + num);
	btn.style.display="none";
	
	let form = document.getElementById("edit_" + num);
	form.style.display="";
}

// 댓글 수정폼 -- 취소 버튼 
function editCancel(num) {
	let btn = document.getElementById("combtn_" + num);
	btn.style.display="";
	
	let form = document.getElementById("edit_" + num);
	form.style.display="none";
}

// 댓글 수정폼 -- 수정완료 버튼 
function comEdit(num) {
	const xhttp = new XMLHttpRequest(); 
	
    xhttp.onload = function(){  
    	let obj = JSON.parse(xhttp.responseText);
		document.getElementById("comcont_"+num).innerHTML = obj.content;
		editCancel(num);
	}
	
	let param = "?num=" + num; 
	param += "&content=" + document.getElementById("new_" + num).value;
	xhttp.open("GET", "/chlogcom/edit"+param);
	xhttp.send();
}

// 댓글 삭제버튼
function comdel(num) {
	let result = confirm('댓글을 삭제하시겠습니까?');
	if(result == true) {
		const xhttp = new XMLHttpRequest(); 
		
	    xhttp.onload = function(){  
			let div = document.getElementById("div_"+num);
			div.remove();
						
		}
		
		let param = "?num=" + num; 
		xhttp.open("GET", "/chlogcom/delete"+param);
		xhttp.send();
	}
}

</script>
</head>
<body>
<div id="info">
		<span id="chimg"><img src="/childlog/read_img?fname=${chImg }"> </span>
		<span><span id="child">${classname}반 ${dto.childid.name }</span> &nbsp; | &nbsp;</span>
		<span>${dto.wdate } &nbsp;| &nbsp;</span>
		<c:if test="${dto.tcheck eq 1}"> <!-- 확인함 -->
			<span style="color:blue">확인</span>
		</c:if>
		<c:if test="${dto.tcheck eq 0}"> <!-- 미확인 -->
			<span id="check_${dto.chlognum}" style="color:red">미확인</span>
			<c:if test="${fn:startsWith(sessionScope.loginId, 't')}">
				<input class="button2" type="button" name="tcheck" id="tcheck" value="확인" onclick="check(${dto.chlognum})">
			</c:if>
		</c:if>
</div>

<div id="content">
<div id="img">
	<c:if test="${not empty dto.img}">
		<img src="/childlog/read_img?fname=${dto.img }" style="width:200px;height:200px"> <br/>
	</c:if>
	<c:if test="${empty dto.img}">
		<img src="../image/nopic.jpg" style="width:200px;height:200px"> <br/>
	</c:if>
</div>

<div> ${dto.content }</div>
</div>

<div class="bt_wrap">
<c:if test="${sessionScope.loginId eq dto.childid.childid}">
	<input class="button button2" type="button" id="edit" value="수정" onclick="location.href='/childlog/edit?chlognum=${dto.chlognum}'">
	<input class="button button2" type="button" id="delete" value="삭제" onclick="logdel(${dto.chlognum}, '${dto.childid.childid }')">
</c:if>
</div>
<br/><br/>

<!-- 댓글 리스트 -->
<c:if test="${empty com }">
	작성된 댓글이 없습니다.
</c:if>
<c:if test="${not empty com }">
	<c:forEach var="vo" items="${com}">
	<div id="div_${vo.num }">
		${vo.wdate } <br/>
		${vo.name} <br/>
		<p id="comcont_${vo.num}">${vo.content }</p>
		<c:if test="${sessionScope.loginId eq vo.id}">
			<div id="combtn_${vo.num }">
				<input type="button" value="수정" onclick="editFrom(${vo.num })">
				<input type="button" value="삭제" onclick="comdel(${vo.num })">
			</div>
			<div id="edit_${vo.num}" style="display: none">
				<form>
					<input type="button" value="수정완료" onclick="comEdit(${vo.num})">
					<input type="button" value="취소" onclick="editCancel(${vo.num})">
				</form>
			</div>
		</c:if>
	</div>
	</c:forEach>
</c:if>

<!-- 댓글 작성폼 -->
<form action="/chlogcom/add" method="GET">
	<input type="hidden" value="${dto.chlognum}" name="chlognum">
	<input type="hidden" value="${sessionScope.loginId}" name="id">
	<c:if test="${fn:startsWith(sessionScope.loginId, 't')}">
		<input type="hidden" value="${classname}반 선생님" name="name">
	</c:if>
	<c:if test="${fn:startsWith(sessionScope.loginId, 'c')}">
		<input type="hidden" value="${dto.childid.name}" name="name">
	</c:if>
	<textarea name="content" rows="5" cols="30"></textarea>
	<input type="submit" value="작성">
</form>


</body>
</html>