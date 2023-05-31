<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style>
@font-face {
	font-family: 'KimjungchulGothic-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	color: #363636;
	font-family: "KimjungchulGothic-Bold";
}

.board_wrap {
	width: 100% px;
}

.board_title {
	margin-bottom: 30px;
	text-align: center;
}

.bt_wrap {
	margin-top: 30px;
	text-align: center;
}

.bt_wrap a {
	display: inline-block;
	min-width: 40px;
}

.bt_wrap a:first-child {
	margin-left: 0;
}

.bt_wrap a.on {
	background: #000;
	color: #fff;
}

.board_page a:first-child {
	border-left: 1px solid #ddd;
}

.board_write {
	border-top: 4px solid #A9CFE2;
	text-align: center;
}

.board_write .title, .board_write .info {
	padding: 15px;
}

.board_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 2px solid #A9CFE2;
}

.board_write .title dl {
	
}

.board_write .info dl {
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}

.board_write .title dt, .board_write .title dd, .board_write .info dt,
	.board_write .info dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 15px;
}

.board_write .title dd {
	width: calc(100% - 100px);
}

.board_write .title input[type="text"], .board_write .info input[type="text"]
	{
	padding: 10px;
	box-sizing: border-box;
}

.board_write .title input[type="text"] {
	width: 80%;
}

.board_write .cont {
	border-bottom: 2px solid #A9CFE2;
}

.info {
	display: flex;
	flex-wrap: nowrap;
	align-items: center;
	justify-content: flex-start;
	font-size: 15px;
}

.info dl {
	display: flex;
	align-items: center;
}

.info dt, .info dd {
	margin: 0;
}

.info dt {
	margin-right: 10px;
}

.info input[type="text"], .info input[type="date"], .info input[type="radio"]
	{
	margin-left: 5px;
}

.board_write .cont textarea {
	display: block;
	width: 100%;
	height: 200px;
	padding: 15px;
	/* box-sizing: border-box; */
	border: 0;
	resize: vertical;
}

.board_wrap {
	width: 100%;
	padding: 0 15px;
	box-sizing: border-box;
}

.board_write {
	margin: 0 auto;
	max-width: 1000px;
}

.board_write .title, .board_write .info {
	padding: 15px 0;
}

.board_write .info dl {
	width: 33.33%; /* Distribute the width evenly */
}

@media ( max-width : 1000px) {
	.board_write .info dl {
		width: 100%; /* Change back to 100% on smaller screens */
	}
}

@media ( max-width : 1000px) {
	.board_wrap {
		width: 100%;
		min-width: 320px;
		/* padding: 0 30px;*/
		box-sizing: border-box;
	}
	board_write .info dl {
		width: 49%;
	}
	.board_write .info dl:first-child {
		margin-right: 2%;
	}
	.board_write .title dt, .board_write .info dt {
		display: none;
	}
	.board_write .title dd, .board_write .info dd {
		width: 100%;
	}
	.board_write .info input[type="text"], .board_write .title input[type="text"]
		{
		width: 100%;
	}
}

#ti {
	background: linear-gradient(180deg, rgba(255, 255, 255, 0) 65%, #A9CFE2
		35%);
}

input[type="date"] {
	border: none;
}

input[type="text"] {
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="button"]:hover{
	background-color: #A9CFE2;
	color: white;
}

input[type="button"]{
padding: 7px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
	background-color: white;
	color: #363636;
	border: 2px solid #A9CFE2;
}


.button {
	padding: 7px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
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

img {
	width: 200px;
	height: 200px;
}

.img {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.image-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 10px;
}

.button-container {
	margin-top: 10px;
}

.modal-bg {
	display: none;
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.6);
	z-index: 999;
}

.modal-wrap {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 300px;
	height: 150px;
	background: #A9CFE2;
	z-index: 1000;
}

.form-container {
	padding-top: 25px;
	padding-left: 50px;
	padding-right: 50px;
}
</style>


<script> 

$(document).ready(function() {
	
	if (${dto.mgnum} == 1) {
		  $('#mgnumcheck').prop('checked', true); //mgnum이 1 이면 체크 표시 되어있게 하고 

		  $('#mgnumcheck').click(function() { //mgnum을 클릭했을 때 
		    if ($(this).is(':checked')) { //값이 체크면 
		      $(this).val(1); //val 을 1로 주고 
		    } else { 
		      $(this).val(0); //아니라면 0으로 줘 
		    }
		  });
		}	
	
	$('#cancel').click(function(){
		 $('#imgf').hide();
	});
	
	//수정 폼 숨기기 
    $('#imgf').hide();

    //수정버튼 누르면 해당 이미지가 몇번째 이미지인지 확인
    $(".e").click(function(){
	   	 $('#imgf').show();
        let id = $(this).attr("id");
        let num = id.substring(2);
        $('#imgnum').attr("value", num); 
        //'#imgnum'의 속성을 bnum 으로 설정       
    });
    
    //이미지 수정 버튼 누르면 ajax로 이미지 교체 go 
//  	$('#imgf').click(function(){
//  		$('#imgf').show();
// 	});
    
    
	
    //삭제버튼 누르면 
	$('.d').click(function(){
		let id = $(this).attr("id");
		let num = id.substring(2);
		location.href="/board/delimg?bnum=${dto.bnum}&imgnum="+num;
	});
	
	//취소버튼 누르면 사진 업로드 양식 사라짐 
	

});

</script>
</head>
<body>
<body>

	<!-- 제목 -->
	<div class="board_title">
		<h3 style="font-size: calc(1.3rem + .6vw); text-align: center;">
			<span id="ti">게시글 수정 </span>
		</h3>
	</div>

	<div class="board_wrap">
		<form id="f" action="/board/edit" method="post">

			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" name="title" value="${dto.title}">

							</dd>

						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>작성자</dt>
							<dd>${sessionScope.loginId }
								<input type="hidden" name="teacherid"
									value="${sessionScope.loginId }">
							</dd>
						</dl>
						<dl>
							<dt>이벤트날짜</dt>
							<dd>
								<input type="date" name="edate" value="${dto.edate }">
							</dd>
						</dl>
						<dl>
							<dt>중요</dt>
							<dd>
								<input type="checkbox" name="mgnum" value="1" id="mgnumcheck">
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea name="content">${dto.content }</textarea>
					</div>
					<input type="hidden" name="bnum" value="${dto.bnum }">

					<div class="bt_wrap">
						<input type="submit" value="수정" class="button button2" id="editc">
						<a href="/board/list" class="button button2">취소</a>
					</div>
			</form>

	<!-- 		이미지 보여주기  -->
	
		<br/>
		<br/>
		<div class="img">
				<c:choose>
				<c:when test="${empty dto.img1 && empty dto.img2 && empty dto.img3}">
						<form action="board/add" method="post" enctype="multipart/form-data">			
					<dl>
						<dd><br/>
						<br/>
							<div id="imgbtn">이미지 등록을 원하시면 눌러주세요</div>
						</dd>
						
						<dd>
							<input type="file" name="imgf[0]" class="i" value="${dto.img1 }">
						</dd>
						<br/>
						<dd>
							<input type="file" name="imgf[1]" class="i" value="${dto.img2 }">
						</dd>
						<br/>
						<dd>
							<input type="file" name="imgf[2]" class="i" value="${dto.img3 }">
						</dd>
						<br/>						
					</dl>
					<input type ="hidden" name = "bnum" value="${dto.bnum }">
					<input type ="hidden" name = "content" value="${dto.content }">
					<input type ="hidden" name = "edate" value="${dto.edate }">
					<input type ="hidden" name = "mgnum" value="${dto.mgnum }">
					<input type ="hidden" name = "wdate" value="${dto.wdate }">
					<input type ="hidden" name = "teacherid" value="${dto.teacherid }">
					<div class="bt_wrap">
						<input type="submit" value="등록" class="button button2 i">
					</div>
						</form>
				</c:when>	
				
				
				<c:otherwise>


					<c:if test="${not empty dto.img1}">
						<div class="image-container">
							<img src="/board/read_img?fname=${dto.img1}">
							<div class="button-container">
								<input type="button" class="e" id="eb1" value="수정"> <input
									type="button" class="d" id="db1" value="삭제">
							</div>
						</div>
					</c:if>

					<c:if test="${not empty dto.img2}">
						<div class="image-container">
							<img src="/board/read_img?fname=${dto.img2}">
							<div class="button-container">
								<input type="button" class="e" id="eb2" value="수정"> <input
									type="button" class="d" id="db2" value="삭제">
							</div>
						</div>
					</c:if>

					<c:if test="${not empty dto.img3}">
						<div class="image-container">
							<img src="/board/read_img?fname=${dto.img3}">
							<div class="button-container">
								<input type="button" class="e" id="eb3" value="수정"> <input
									type="button" class="d" id="db3" value="삭제">
							</div>
						</div>
					</c:if>
				</c:otherwise>
		</c:choose>	
		</div>




		<!-- 이미지 등록 폼  팝업 처리-->
		<div id="imgf" class="modal-bg">
			<div class="modal-wrap">
				<form action="/board/editimg" method="post"
					enctype="multipart/form-data">
					<div class="form-container">
						<input type="hidden" name="bnum" value="${dto.bnum }"> <input
							type="hidden" name="imgnum" id="imgnum"> <input
							type="file" name="f1"><br /><br /><br /> <input
							type="submit" class="button button2" value="등록"> <input
							type="button" class="button button2" value="취소" id="cancel">
					</div>
				</form>
			</div>
		</div>

	</div>

	<script>
		$(document).ready(function() {
			$('.i').hide();
			$('#imgbtn').click(function() {
				$('#imgbtn').hide();
				$('.i').show();
			})

		});
	</script>

</body>
</html>