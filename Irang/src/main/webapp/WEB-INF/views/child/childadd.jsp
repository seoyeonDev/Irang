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
        <h4 class="mb-3">선생님이 아이회원추가 <br/>※학부모님께 (ID,PWD,이름,반) 꼭 전달</h4>
        <form action="/child/childadd" method="post" class="validation-form" enctype="multipart/form-data" novalidate>
          <div class="row">
           <div class="col-md-6 mb-3">
              <label for="childid">아이디</label>
              <input oninput="idcheck()" type="text" class="form-control" name="childid" id="childid" placeholder="" value="" required>
              <div class="valid-feedback">
              	사용 가능한 아이디입니다.
              </div>
              <div class="invalid-feedback">
                아이디를 다시 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" id="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="pwd" id="pwd" placeholder="" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <select id="inputState" class="form-control"  name="classnum" >
            	<option selected>학급</option>
            	<c:forEach var="cl" items = "${list }">
            		<option value="<c:out value="${cl.classnum}"/>"><c:out value="${cl.classname }"/>
            	</c:forEach>
            </select>
          </div>

         
          <div class="mb-4"></div>
          <button class="btn btn-lg btn-block" type="submit">가입 완료</button>
          <a href="/child/listmyclass2"><button class="btn btn-lg btn-block" type="button">이전으로</button></a>
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