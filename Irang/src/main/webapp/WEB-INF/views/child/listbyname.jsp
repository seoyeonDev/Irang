<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
<h3>클래스로 조회:</h3>

<c:forEach var="cl" items="${clist}">
  <a href="/child/listbyclass?classnum=${cl.classnum}">
    <input type="button" value="${cl.classname}" style="padding: 10px; margin: 5px; background-color: #a9cfe2; border: none; border-radius: 50px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); font-size: 14px; color: #fff; text-transform: uppercase; cursor: pointer;">
  </a>
</c:forEach>

<form action="/child/listbyname" method="post" style="text-align: right;">
<input type="text" id="name" name="name">
<input type="submit" id="namebtn" value="이름검색" style="background-color: #A9CFE2;
    color: #363636;">
</form>

<section id="team" class="pb-5">
  <div class="container">
      <h5 class="section-title h1">${name }(이)가 들어간 아이 검색결과</h5>
      <div class="row">
      <c:if test="${empty list }">
      	<h3 class="section-title h1" style="text-align: center;">${name }으로 검색된 아이가 없습니다..<br/>다시 입력해주세요</h3>
      </c:if>
      <c:if test="${not empty list }">
      <c:forEach var="list" items="${list }">
          <!-- Team member -->
          <div class="col-xs-12 col-sm-6 col-md-4">
              <div class="image-flip" >
                  <div class="mainflip flip-0">
                      <div class="frontside">
                          <div class="card">
                              <div class="card-body text-center">
                                  <p><img class="img-fluid" src="/child/read_img?fname=${list.img}" alt="../image/nopic.jpg" onerror="this.onerror=null; this.src='../image/nopic.jpg';"></p>
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
                                  <p class="card-text text-xs-center">---------------------------------<br/>아이계정ID: ${list.childid} <br/>※※(필독) 알러지사항: ${list.allergy }※※</p>
                                  <ul class="list-inline">
                                      <li class="list-inline-item">
                                          <a class="social-icon text-xs-center" href="/child/childinfo?childid=${list.childid}">
                                              <i class="fa fa-user-circle">상세정보</i>
                                          </a>
                                      </li>
                                      <li class="list-inline-item">
                                          <a class="social-icon text-xs-center" href="/childlog/list?childid=${list.childid}">
                                              <i class="fa fa-list-alt">일지</i>
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
          </c:if>
      </div>
  </div>
</section>
<!-- Team -->
</body>
</html>