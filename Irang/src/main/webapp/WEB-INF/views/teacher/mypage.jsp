<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>마이페이지</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/css/teacher.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
// 		let ptpwd = prompt('비밀번호를 입력하세요');
// 		if (ptpwd != ${dto.pwd }){
// 			alert('비밀번호가 일치하지 않습니다');
// 			location.href = '/teacher/list';
// 		}
		$(".profileD").click(function(){
			let teacherid = $(this).attr("teacherid");
			location.href="/teacher/delprofile?teacherid=${dto.teacherid}";
			
		});
			
		})
		
</script>

</head>

<body>

  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <span class="title">회원가입</span>
        <div class="d-flex justify-content-center">
			<form action="/teacher/editprofile" method="post" enctype="multipart/form-data">
					<input type="file" name="f">
					<input type="hidden" name="teacherid" value="${dto.teacherid }" required>
					<input type="submit" value="이미지 수정">
			</form>
			<input type="button" class="profileD" id="pd" value="삭제">
			</div>
        <form action="/teacher/edit" method="post" class="validation-form" novalidate>
        <div class="mb-3 profile">
            <label for="profile">프로필사진</label>
            <c:if test="${not empty dto.profile }">
            	<img src="/teacher/read_img?fname=${dto.profile }" alt="../image/nopic.jpg" onerror="this.onerror=null; this.src='../image/nopic.jpg';">
            </c:if>
            <c:if test="${empty dto.profile}">
				프로필 사진을 등록해주세요.
			</c:if>
			
        </div>
          <div class="row">
           <div class="col-md-6 mb-3">
          
              <label for="teacherid">아이디</label>
              <input oninput="idcheck()" type="text" class="form-control" name="teacherid" id="teacherid" placeholder="" value="${dto.teacherid }" readonly required>
         	
            </div>
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" id="name" placeholder="${dto.name }" value="${dto.name }" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
           
          </div>
		<br> * 선생님 아이디는 식별을 위해 앞에 t가 붙습니다. 실제 로그인과는 상관없습니다.
          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="pwd" id="pwd" placeholder="" value="${dto.pwd }" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="phone">전화번호</label>
<%--             <input type="hidden" name="phone" value="${dto.phone }">  --%>
            <input type="tel" class="form-control" name="phone" id="phone" placeholder="${dto.phone }" value="${dto.phone}" required>
            <div class="invalid-feedback">
              전화번호를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <select id="inputState" class="form-control" name="classnum">
            	<c:forEach var="cl" items = "${list }">
            		<option value="<c:out value="${cl.classnum}"/>" <c:if test="${cl.classnum == li.classnum.classnum}"> selected </c:if>><c:out value="${cl.classname }"  />
            	</c:forEach>
            </select>
          </div>

         
          <div class="mb-4"></div>

          <button class="btn btn-lg btn-block editbtn" type="submit"  >내 정보 수정하기 </button>
        </form>
        <div class="row">
        <div class="col-md-6 mb-3">
          <a href="/teacher/logout"><button class="btn btn-lg btn-block"  ">로그아웃</button></a>
          </div>
          <div class="col-md-6 mb-3">
          <a href="/teacher/delete?teacherid=${dto.teacherid }"><button class="btn btn-lg btn-block"  >탈퇴 </button></a>
      		</div>
      		</div>
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