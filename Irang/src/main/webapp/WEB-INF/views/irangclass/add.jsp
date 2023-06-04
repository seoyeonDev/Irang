<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 추가</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/teacher.css" type="text/css">
</head>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

 <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
      <div style="text-align:center;">
        <h4 class="mb-3">클래스 추가</h4>
        </div>
        <form action="/irangclass/add" method="post" class="validation-form" novalidate>
	
          <div class="mb-3">
              <label for="teacherid">클래스 추가</label>
              <input oninput="idcheck()" type="text" class="form-control" name="classname" id="classname" placeholder="" value="" required>
              <div class="invalid-feedback">
                클래스 이름을 입력해세요.
              </div>
          </div>
                    <button class="btn btn-lg btn-block" type="submit" >클래스 추가</button>
          
         </form>
         </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; Irang</p>
    </footer>
  </div>
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