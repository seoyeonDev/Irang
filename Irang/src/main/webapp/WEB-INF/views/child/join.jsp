<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 화면 샘플 - Bootstrap</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/css/teacher.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function idcheck(){
	let childid = $('#childid').val();
	$.ajax({
		url:'/child/idcheck',
		data:{childid:childid},
		success:function(cnt){
			if( cnt ==0){
				$('.valid-feedback').css("display","inline-block");
				$('.invalid-feedback').css("display","none");
			}else{
				$('.invalid-feedback').css("display","inline-block");
				$('.valid-feedback').css("display","none");

			}
		},
        error:function(){
            alert("에러입니다");
        }
	})
}

</script>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">정보 추가 입력</h4>
        <form action="/child/join" method="post" class="validation-form" enctype="multipart/form-data" novalidate>
        <div class="mb-3">
            <label for="profile">프로필사진</label>
            <input type="file" class="form-control" name="f" id="pwd" placeholder="">
          </div>
          <div class="row">
           <div class="col-md-6 mb-3">
              <label for="childid">아이디</label>
              <input oninput="idcheck()" type="text" class="form-control" name="childid" id="childid" placeholder="" value="${dto2.childid }" required>
              <div class="valid-feedback">
              	사용 가능한 아이디입니다.
              </div>
              <div class="invalid-feedback">
                아이디를 다시 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" id="name" placeholder="" value="${dto2.name }" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="name">부모님이름</label>
              <input type="text" class="form-control" name="pname" id="pname" placeholder="" value="">
              <div class="invalid-feedback">
                부모님이름을 입력해주세요.
              </div>
            </div>
           
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="pwd" id="pwd" value="${dto2.pwd }" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="phone">전화번호</label>
            <input type="tel" class="form-control" name="phone" id="phone" placeholder="">
            <div class="invalid-feedback">
              전화번호를 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="phone">알러지정보</label>
            <input type="text" class="form-control" name="allergy" id="allergy" placeholder="">
            <div class="invalid-feedback">
              주의해야할 아이의 알러지를 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="phone">생년월일(YYYY-MM-DD)</label>
            <input type="text" class="form-control" name="birthday" id="birthday" placeholder="">
            <div class="invalid-feedback">
              아이의 출생년월일을 입력해주세요(YYYY-MM-DD).
            </div>
          </div>

          <div class="mb-3">
            <label for="phone">배정된 학급: ${dto2.classnum.classname }</label>
            <input type="text" class="form-control" name="classnum" id="classnum" value="${dto2.classnum.classnum }" placeholder="">
            <div class="invalid-feedback">
            </div>
          </div>

         
          <div class="mb-4"></div>
          <button class="btn btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2021 YD</p>
    </footer>
  </div>
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
  </script>
</body>

</html>