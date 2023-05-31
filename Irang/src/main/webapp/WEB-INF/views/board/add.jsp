<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<title>Insert title here</title>
<style>
@font-face {
	font-family: 'KimjungchulGothic-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	color: #363636;
		font-family: "KimjungchulGothic-Bold";
	
}

.board_wrap {
	width: 100% px;
}

.board_title {
	margin-bottom: 30px;
	text-align: center;
}

.bt_wrap {
	margin-top: 30px;
	text-align: center;
}

.bt_wrap a {
	display: inline-block;
	min-width: 40px;
}

.bt_wrap a:first-child {
	margin-left: 0;
}

.bt_wrap a.on {
	background: #000;
	color: #fff;
}

.board_page a:first-child {
	border-left: 1px solid #ddd;
}

.board_write {
	border-top: 4px solid #A9CFE2;
	text-align: center;
}

.board_write .title, .board_write .info {
	padding: 15px;
}

.board_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 2px solid #A9CFE2;
}

.board_write .title dl {
	
}

.board_write .info dl {
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}

.board_write .title dt, .board_write .title dd, .board_write .info dt,
	.board_write .info dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 15px;
}

.board_write .title dd {
	width: calc(100% - 100px);
}

.board_write .title input[type="text"], .board_write .info input[type="text"]
	{
	padding: 10px;
	box-sizing: border-box;
}

.board_write .title input[type="text"] {
	width: 80%;
}

.board_write .cont {
	border-bottom: 2px solid #A9CFE2;
}

.info {
	display: flex;
	flex-wrap: nowrap;
	align-items: center;
	justify-content: flex-start;
	font-size: 15px;
}

.info dl {
	display: flex;
	align-items: center;
}

.info dt, .info dd {
	margin: 0;
}

.info dt {
	margin-right: 10px;
}

.info input[type="text"], .info input[type="date"], .info input[type="radio"]
	{
	margin-left: 5px;
}

.board_write .cont textarea {
	display: block;
	width: 100%;
	height: 200px;
	padding: 15px;
	/* box-sizing: border-box; */
	border: 0;
	resize: vertical;
}

.board_wrap {
	width: 100%;
	padding: 0 15px;
	box-sizing: border-box;
}

.board_write {
	margin: 0 auto;
	max-width: 1000px;
}

.board_write .title, .board_write .info {
	padding: 15px 0;
}

.board_write .info dl {
	width: 33.33%; /* Distribute the width evenly */
}

@media ( max-width : 1000px) {
	.board_write .info dl {
		width: 100%; /* Change back to 100% on smaller screens */
	}
}

@media ( max-width : 1000px) {
	.board_wrap {
		width: 100%;
		min-width: 320px;
		/* padding: 0 30px;*/
		box-sizing: border-box;
	}
	board_write .info dl {
		width: 49%;
	}
	.board_write .info dl:first-child {
		margin-right: 2%;
	}
	.board_write .title dt, .board_write .info dt {
		display: none;
	}
	.board_write .title dd, .board_write .info dd {
		width: 100%;
	}
	.board_write .info input[type="text"], .board_write .title input[type="text"]
		{
		width: 100%;
	}
}

#ti {
	background: linear-gradient(180deg, rgba(255, 255, 255, 0) 65%, #A9CFE2
		35%);
}
input[type="date"]{
border: none;
}

input[type="text"] {
	border: 1px solid #ccc;
	border-radius: 5px;
}

.button {
	padding: 7px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
}
.button2 {
	background-color: white;
	color: #363636;
	border: 2px solid #A9CFE2;
}

.button2:hover {
	background-color: #A9CFE2;
	color: white;
}


</style>
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
								<input type="file" name="imgf[0]" class="i">
							</dd>
							<br />

							<dd>
								<input type="file" name="imgf[1]" class="i">
							</dd>
							<br />

							<dd>
								<input type="file" name="imgf[2]" class="i">
							</dd>
							<br />
						</dl>
					</div>
				</div>
				<div class="bt_wrap">
			<input type="submit" value="등록" class="button button2">
				<a href="/board/list" class="button button2">취소</a>
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