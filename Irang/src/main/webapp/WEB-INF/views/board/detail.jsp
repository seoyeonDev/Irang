<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
	width: 150px;
	height: 150px;
}
<style>
* {
	margin: 0;
	padding: 0;
	color: #363636;
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

.board_write .cont div {
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

.button {
	padding: 7px;
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