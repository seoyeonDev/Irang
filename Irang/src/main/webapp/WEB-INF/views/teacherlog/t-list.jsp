<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
/* 	width:90%; */
	color : #363636;
}
.content{
	display: inline-block;
    width: 200px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.actSpan{
	display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    width:100%;
}

.tlA{
	text-decoration:none;
	color : black;
}
.tlA hover{
	color:#A9CFE2;
}

#title{
	background: linear-gradient(180deg, rgba(255, 255, 255, 0) 65%, #A9CFE2 35%);
}
#searchDiv{
	float: left;
 	padding-left:10px;
 	padding-right:10px;
}
.sInput{
	float: left;
 	margin-left:10px;
 	margin-right:10px;
}
.sBtn{
	float: left;
	display:inline-block;
	margin-left:10px;
 	margin-right:10px;
}
#search, #searchBtn {
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

#search:hover, #searchBtn:hover {
	background-color: white;
	color: #363636;
	border: 2px solid #A9CFE2;
}

#sDiv{
	display: flex;
  	justify-content: center;
  	align-items: center;
  	margin-bottom:35px;
}
#tList{
	margin-bottom:40px;
}
#searchBar{
	margin-bottom:7px;
}

</style>
</head>
<body id="tlistbody">

<!-- 보호자.ver list -->
<h3 style="text-align:center; margin-bottom:60px"><span id="title">선생님 일지 목록</span></h3>
<c:if test="${fn:substring(sessionScope.loginId, 0, 1) eq 'c'}">
	<div id="sDiv">
		<div id="searchDiv">
			<select name="searchBar" id="searchBar">
				<option selected>--검색--</option>
				<option value="1">특정 날짜로 검색</option>
				<option value="3">월별로 검색</option>
			</select>
		</div>	
		<div id="searchDate" style="display:none" >
			<input class="sInput" type="date" id="tdate">
			<input class="sBtn" type="button" value="검색하기" id="search">
		</div>
		<div id="searchMonth" style="display:none" >
			<input class="sInput" type="month" id="tmonth">
			<input class="sBtn" type="button" value="검색하기" id="searchMonthBtn">
		</div>
	</div>
	
	<div id="tlist">
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="li" items="${list }">
				<div class="col">
    				<div class="card h-100">
				
						<c:if test="${not empty li.img1 }">
							<a href="/teacherlog/detail?tlnum=${li.tlnum }"><img  class="card-img-top" src="/teacherlog/read_img?fname=${li.img1 }&tlnum=${li.tlnum }"></a>
						</c:if>
						<div class="card-body">
       						<h5 class="card-title">${li.tdate }</h5>
       						<p class="card-text">
       						 	${li.teacherid.name }<br/>
       					 		<span class="actSpan">${li.activity }</span>
       						</p>
						</div>
					</div>
				</div>
			<br/>
		</c:forEach>
		</div>
	</div>
</c:if>

<!-- 선생님.ver list -->

<c:if test="${fn:substring(sessionScope.loginId, 0, 1) eq 't'}">
		<div id="sDiv">
			<div id="searchDiv">
			<select name="searchBar" id="searchBar">
				<option selected>--검색--</option>
				<option value="2">이름으로 검색</option>
				<option value="1">특정 날짜로 검색</option>
				<option value="3">월별로 검색</option>
			</select>
			</div>

			<div id="searchDate" style="display:none" >
				<input class="sInput" type="date" id="tdate">
				<input class="sBtn" type="button" value="검색하기" id="search">
			</div>

			<div id="searchName" style="display:none" >
				<input class="sInput" type="text" id="name">
				<input class="sBtn" type="button" value="검색하기" id="searchBtn">
			</div>
		
			<div id="searchMonth" style="display:none" >
				<input class="sInput" type="month" id="tmonth">
				<input class="sBtn" type="button" value="검색하기" id="searchMonthBtn">
			</div>
		</div>

	<div id="tlist" style="text-align:center">
		<table class="table table-hover">
			<tr><th>번호</th><th>아이 이름</th><th>날짜</th><th>활동</th><th>건강</th></tr>
		<c:forEach var="li" items="${list }">
			<tr>
				<td><a class="tlA" href="/teacherlog/detail?tlnum=${li.tlnum }">${li.tlnum }</a></td>
				<td><a class="tlA" href="/teacherlog/detail?tlnum=${li.tlnum }">${li.childid.name }</a></td>
				<td><a class="tlA" href="/teacherlog/detail?tlnum=${li.tlnum }">${li.tdate }</a></td>
				<td><a class="tlA" href="/teacherlog/detail?tlnum=${li.tlnum }"><span class="content">${li.activity }</span></a></td>
				<td><a class="tlA" href="/teacherlog/detail?tlnum=${li.tlnum }"><span class="content">${li.health }</span></a></td>
			</tr>
		</c:forEach>
		</table>
	</div>
</c:if>

<script>
$(document).ready(function(){
	$(document).on("change","#searchBar",function(){
		// 뭘로 검색할꺼야?
		let check = $("select[name=searchBar]").val();
		console.log(check);
		console.log(check);
		
		if(check==1){ // 날짜로 검색
			$("#searchDate").show();
			$("#searchName").hide();
			$("#searchMonth").hide();
		} else if (check==2){ // 아이 이름으로 검색
			$("#searchDate").hide();
			$("#searchName").show();
			$("#searchMonth").hide();
		} else if (check==3){ // 월별로 검색
			$("#searchDate").hide();
			$("#searchName").hide();
			$("#searchMonth").show();
		}		
	});

	
	// 날짜별로 검색
	$(document).on("click","#search",function(){
		let loginId = '${sessionScope.loginId}';
		console.log(loginId.charAt(0));
		let id = '';
		let url = '';
		let flag = true; // teacher면 true, child면 false

		if(loginId.charAt(0)=='c'){
			id = 'childid';
			url = '/teacherlog/childDay';
			flag = false;
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
				let list = result.list;
				if(flag){
					if(result.list.length>0){ // 목록 띄워주기
						let txt = '<table class="table table-hover">';
						txt += '<tr><th>번호</th><th>아이 이름</th><th>날짜</th><th>활동</th><th>건강</th></tr>';
						for(li of list){
							txt += '<tr>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '">' + li.tlnum + '</a></td>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '">' + li.childid.name + '</a></td>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '">' + li.tdate + '</a></td>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '"><span class="content">' + li.activity + '</span></a></td>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '"><span class="content">' + li.health + '</span></a></td>';
							txt += '</tr>';
						}					
						txt += '</table>';
						$("#tlist").html(txt);
					} else{
						// 검색한 결과가 없습니다.
						$("#tlist").text("검색 결과가 없습니다.");
					}
				}else{
					// 보호자 로그인으로 검색했을 때 보여줄 결과
					if(result.list.length>0){
						let txt = '<div class="row row-cols-1 row-cols-md-3 g-4">';
						for(li of list){
							txt += '<div class="col">';
							txt += '<div class="card h-100">';
							if(li.img1 != null){ // 사진 보여주기
								txt += '<a href="/teacherlog/detail?tlnum=' + li.tlnum + '"><img  class="card-img-top" src="/teacherlog/read_img?fname=' + li.img1 + '&tlnum=' + li.tlnum + '"></a>';
							} else {	// 기본 이미지 보여주기 
								
							}
							txt += '<div class="card-body">';
							txt += ' <h5 class="card-title">' + li.tdate + '</h5>';
							txt += ' <p class="card-text">';
							txt += li.teacherid.name + '<br/><span class="actSpan">' + li.activity + '</span></p></div></div></div>';
						}
						txt += '</div>';
						$("#tlist").html(txt);
					} else{
						$("#tlist").text("검색 결과가 없습니다.");
					}
						
				}
			},
			error : function(req, status){
				console.log(status);
			}
		});
	});
	
	// 아이이름으로 검색 -> 쌤밖에 사용 안 함
	$(document).on("click","#searchBtn",function(){
		let name = $("#name").val();
		
		$.ajax({
			url : '/teacherlog/searchName',
			data : {'name': name, 'teacherid': '${sessionScope.loginId}'},
			type : 'get',
			dataType : 'json',
			success : function(result){
				console.log(result.list.length);
				let list = result.list;
				if(result.list.length>0){ // 목록 띄워주기
					let txt = '<table class="table table-hover">';
					txt += '<tr><th>번호</th><th>아이 이름</th><th>날짜</th><th>활동</th><th>건강</th></tr>';
					for(li of list){
						txt += '<tr>';
						txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '">' + li.tlnum + '</a></td>';
						txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '">' + li.childid.name + '</a></td>';
						txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '">' + li.tdate + '</a></td>';
						txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '"><span class="content">' + li.activity + '</span></a></td>';
						txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '"><span class="content">' + li.health + '</span></a></td>';
						txt += '</tr>';
					}					
					txt += '</table>';
					$("#tlist").html(txt);
				} else{
					// 검색한 결과가 없습니다.
					$("#tlist").text("검색 결과가 없습니다.");
				}
			},
			error : function(req, status){
				console.log(status);
			}
		});
	});
	
	$(document).on("click", "#searchMonthBtn", function(){
		let loginId = '${sessionScope.loginId}';
		console.log(loginId.charAt(0));
		let id = '';
		let url = '';
		let flag = true; // teacher면 true, child면 false

		if(loginId.charAt(0)=='c'){
			id = 'childid';
			url = '/teacherlog/childMonth';
			flag = false;
		} else if(loginId.charAt(0)=='t'){
			id = 'teacherid';
			url = '/teacherlog/month';
		}
		
		let tmonth = $("#tmonth").val();
		// 추가
		var year = parseInt(tmonth.split("-")[0]);
		var month = parseInt(tmonth.split("-")[1]);
		var lastDay = new Date(year, month, 0).getDate();
		console.log("마지막날 : "+lastDay);
		// 추가
		
		let requestData = {};
	    requestData['start'] = tmonth + "-01";
	    requestData['end'] = tmonth + "-" + lastDay;
	    requestData[id] = '${sessionScope.loginId}';
	    console.log("requestData");
	    console.log(requestData);
	    
	    $.ajax({
			url : url,
			data : requestData,
			type : 'get',
			dataType : 'json',
			success : function(result){
				let list = result.list;
				if(flag){
					if(result.list.length>0){ // 목록 띄워주기
						let txt = '<table class="table table-hover">';
						txt += '<tr><th>번호</th><th>아이 이름</th><th>날짜</th><th>활동</th><th>건강</th></tr>';
						for(li of list){
							txt += '<tr>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '">' + li.tlnum + '</a></td>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '">' + li.childid.name + '</a></td>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '">' + li.tdate + '</a></td>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '"><span class="content">' + li.activity + '</span></a></td>';
							txt += '<td><a class="tlA" href="/teacherlog/detail?tlnum=' + li.tlnum + '"><span class="content">' + li.health + '</span></a></td>';
							txt += '</tr>';
						}					
						txt += '</table>';
						$("#tlist").html(txt);
					} else{
						// 검색한 결과가 없습니다.
						$("#tlist").text("검색 결과가 없습니다.");
					}
				}else{
					// 보호자 로그인으로 검색했을 때 보여줄 결과
					if(result.list.length>0){
						let txt = '<div class="row row-cols-1 row-cols-md-3 g-4">';
						for(li of list){
							txt += '<div class="col">';
							txt += '<div class="card h-100">';
							if(li.img1 != null){ // 사진 보여주기
								txt += '<a href="/teacherlog/detail?tlnum=' + li.tlnum + '"><img  class="card-img-top" src="/teacherlog/read_img?fname=' + li.img1 + '&tlnum=' + li.tlnum + '"></a>';
							} else {	// 기본 이미지 보여주기 
								
							}
							txt += '<div class="card-body">';
							txt += ' <h5 class="card-title">' + li.tdate + '</h5>';
							txt += ' <p class="card-text">';
							txt += li.teacherid.name + '<br/><span class="actSpan">' + li.activity + '</span></p></div></div></div>';
						}
						txt += '</div>';
						$("#tlist").html(txt);
					} else{
						$("#tlist").text("검색 결과가 없습니다.");
					}
						
				}
			},
			error : function(req, status){
				console.log(status);
			}
		});
	});
});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>