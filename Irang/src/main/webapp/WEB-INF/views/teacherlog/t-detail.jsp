<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/teacherlogdetail.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>Insert title here</title>
</head>

<body id="tdetail">
<div style="text-align:center; margin-bottom:50px"><span id="dTitle">글 상세보기</span></div>
<div style="text-align:center">

<!-- 선생님.ver detail -->
<c:if test="${fn:substring(sessionScope.loginId, 0, 1) eq 't'}">
	<div id="tInfo">
		<div id="timg"><img src="/teacher/read_img?fname=${tImg }"> </div>
		<span><span id="teacher">${vo.teacherid.name }</span> 선생님 &nbsp; | &nbsp;</span>
		<span>날짜 ${vo.tdate } &nbsp;| &nbsp;</span>
		<span>글 번호 ${vo.tlnum }</span>
	</div>

<div id="imgAll">
	<div id="img1">
		<div id="image1">
 			<!-- 이미지가 있으면 보여줄거고 없으면 추가 버튼을 보여주기 -->
			<c:if test="${not empty vo.img1 }">
				<img class="detailimg" id="detailimg1" src="/teacherlog/read_img?fname=${vo.img1 }&tlnum=${vo.tlnum }">
			</c:if>
			<c:if test="${empty vo.img1 }">
				<img class="detailimg" id="detailimg1" src="../image/nopic.jpg" >
			</c:if>
		</div>
		<input type="file" value="추가" class="addImg" id="add1" style="display:none">
		<input type="button" value="삭제" class="delImg" id="del1" style="display:none">
	</div>
	<div id="img2">
		<div id="image2">
			<c:if test="${not empty vo.img2 }">
				<img class="detailimg" id="detailimg2" src="/teacherlog/read_img?fname=${vo.img2 }&tlnum=${vo.tlnum }">
			</c:if>
			<c:if test="${empty vo.img2 }">
				<img class="detailimg" id="detailimg2" src="../image/nopic.jpg" >
			</c:if>
		</div>
		<input type="file" value="추가" class="addImg" id="add2" style="display:none">
		<input type="button" value="삭제" class="delImg" id="del2" style="display:none">
		
	</div>
	<div id="img3">
		<div id="image3">
			<c:if test="${not empty vo.img3 }">
				<img class="detailimg" id="detailimg3" src="/teacherlog/read_img?fname=${vo.img3 }&tlnum=${vo.tlnum }">
			</c:if>
			<c:if test="${empty vo.img3 }">
				<img class="detailimg" id="detailimg3" src="../image/nopic.jpg" >
			</c:if>
		</div>
		<input type="file" value="추가" class="addImg" id="add3" style="display:none">
		<input type="button" value="삭제" class="delImg" id="del3" style="display:none">
		
	</div>
</div>
	
	<div style="margin-top:50px; margin-bottom:5px">활동</div>
	<div>
		<textarea id="activity">${vo.activity }</textarea>
	</div>
	<div style="margin-top:50px; margin-bottom:5px">건강</div>
	<div>
		<textarea id="health"> ${vo.health }</textarea>
	</div>
	<div style="margin-top : 40px;">
		<input type="button" value="수정하기" id="tEditBtn" class="zBtn">
		<input type="button" value="삭제하기" id="tDelBtn" class="zBtn">
	</div>
	
</c:if>


<!-- 보호자.ver detail -->
<c:if test="${fn:substring(sessionScope.loginId, 0, 1) eq 'c'}">

	<div id="tInfo">
		<div id="timg"><img src="/teacher/read_img?fname=${tImg }"> </div>
		<span><span id="teacher">${vo.teacherid.name }</span> 선생님 &nbsp; | &nbsp;</span>
		<span>날짜 ${vo.tdate } &nbsp;| &nbsp;</span>
		<span>글 번호 ${vo.tlnum }</span>
	</div>
<div id="imgAll">
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
</div>
	
	<div style="margin-top:50px">활동</div>
	<div class="articleP">	
		<div class="article">${vo.activity }</div>
	</div>
	<div  style="margin-top:50px">건강</div>
	<div class="articleP">
		<div class="article">${vo.health }</div>
	</div>
</c:if>
	
	
	
	
	<hr style="height: 2px; background-color: #a9cfe2; margin-top:100px; margin-bottom:50px">
	<div style="margin-bottom:50px; flex-direction: column; justify-content: center"">
	<textarea class="taA" id="content"></textarea>
	<input type="button" value="댓글 작성" id="cBtn">
	</div>
</div>

	
	
	<div style="display: flex; align-items: center; justify-content: center">
	<div id="clist">
		<c:forEach var="li" items="${list }">
			<c:if test="${sessionScope.loginId == li.comwriter }">
			<div id="${li.commentnum }"  style="display: flex; margin:10px">
				<div class="me">
					<div style="display:flex; margin-bottom:5px">
						<c:if test="${fn:substring(li.comwriter, 0, 1) eq 't'}">
							<div class="comWriter">${className}반 선생님</div>
						</c:if>
						<c:if test="${fn:substring(li.comwriter, 0, 1) eq 'c'}">
							<div class="comWriter">${vo.childid.name }</div>
						</c:if>
				
						<div class="comDate">${li.comdate }</div>
					</div>
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
			</div>
			</c:if>
			
			
			<c:if test="${sessionScope.loginId != li.comwriter }">
			<div id="${li.commentnum }" style="display: flex; margin-bottom:5px">
				<div class="other">
					<div style="display:flex">
						<c:if test="${fn:substring(li.comwriter, 0, 1) eq 't'}">
							<div class="comWriter">${vo.teacherid.name }</div>
						</c:if>
						<c:if test="${fn:substring(li.comwriter, 0, 1) eq 'c'}">
							<div class="comWriter">${vo.childid.name }</div>
						</c:if>
						<div class="comDate">${li.comdate }</div>
					</div>
					<div class="content">${li.content }</div>
				</div>
				
				
			</div>
			</c:if>
			
			
			
		</c:forEach>
	</div>
	</div>
	
	
	
	<script>
		$(document).ready(function(){
			let num = ${vo.tlnum};
			let nopic = '../image/nopic.jpg';
			
			// 이미지 유무에 따라 버튼 value 변경 (등록된 이미지 있으면 삭제 버튼, 없으면 추가 버튼)
			if($("#detailimg1").attr("src") == nopic){
				$("#add1").show();
			} else {
				$("#del1").show();
			}
			if($("#detailimg2").attr("src") == nopic){
				$("#add2").show();
			} else {
				$("#del2").show();
			}
			if($("#detailimg3").attr("src") == nopic){
				$("#add3").show();
			} else {
				$("#del3").show();
			}
			
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
						txt += '<div id="'+dto.commentnum+'" style="display: flex; margin:10px">';
						txt += '<div class="me">';
						txt += '<div style="display: flex; margin-bottom:5px">';
						txt += '<div class="comWriter">'+result.tcName;
						
						if(dto.comwriter.charAt(0)=='t'){
							txt+= '반 선생님'; // teacherid에만 '반 선생님' 붙여주기 
						}
						
						txt += '</div>';
						txt += '<div class="comDate">'+dto.comdate+'</div></div>';
						txt += '<div class="content" id="content' + dto.commentnum + '">'+dto.content+'</div>';
						txt += '<div class="cBtn" id="cBtn' + dto.commentnum +'">';
						txt += '<input type="button" class="cEditBtn" id="c' + dto.commentnum + '" value="수정">';
						txt += '<input type="button" class="cDelBtn" id="d' + dto.commentnum + '" value="삭제"></div>';
						txt += '<div class="ccBtn" id="ccBtn' + dto.commentnum + '" style="display:none">';
						txt += '<input type="button" class="jjinEditBtn" id="r' + dto.commentnum + '" value="찐수정">';
						txt += '<input type="button" class="cancelBtn" id="cancel' + dto.commentnum + '" value="취소"></div></div></div>';
						
						$("#clist").append(txt);
						$("#content").val("");
						// 댓글 작성한 곳 빈칸으로 만들기
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
			
			// 이미지 추가하기
			$(document).on("change",".addImg", function(){
				let imgNum = $(this).attr("id").substr(3);
				
				var file = $(this).prop("files")[0];
 				var fileName = file.name;
 				// 파일명 가져오기
 				
 				var formData = new FormData(); // FormData 객체 생성
 				formData.append("tlnum", num); 
 				formData.append("imgnum", imgNum); 
 				formData.append("imgfile", file);
 				
 				$.ajax({
 					url : '/teacherlog/imgadd',
					data : formData,
					type : 'post',
					dataType : 'json',
					processData: false, // 데이터 처리 방지
				    contentType: false, // 컨텐츠 타입 설정
					success:function(result){
						$("#detailimg" + imgNum).attr("src", "/teacherlog/read_img?fname=" + fileName + "&tlnum=${vo.tlnum }");
						console.log("/teacherlog/read_img?fname=" + fileName + "$&tlnum=${vo.tlnum }");
						$("#add" + imgNum).hide(); // 추가 버튼 hide
						$("#del" + imgNum).show(); // 삭제 버튼 show
					},
					error : function(req, status){
						console.log(status);
					}
 				});
 				$("#detailimg"+imgNum).attr("src", fileName); // 변경된 사진으로 바꾸기
			});
			
			// 이미지 삭제하기
			$(document).on("click",".delImg", function(){
				let imgNum = $(this).attr("id").substr(3);
				
				$.ajax({
					url : '/teacherlog/imgdel',
					data : {'tlnum' : num, 'imgnum' : imgNum, 'imgpath' : $("#detailimg"+imgNum).attr("src") },
					type : 'get',
					dataType : 'json',
					success:function(result){
						$("#detailimg" + imgNum).attr("src", nopic); // 삭제했으니 noimage 사진으로 바꾸기
						$("#add" + imgNum).show(); // 추가 버튼 show
						$("#del" + imgNum).hide(); // 삭제 버튼 hide
					},
					error : function(req, status){
						console.log(status);
					}
				});
			});
			
			// 댓글 수정하기
			$(document).on("click", ".cEditBtn", function(){
				let num = $(this).attr("id").substr(1);
				$("#ccBtn"+num).show();
				$("#cBtn"+num).hide();
				
				let txt = '<textarea id="text'+num+'" class="cmt">'+$("#content"+num).text()+'</textarea>';
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
				let num = $(this).attr("id").substr(6);
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
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>