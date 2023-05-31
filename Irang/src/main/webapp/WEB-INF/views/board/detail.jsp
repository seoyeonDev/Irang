<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/boarddetail.css">

</head>

<body>

	<div class="board_title">
		<h3 style="font-size: calc(1.3rem + .6vw); text-align: center;">
			<span id="ti">${dto.title}</span>
		</h3>
	</div>

	<div class="board_wrap">
		<div class="board_write_wrap">
		<div class="board_write">
				<div class="info">
					<dl>
						<dt>등록일</dt>
						<dd>${dto.wdate }</dd>
					</dl>

					<dl>
						<dt>작성자</dt>
						<dd>${sessionScope.loginId }</dd>
					</dl>
					<dl>
						<dt>이벤트 날짜</dt>
						<dd>${dto.edate }</dd>
					</dl>
				</div>
				
				<div class="cont">
					<div>${dto.content }</div>
				</div>
				
				<div class="img">
					<dl>									
						<br />
						<dd>
							<c:if test="${not empty dto.img1}">
								<img src="/board/read_img?fname=${dto.img1}">
							</c:if>
							<c:if test="${not empty dto.img2}">
								<img src="/board/read_img?fname=${dto.img2}">
							</c:if>
							<c:if test="${not empty dto.img3}">
								<img src="/board/read_img?fname=${dto.img3}">
							</c:if>
							<br />
					</dl>
				</div>
			</div>
			</div>
			
			<div class="bt_wrap">
				<c:if test="${sessionScope.loginId == dto.teacherid.teacherid}">
					<a href="/board/editform?bnum=${dto.bnum}" class="button button2">수정</a>
					<a href="/board/del?bnum=${dto.bnum}" class="button button2">삭제</a>
				</c:if>
			</div>
		</div>




</body>
</html>