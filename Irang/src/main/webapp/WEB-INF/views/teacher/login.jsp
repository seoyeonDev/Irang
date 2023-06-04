<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/css/teacher.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script>

</script>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
      <div style="text-align:center;">
        <h4 class="mb-3">선생님 로그인</h4>
        </div>
        <form action="/teacher/login" method="post" class="validation-form" novalidate>

          <div class="mb-3">
              <label for="teacherid">아이디</label>
              <input oninput="idcheck()" type="text" class="form-control" name="teacherid" id="teacherid" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="pwd" id="pwd" placeholder="" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>
			<p style="color: red">${msg }</p>
          <div class="mb-4"></div>
          <button class="btn btn-lg btn-block" type="submit" >로그인</button>
        </form>
       <a href="/teacher/join"> <button class="btn btn-lg btn-block" type="submit">회원가입</button></a>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; Irang</p>
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