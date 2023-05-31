<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
//	input된 파일은 readonly 속성이기 때문에 value를 임의로 건드릴 수 없음
//	따라서 초기화하고자 할 경우 아래 코드
//		img.upload.select();
//		document.selection.clear();
	 }
</script>
</head>
<body>
<h3>아이 일지 수정</h3>

<form action="/childlog/edit" method="post" enctype="multipart/form-data">

<c:if test="${not empty dto.img}">
	<img src="/childlog/read_img?fname=${dto.img }" id="upload-preview" style="width:200px;height:200px"> <br/>
	
</c:if>
<c:if test="${empty dto.img}">
	<img src="../image/nopic.jpg" id="upload-preview" style="width:200px;height:200px"> <br/>
</c:if>
<input type="file" name="f" id="imagepath" accept="image/*">
<input type="button" value="이미지삭제" id="del" onclick="imgReset();"> <br/>

날짜: ${dto.wdate} <br/>
내용: <textarea cols="20" rows="5" name="content">${dto.content }</textarea><br/>

<input type="hidden" name="childid" value="${dto.childid}">
<input type="hidden" name="chlognum" value="${dto.chlognum }">
<input type="hidden" name="tcheck" value="${dto.tcheck}">

<input type="submit" id="edit" value="수정">
<input type="button" id="cancle" value="취소" onclick="location.href='/childlog/detail?chlognum=${dto.chlognum}'">

</form>
</body>
</html>