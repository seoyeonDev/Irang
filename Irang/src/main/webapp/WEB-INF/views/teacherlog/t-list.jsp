<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'KimjungchulGothic-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
#tlistbody{
	font-family: 'KimjungchulGothic-Bold';
}





</style>
</head>
<body id="tlistbody">

<!-- 보호자.ver list -->
<h3>보호자 입장에서 보이는 일지 리스트</h3>
<c:if test="${fn:substring(sessionScope.loginId, 0, 1) eq 'c'}">
	<div id="searchDate">
		<input type="date" id="tdate">
		<input type="button" value="검색하기" id="search">
	</div>
	
	<div id="tlist">
		<c:forEach var="li" items="${list }">
			<c:if test="${not empty li.img1 }">
				<a href="/teacherlog/detail?tlnum=${li.tlnum }"><img src="/teacherlog/read_img?fname=${li.img1 }&tlnum=${li.tlnum }" style="width:100px"></a>
			</c:if>
			${li.tlnum }
			${li.teacherid.name }
			${li.childid.name }
			${li.childid.pname }
			${li.tdate }
			${li.activity }
			${li.health }
			<br/>
		</c:forEach>
	</div>
</c:if>

<!-- 선생님.ver list -->
<h3>특정 선생님이 쓴 일지 리스트</h3>
<c:if test="${fn:substring(sessionScope.loginId, 0, 1) eq 't'}">

	<select name="searchBar" id="searchBar">
		<option selected>--검색--</option>
		<option value="1">날짜로 검색</option>
		<option value="2">이름으로 검색</option>
	</select>

	<div id="searchDate" style="display:none">
		<input type="date" id="tdate">
		<input type="button" value="검색하기" id="search">
	</div>

	<div id="searchName" style="display:none" >
		<input type="text" id="name">
		<input type="button" value="검색하기" id="searchName">
	</div>

	<div id="tlist">
		<c:forEach var="li" items="${list }">
			${li.tlnum }
			${li.teacherid.name }
			${li.childid.name }
			${li.childid.pname }
			${li.tdate }
			${li.activity }
			${li.health }
			<c:if test="${not empty li.img1 }">
				<a href="/teacherlog/detail?tlnum=${li.tlnum }"><img src="/teacherlog/read_img?fname=${li.img1 }&tlnum=${li.tlnum }" style="width:100px"></a>
			</c:if>
			<br/>
		</c:forEach>
	</div>
</c:if>

<script>
$(document).ready(function(){
	$(document).on("change","#searchBar",function(){
		// 뭘로 검색할꺼야?
		let check = $("select[name=searchBar]").val();
		console.log(check);
		
		if(check==1){ // 날짜로 검색
			$("#searchDate").show();
			$("#searchName").hide();
		} else if (check==2){ // 아이 이름으로 검색
			$("#searchDate").hide();
			$("#searchName").show();
		}		
	});

	
	// 날짜별로 검색
	$(document).on("click","#search",function(){
		let loginId = '${sessionScope.loginId}';
		console.log(loginId.charAt(0));
		let id = '';
		let url = '';

		if(loginId.charAt(0)=='c'){
			id = 'childid';
			url = '/teacherlog/childDay';
		} else if(loginId.charAt(0)=='t'){
			id = 'teacherid';
			url = '/teacherlog/day';
		}
		console.log("id :"+id);
		console.log("url :"+url);
		
		let tdate = $("#tdate").val();
		
		let requestData = {};
	    requestData['tdate'] = tdate;
	    requestData[id] = '${sessionScope.loginId}';
		
		$.ajax({
			url : url,
			data : requestData,
			type : 'get',
			dataType : 'json',
			success : function(result){
				console.log(result);
			},
			error : function(req, status){
				console.log(status);
			}
		});
	});
	
	// 아이이름으로 검색 -> 쌤밖에 사용 안 함
	$(document).on("click","#searchName",function(){
		let name = $("#name").val();
		
		$.ajax({
			url : '/teacherlog/searchName',
			data : {'name': name, 'teacherid': '${sessionScope.loginId}'},
			type : 'get',
			dataType : 'json',
			success : function(result){
				console.log(result);
			},
			error : function(req, status){
				console.log(status);
			}
		});
	});
});
</script>
</body>
</html>