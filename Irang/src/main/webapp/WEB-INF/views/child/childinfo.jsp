<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#imgf').hide();
		
		$('#eb').click(function(){
			$('#imgf').show();
		})
		
		$('#delbtn').click(function(event) {
		    event.preventDefault(); // 기본 링크 동작 방지
		    
		    var deleteUrl = $(this).data('delete-url');
		    var confirmed = confirm("Are you sure you want to delete this data?"); // 프롬프트 창으로 확인 메시지 표시
		    
		    if (confirmed) {
		      window.location.href = deleteUrl; // 예를 선택한 경우 링크로 이동하여 데이터 삭제
		    }
		 });
		
	});
</script>
<style>
@font-face {
	font-family: 'KimjungchulGothic-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}
body {
  padding: 20px;
}

.container {
  max-width: 500px;
  margin: 0 auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}

h1 {
  text-align: center;
  margin-bottom: 20px;
}

label {
  font-weight: bold;
}

input[type="text"],
input[type="password"],
input[type="number"] {
  width: 100%;
  padding: 8px;
  margin-bottom: 10px;
  border-radius: 3px;
  border: 1px solid #ccc;
}

img {
  max-width: 200px;
  margin-bottom: 20px;
}
</style>
</head>
<body>
  <div class="container">
    <h1>내 정보 보기</h1>
    <form action="/child/edit" method="post" enctype="multipart/form-data">
      <label for="childid">아이계정 ID:</label>
      <input type="text" value="${dto.childid }" id="childid" name="childid" readonly><br/>

      <label for="pwd">아이계정 비밀번호:</label>
      <input type="password" value="${dto.pwd}" id="pwd" name="pwd" readonly><br/>

      <label for="name">아이 이름:</label>
      <input type="text" value="${dto.name}" id="name" name="name" readonly><br/>

      <label for="pname">부모님 성함:</label>
      <input type="text" value="${dto.pname}" id="pname" name="pname" readonly><br/>

      <label for="birthday">아이의 생년월일:</label>
      <input type="text" value="${dto.birthday}" id="birthday" name="birthday" readonly><br/>

      <label for="phone">아이 부모 전화번호:</label>
      <input type="text" value="${dto.phone}" id="phone" name="phone"><br/>

      <label for="allergy">아이의 알러지 정보:</label>
      <input type="text" value="${dto.allergy}" id="allergy" name="allergy"><br/>

      <label for="classnum">아이의 반명: ${dto.classnum.classname }반</label>
      <input type="number" value="${dto.classnum.classnum}" id="classnum" name="classnum">
	<button type="submit">아이정보수정</button>
	<input type="button" value="아이계정 삭제" id="delbtn" data-delete-url="/child/out?id=${dto.childid }">
    </form>
      <p>아이계정 사진:</p>
      <img src="/child/read_img?fname=${dto.img}" name="f" style="width:200px; height:200px">
      <input type="button" value="사진수정" id="eb">
      <div id="imgf">
				<form action="/child/editimg" method="post"
					enctype="multipart/form-data">
					<input type="file" name="f1"><br /> 
					<input type="hidden" name="childid" value="${dto.childid }"> 
					<input type="submit" value="이미지 수정"> 
					<input type="button" value="취소" id="cancel">
				</form>
			</div>
  </div>
</body>
</html>