<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/teacherlogadd.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>선생님 일지 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body id="addbody">
	
	<div style="text-align:center; margin-bottom:50px"><span id="title">선생님 일지 작성</span></div>
	<div style="text-align:center">
		<div style="width:70%; display:inline-block"">
		<form action="/teacherlog/add" method="post" enctype="multipart/form-data" id="tlForm">
			<input type="hidden" id="teacherid" name="teacherid" value="${sessionScope.loginId }">
			<input type="hidden" type="text" name="childid" id="childid">
			<div id="123">
				<span class="addSpan">아이 이름</span>
				<span id="childName"></span>
				
			</div>
			<div><span class="addSpan">활동 일지</span><textarea class="form-control" name="activity" id="activity"></textarea></div>
			<div><span class="addSpan">건강 일지</span><textarea class="form-control" name="health" id="health"></textarea></div>
			<div><span class="addSpan">날짜</span><input class="form-control" type="date" name="tdate" id="tdate"></div>
			<div><span class="addSpan">이미지 첨부</span><input class="form-control" type="file" name="f[0]" id="f[0]"></div>
			<div><span class="addSpan">이미지 첨부</span><input class="form-control" type="file" name="f[1]" id="f[1]"></div>
			<div><span class="addSpan">이미지 첨부</span><input class="form-control" type="file" name="f[2]" id="f[2]"></div>
			<div><input class="btn btn-outline-dark" type="button" value="일지 작성" id="addBtn"></div>
		</form>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			var current = new Date(); // 현재 날짜
			
			// 작성 버튼
			$(document).on("click","#addBtn",function(){
				 let selectedDate = new Date($("#tdate").val()); // 선택한 날짜 가져오기
				 var form = document.getElementById("tlForm");
				 
				 if($("#childid").val() == null || $("#childid").val()==""){
					 alert("아이를 선택해주세요");
				 } else if($("#activity").val() == null || $("#activity").val()==""){
					 alert("아이 활동을 작성해주세요");
				 } else if($("#health").val() == null || $("#health").val()==""){
					 alert("아이 건강을 작성해주세요");
				 } else if($("#tdate").val() == null || $("#tdate").val()==""){
					 alert("날짜를 선택해주세요");
				 } else if(current < selectedDate){
					 alert("오늘 또는 이전의 날짜를 선택해주세요");
				 }else{	// 모든 검사 후 제출 
					 form.submit();
				 }
			});
			
			
			// 아이디에 따른 url 구분 (컨트롤러 구븐)
			let loginId = '${sessionScope.loginId}';
			let url = '';
			if(loginId.charAt(0)=='c'){
				url = '/teacherlog/childList?childid=';
			} else if(loginId.charAt(0)=='t'){
				url = '/teacherlog/list?teacherid=';
			}

			
			// 해당 선생님의 아이 list 가져오기
			$.ajax({
				url : '/teacherlog/childlist',
				data : {'teacherid' : loginId},
				dataType : 'json',
				type : 'get',
				success:function(result){
					let list = result.list;
					if(list.length == 0){
						var alertMsg= "등록되어있는 아이가 없습니다.";
						if(confirm(alertMsg)){
							window.location.href="/teacherlog/list?teacherid=${sessionScope.loginId}"; 
						}
					}
					
					// 등록되어 있다면 select에 리스트 뿌리기 
					let txt = '<select class="form-select" name="selectName" id="selectName">';
					txt += '<option value="">--아이 선택--</option>';
					for(li of list){
						txt += '<option value="' + li.childid + '">' + li.name + '</option>';
					}
					txt += '</select>';
					$("#123").append(txt);
				},
				error : function(req, status){
					console.log(status);
				}
			});
			
			// 아이 이름 선택하면 input hidden에 값 넣어주기
			$(document).on("change","#selectName",function(){
				$("#childid").val($("#selectName").val());
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>