<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/boardadd.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<title>Insert title here</title>

</head>

<body>

	<div class="board_title">
		<h3 style="font-size: calc(1.3rem + .6vw); text-align: center;">
			<span id="ti">게시판 등록 </span>
		</h3>
	</div>

	<div class="board_wrap">
		<form action="/board/add" method="post" enctype="multipart/form-data">

			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" name="title" placeholder="제목 입력">

							</dd>

						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>작성자</dt>
							<dd>${sessionScope.loginId }
								<input type="hidden" name="teacherid"
									value="${sessionScope.loginId }">
							</dd>
						</dl>
						<dl>
							<dt>이벤트날짜</dt>
							<dd>
								<input type="date" name="edate">
							</dd>
						</dl>
						<dl>
							<dt>중요</dt>
							<dd>
								<input type="checkbox" name="mgnum" value="1">
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea placeholder="내용을 입력해주세요" name="content"></textarea>
					</div>
					<div class="img">
						<dl>

							<br />
							<dd>
								<div id="imgbtn">이미지 등록을 원하시면 눌러주세요</div>
							</dd>
							<dd>
							 <input class="i" type="file" name="imgf[0]">
							</dd>
							<br />

							<dd>
								
								 <input class="i" type="file" name="imgf[1]">
							</dd>
							<br />

							<dd>
								 <input class="i" type="file" name="imgf[2]">
							</dd>
							<br />
						</dl>
					</div>
				</div>
				<div class="bt_wrap">
					<input type="submit" value="등록" class="button button2"> <a
						href="/board/list" class="button button2">취소</a>
				</div>
			</div>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			$('.i').hide();
			$('#imgbtn').click(function() {
				$('#imgbtn').hide();
				$('.i').show();
			})

		});
	</script>


</body>
</html>