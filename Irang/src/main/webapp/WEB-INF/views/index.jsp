<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
  <header>
    <div class="logo">
      <h1>로고</h1>
    </div>
    <nav>
      <ul class="menu">
      <h2> 게시판 </h2>
        <li><a href="/board/list">보드리스트</a></li>
        <li><a href="/board/add">보드추가</a></li>
        
      <h2>혜원이꺼</h2>
      <li> <a href="/teacherlog/add">선생님 일지 추가</a></li>
 <li><a href="/teacherlog/list">선생님 일지 리스트</a></li>
 
 <h2>서연이꺼</h2>
 <li><a href="/irangclass/list">클래스 리스트</a></li>
<li><a href="/teacher/list">티쳐 리스트</a></li>
 
 
      </ul>
    </nav>
  </header>

  <div class="content">
    <h1>제목</h1>
    <p>내용을 추가하세요.</p>
    <jsp:include page="${bodyview }"/>
  </div>
</body>
</html>