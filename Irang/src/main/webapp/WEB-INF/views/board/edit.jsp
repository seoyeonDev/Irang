<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/boardedit.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


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
						<form action="/board/addimg" method="post" enctype="multipart/form-data">			
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
					<input type ="hidden" name = "title" value="${dto.title }">
					<input type ="hidden" name = "content" value="${dto.content }">
					<input type ="hidden" name = "edate" value="${dto.edate }">
					<input type ="hidden" name = "mgnum" value="${dto.mgnum }">
					<input type ="hidden" name = "wdate" value="${dto.wdate }">
					<input type ="hidden" name = "teacherid" value="${sessionScope.loginId }">
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
							type="file" name="f1"><br/><br/><br/> <input
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