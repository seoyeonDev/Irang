<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>




 *{ 
   margin: 0; 
  padding: 0; 
 } 

html {
font-size :10px;
s}

a {
    text-decoration: none;
    color: inherit;
}

.board_wrap {
    width: 100%px;
}

.board_title {
    margin-bottom: 30px;
}

.bt_wrap {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.bt_wrap a {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1.4rem;
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
}

.board_write .title,
.board_write .info {
    padding: 15px;
}

.board_write .info {
    border-top: 1px dashed #ddd;
    border-bottom: 2px solid #A9CFE2;
    font-size: 0;
}

.board_write .title dl {
    font-size: 0;
}

.board_write .info dl {
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 1.4rem;
}

.board_write .title dt,
.board_write .info dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
}

.board_write .title input[type="text"],
.board_write .info input[type="text"] {

    padding: 10px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 2px solid #A9CFE2;
}

.board_write .cont textarea {
    display: block;
    width: 100%;
    height: 300px;
    padding: 15px;
   /* box-sizing: border-box; */
    border: 0;
    resize: vertical;
}

@media (max-width: 1000px) {
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

    .board_write .title dt,
    .board_write .info dt {
        display: none;
    }

    .board_write .title dd,
    .board_write .info dd {
        width: 100%;
    }
 .board_write .info input[type="text"],
    .board_write .title input[type="text"]
 {
        width: 100%;
    }
}
#ti {
	background: linear-gradient(180deg, rgba(255, 255, 255, 0) 65%, #A9CFE2
		35%);
}

</style>
</head>

<body>

	<div class="board_wrap">

	

		<form action="/board/add" method="post" enctype="multipart/form-data">

			<div class="board_write_wrap">
			
				<div class="board_title">
			<h1 style = "text-align :center;"><span id ="ti">게시판 등록</span></h1>
		</div>
			
			
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
									value="${sessionScope.loginId }" >
							</dd>
						</dl>
						<dl>
							<dt>이벤트날짜</dt>
							<dd>
								<input type="date" name="edate">
							</dd>
						</dl>
						<dl>
							<dt>공지사항으로 등록 </dt>
							<dd>
				<input type="radio" name="mgnum" value="1">
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea placeholder="내용을 입력해주세요" name="content"></textarea>
					</div>
					<div class="img">
						<dl>
							<dt>이미지</dt>
							<br/>
							<dd>
								<input type="file" name="imgf[0]">
							</dd>
						
							<dd>
								<input type="file" name="imgf[1]">
							</dd>
					
							<dd>
								<input type="file" name="imgf[2]">
							</dd>
						</dl>
					</div>
				</div>
				<div class="bt_wrap">
					<input type="submit" value="등록"> <a href="/board/list">취소</a>
				</div>
			</div>
		</form>
	</div>

</body>
</html>