<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/childlogadd.css">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<script>
window.onload = function() {
	  document.getElementById("imagepath").addEventListener("change", function(event) {
			var file = event.target.files[0];
	  		var reader = new FileReader();
	  
			reader.onload = function(e) {
	    	document.getElementById("upload-preview").src = e.target.result;
			document.getElementById("imagepath").src = e.target.result;
	  };

	  reader.readAsDataURL(file);
	});
}
function imgReset() {
	document.getElementById('upload-preview').src = "../image/nopic.jpg";
	document.getElementById('imagepath').value = null;
	 }
</script>
</head>
<body id="chlogbody">
<div class = "chlog_title">
	<span id="title">아이 일지 작성</span>
</div>

<div class = "info" style="text-align:center">
	<div style="width:70%; display:inline-block">
		<form action="/childlog/add" method="post" enctype="multipart/form-data"  class="chlForm">
			<input type="hidden" name="childid" value="${sessionScope.loginId }">
			<div>
				<img src="../image/nopic.jpg" id="upload-preview" style="width:200px;height:200px"><br/><br/>
				<input type="file" id="imagepath" name="f">
				<input type="button" value="이미지삭제" id="del" onclick="imgReset();"> <br/>
			</div>
			<div class="cont"><textarea placeholder="내용을 입력해주세요" name="content"></textarea></div> 
			<div class="bt_wrap">
				<input class="button button2" type="submit" value="일지 작성">
				<input class="button button2"  type="button" value="작성 취소" onclick="location.href='/childlog/list?childid=${sessionScope.loginId }'">
			</div>
		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>