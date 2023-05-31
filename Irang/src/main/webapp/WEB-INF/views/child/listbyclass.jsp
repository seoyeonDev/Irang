<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/childlistcard.css">
</head>
<body>
<h3>${classnum }반 아이들전체 목록</h3>
<a href="/child/join">추가</a>
<a href="/child/listbyclass?classnum=1"><input type="button" value="1반" id="class_1"></a>
<a href="/child/listbyclass?classnum=2"><input type="button" value="2반" id="class_2"></a>

<form action="/child/listbyname" method="post">
<input type="text" id="name" name="name">
<input type="submit" id="namebtn" value="이름검색">
</form>

<section id="team" class="pb-5">
  <div class="container">
      <h5 class="section-title h1">원아 전체리스트</h5>
      <div class="row">
      <c:forEach var="list" items="${list }">
          <!-- Team member -->
          <div class="col-xs-12 col-sm-6 col-md-4">
              <div class="image-flip" >
                  <div class="mainflip flip-0">
                      <div class="frontside">
                          <div class="card">
                              <div class="card-body text-center">
                                  <p><img class=" img-fluid" src="/child/read_img?fname=${list.img }" alt="card image"></p>
                                  <h4 class="card-title">${list.name }</h4>
                                  <p class="card-text">생년월일: ${list.birthday }<br/>부모님 전화번호:${list.phone }<br/>아이의 반:${list.classnum.classname }반</p>
                                  <a href="https://www.fiverr.com/share/qb8D02" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                              </div>
                          </div>
                      </div>
                      <div class="backside">
                          <div class="card">
                              <div class="card-body text-center mt-4">
                                  <h4 class="card-title">${list.name }</h4>
                                  <p class="card-text">This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.This is basic card with image on top, title, description and button.</p>
                                  <ul class="list-inline">
                                      <li class="list-inline-item">
                                          <a class="social-icon text-xs-center" href="/child/childinfo?childid=${list.childid}">
                                              <i class="fa fa-facebook"></i>
                                          </a>
                                      </li>
                                      <li class="list-inline-item">
                                          <a class="social-icon text-xs-center" href="https://www.fiverr.com/share/qb8D02">
                                              <i class="fa fa-twitter"></i>
                                          </a>
                                      </li>
                                      <li class="list-inline-item">
                                          <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                              <i class="fa fa-skype"></i>
                                          </a>
                                      </li>
                                      <li class="list-inline-item">
                                          <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                              <i class="fa fa-google"></i>
                                          </a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- ./Team member -->
          </c:forEach>
      </div>
  </div>
</section>
<!-- Team -->
</body>
</html>