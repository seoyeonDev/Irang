<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'KimjungchulGothic-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
#tdetail{
	 font-family: 'KimjungchulGothic-Bold';
}
.detailimg{
	width:200px;
}
.me{
	background-color:#fcedaa;
}
.other{
	background-color:#a9cfe2;
}
</style>
</head>
<body id="tdetail">

<!-- 선생님.ver detail -->
<c:if test="${fn:substring(sessionScope.loginId, 0, 1) eq 't'}">
	<div id="img1">
		<div id="image1">
 			<!-- 이미지가 있으면 보여줄거고 없으면 추가 버튼을 보여주기 -->
			<c:if test="${not empty vo.img1 }">
				<img class="detailimg" id="detailimg1" src="/teacherlog/read_img?fname=${vo.img1 }&tlnum=${vo.tlnum }">
			</c:if>
		</div>
		<input type="button" value="수정" class="add" id="add1">
		<input type="button" value="삭제" class="delImg" id="del1">
	</div>
	<div id="img2">
		<div id="image2">
			<c:if test="${not empty vo.img2 }">
				<img class="detailimg" id="detailimg2" src="/teacherlog/read_img?fname=${vo.img2 }&tlnum=${vo.tlnum }">
			</c:if>
		</div>
		<input type="button" value="수정" class="add" id="add2">
		<input type="button" value="삭제" class="delImg" id="del2">
		
	</div>
	<div id="img3">
		<div id="image3">
			<c:if test="${not empty vo.img3 }">
				<img class="detailimg" id="detailimg3" src="/teacherlog/read_img?fname=${vo.img3 }&tlnum=${vo.tlnum }">
			</c:if>
		</div>
		<input type="button" value="수정" class="add" id="add3">
		<input type="button" value="삭제" class="delImg" id="del3">
		
	</div>
	
	<div>${vo.tlnum }</div>
	<div>${vo.teacherid.name }</div>
	<div>${vo.tdate }</div>
	<div><textarea id="activity">${vo.activity }</textarea></div>
	<div><textarea id="health"> ${vo.health }</textarea></div>
	<div>
		<input type="button" value="수정하기" id="tEditBtn">
		<input type="button" value="삭제하기" id="tDelBtn">
	</div>
	
	<br/><br/>참고용<br/>
	<div>${vo.teacherid.teacherid }</div>
	<div>${vo.childid.name }</div>
</c:if>


<!-- 보호자.ver detail -->
<c:if test="${fn:substring(sessionScope.loginId, 0, 1) eq 'c'}">
	<div id="img1">
 		<!-- 이미지가 있으면 보여줄거고 없으면 추가 버튼을 보여주기 -->
		<c:if test="${not empty vo.img1 }">
			<img class="detailimg" src="/teacherlog/read_img?fname=${vo.img1 }&tlnum=${vo.tlnum }">
		</c:if>
	</div>
	<div id="img2">
		<c:if test="${not empty vo.img2 }">
			<img class="detailimg" src="/teacherlog/read_img?fname=${vo.img2 }&tlnum=${vo.tlnum }">
		</c:if>
	</div>
	<div id="img3">
		<c:if test="${not empty vo.img3 }">
			<img class="detailimg" src="/teacherlog/read_img?fname=${vo.img3 }&tlnum=${vo.tlnum }">
		</c:if>
	</div>
	<div>${vo.tlnum }</div>
	<div>${vo.teacherid.name }</div>
	<div>${vo.tdate }</div>
	<div>${vo.activity }</div>
	<div>${vo.health }</div>
</c:if>
	
	
	
	<h3>댓글 작성하기</h3>
	댓글 <textarea rows="10" cols="30" id="content">댓글 작성하기</textarea>
	<input type="button" value="댓글 작성" id="cBtn">
	
	<h3>댓글 리스트</h3>
	<div id="clist">
		<c:forEach var="li" items="${list }">
			<c:if test="${sessionScope.loginId == li.comwriter }">
				<div id="${li.commentnum }" class="me">
					<c:if test="${fn:substring(li.comwriter, 0, 1) eq 't'}">
						<div class="comWriter">${vo.teacherid.name }</div>
					</c:if>
					<c:if test="${fn:substring(li.comwriter, 0, 1) eq 'c'}">
						<div class="comWriter">${vo.childid.name }</div>
					</c:if>
					<div class="comDate">${li.comdate }</div>
					<div class="content" id="content${li.commentnum}">${li.content }</div>
					<div class="cBtn" id="cBtn${li.commentnum}">
						<input type="button" class="cEditBtn" id="c${li.commentnum }" value="수정">
						<input type="button" class="cDelBtn" id="d${li.commentnum }" value="삭제">
					</div>
					<div class="ccBtn" id="ccBtn${li.commentnum}" style="display:none">
						<input type="button" class="jjinEditBtn" id="r${li.commentnum }" value="찐수정">
						<input type="button" class="cancelBtn" id="cancel${li.commentnum }" value="취소">
					</div>
					
					
				</div>
			</c:if>
			
			
			<c:if test="${sessionScope.loginId != li.comwriter }">
				<div id="${li.commentnum }" class="other">
					<c:if test="${fn:substring(li.comwriter, 0, 1) eq 't'}">
						<div class="comWriter">${vo.teacherid.name }</div>
					</c:if>
					<c:if test="${fn:substring(li.comwriter, 0, 1) eq 'c'}">
						<div class="comWriter">${vo.childid.name }</div>
					</c:if>
					<div class="comDate">${li.comdate }</div>
					<div class="content">${li.content }</div>
				</div>
			</c:if>
			
			
			
		</c:forEach>
	</div>
	
	
	
	
	
	
	
	<script>
		$(document).ready(function(){
			let num = ${vo.tlnum};
			
			// 댓글 작성
			$(document).on("click", "#cBtn", function(){
				$.ajax({
					url : '/comment/add',
					data : {'tlnum':num, 'comwriter': '${sessionScope.loginId}', 'content': $("#content").val()},
					type : 'post',
					dataType : 'json',
					success : function(result){
						let dto = result.dto;
						
						let txt = '';
						txt += '<div id="'+dto.commentnum+'" class="me">';
						txt += '<div class="comWriter">'+dto.comwriter+'</div>';
						txt += '<div class="comDate">'+dto.comdate+'</div>';
						txt += '<div class="content">'+dto.content+'</div>';
						txt += '</div>';
						
						$("#clist").append(txt);
					},
					error : function(req, status){
						console.log(status);
					}
				});
			});
			
			// 글 수정하기
			$(document).on("click","#tEditBtn", function(){
				$.ajax({
					url : '/teacherlog/edit',
					data : {'tlnum':num, 'activity': $("#activity").val(), 'health': $("#health").val(), 'teacherid': '${sessionScope.loginId}', 'childid' : '${vo.childid.childid }'},
					type : 'post',
					dataType : 'json',
					success : function(result){
					},
					error : function(req, status){
						console.log(status);
					}
				});
			});
			
			// 글 삭제하기
			$(document).on("click","#tDelBtn", function(){
				location.href="/teacherlog/del?tlnum="+num+ "&teacherid=${sessionScope.loginId}"
			});
			
			// 이미지 수정하기
			$(document).on("click",".addImg", function(){
				let imgNum = $(this).attr("id").substr;
				// 작성해야함
				
// 				<!-- 	이미지 추가 / 수정을 누르면 보여줄 폼 -->
// 				<div id="imgf" style="display:none">
// 						<input type="file" name="file">
// 						<input type="button" value="이미지 수정 button">
// 						<input type="button" value="취소" id="cancel">
// 				</div>
			});
			
			// 이미지 삭제하기
			$(document).on("click",".delImg", function(){
				let imgNum = $(this).attr("id").substr(3);
				$("#detailimg" + imgNum).hide();
// 				$.ajax({
// 					url : '/teacherlog/imgdel',
// 					data : {'tlnum' : num,  },
// 					type : 'post',
// 					dataType : 'json',
// 					success:function(result){
// 						console.log(result);
// 					},
// 					error : function(req, status){
// 						console.log(status);
// 					}
// 				});
				
				
			
				//ajax 작성해야함
			});
			
			// 댓글 수정하기
			$(document).on("click", ".cEditBtn", function(){
				let num = $(this).attr("id").substr(1);
				$("#ccBtn"+num).show();
				$("#cBtn"+num).hide();				
				let txt = '<textarea id="text'+num+'">'+$("#content"+num).text()+'</textarea>';
				$("#content"+num).html(txt);
			});
			
			// 댓글 찐수정하기
			$(document).on("click", ".jjinEditBtn", function(){
				let num = $(this).attr("id").substr(1);
				let content = $("#text"+num).val();
				
				$.ajax({
					url : '/comment/edit',
					data : {'commentnum':num, 'content': content},
					type : 'post',
					dataType : 'json',
					success : function(result){
						console.log(result);
						$("#content"+num).text(content);
						$("#ccBtn"+num).hide();
						$("#cBtn"+num).show();	
					},
					error : function(req, status){
						console.log(status);
					}
				});
			});
			
			// 댓글 취소하기
			$(document).on("click", ".cancelBtn", function(){
				let num = $(this).attr("id").substr(1);
				$("#ccBtn"+num).hide();
				$("#cBtn"+num).show();				
				let txt = $("#content"+num).text();
				$("#content"+num).html(txt);
			});
			
			// 댓글 삭제하기
			$(document).on("click", ".cDelBtn", function(){
				let num = $(this).attr("id").substr(1);
				
				$.ajax({
					url : '/comment/del',
					data : {'commentnum':num},
					type : 'get',
					dataType : 'json',
					success : function(result){
						$("#"+num).remove();
					},
					error : function(req, status){
						console.log(status);
					}
				});
			});
			
			
		});
	</script>
</body>
</html>