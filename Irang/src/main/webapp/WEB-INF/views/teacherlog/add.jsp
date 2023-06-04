<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
@font-face {
    font-family: 'KimjungchulGothic-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
#addbody{
	font-family: 'KimjungchulGothic-Bold';
}
#tlList:hover{
	color:#A9CFE2;
}
#tlForm div{
	padding : 10px 10px;
}
#title{
	background: linear-gradient(180deg, rgba(255, 255, 255, 0) 65%, #A9CFE2 35%);
}

</style>
</head>
<body id="addbody">
	
	<h3 style="text-align:center"><span id="title">선생님 일지 작성</span></h3>
	<div style="text-align:center">
		<div style="width:70%; display:inline-block"">
		<form action="/teacherlog/add" method="post" enctype="multipart/form-data" id="tlForm">
			<input type="hidden" name="teacherid" value="${sessionScope.loginId }">
			<input type="hidden" type="text" name="childid" id="childid">
			<div id="123">
				<span class="addSpan">아이 이름</span>
				<span id="childName"></span>
				
			</div>
			<div><span class="addSpan">활동 일지</span><textarea class="form-control" name="activity"></textarea></div>
			<div><span class="addSpan">건강 일지</span><textarea class="form-control" name="health"></textarea></div>
			<div><span class="addSpan">날짜</span><input class="form-control" type="date" name="tdate"></div>
			<div><span class="addSpan">이미지 첨부</span><input class="form-control" type="file" name="f[0]"></div>
			<div><span class="addSpan">이미지 첨부</span><input class="form-control" type="file" name="f[1]"></div>
			<div><span class="addSpan">이미지 첨부</span><input class="form-control" type="file" name="f[2]"></div>
			<div><input class="btn btn-outline-dark" type="button" value="일지 작성"></div>
		</form>
		</div>
	</div>
	
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
			
			$.ajax({
				url : '/teacherlog/childlist',
				data : {'teacherid' : loginId},
				dataType : 'json',
				type : 'get',
				success:function(result){
					console.log(result.list);
					let list = result.list;
					if(list.length > 0){
						
					}
					let txt = '<select class="form-select" name="selectName" id="selectName">';
					txt += '<option value="">--아이 선택--</option>';
					for(li of list){
						txt += '<option value="' + li.childid + '">' + li.name + '</option>';
					}
					txt += '</select>';
					console.log(txt);
					$("#123").append(txt);
				},
				error : function(req, status){
					console.log(status);
				}
			});
			
			console.log("처음으로 선택된 값 :" + $("#selectName").val());
			
			$(document).on("change","#selectName",function(){
				console.log($("#selectName").val());
				$("#childid").val($("#selectName").val());
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>