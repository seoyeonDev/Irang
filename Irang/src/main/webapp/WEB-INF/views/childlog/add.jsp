<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h3>오늘의 특이사항 (아이 일지)</h3>
<form action="/childlog/add" method="post" enctype="multipart/form-data">
	<input type="hidden" name="childid" value="${sessionScope.loginId }">
	<img src="../image/nopic.jpg" id="upload-preview" style="width:200px;height:200px"><br/>
	<input type="file" id="imagepath" name="f"><br/>
	<input type="button" value="이미지삭제" id="del" onclick="imgReset();"> <br/>
	content: <textarea cols="20" rows="5" name="content"></textarea><br/>
	<input type="submit" value="작성">
</form>

</body>
</html>