<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/childlogadd.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
<body  id="chlogbody">
<div class = "chlog_title">
	<span id="title">${dto.wdate} 일지 수정</span>
</div>

<div class = "info" style="text-align:center">
<div style="width:70%; display:inline-block">
<form action="/childlog/edit" method="post" enctype="multipart/form-data"  class="chlForm">

<div>
<c:if test="${not empty dto.img}">
	<img src="/childlog/read_img?fname=${dto.img }" id="upload-preview" style="width:200px;height:200px"> <br/>
	
</c:if>
<c:if test="${empty dto.img}">
	<img src="../image/nopic.jpg" id="upload-preview" style="width:200px;height:200px"><br/><br/>
</c:if>
<input type="file" name="f" id="imagepath" accept="image/*">
<input type="button" value="이미지삭제" id="del" onclick="imgReset();"> <br/>
</div>

<div class="cont"><textarea cols="20" rows="5" name="content">${dto.content }</textarea></div>

<input type="hidden" name="childid" value="${dto.childid}">
<input type="hidden" name="chlognum" value="${dto.chlognum }">
<input type="hidden" name="tcheck" value="${dto.tcheck}">

<div class="bt_wrap">
<input class="button button2" type="submit" value="일지 수정">
<input class="button button2"  type="button" value="수정 취소" onclick="location.href='/childlog/detail?chlognum=${dto.chlognum}'">
</div>

</form>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>