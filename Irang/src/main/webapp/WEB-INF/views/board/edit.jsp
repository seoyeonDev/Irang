<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
img{
width : 200px; 
height : 200px;
}

</style>


<script> 

$(document).ready(function() {
	
	if (${dto.mgnum} == 1) {
		  $('#mgnumcheck').prop('checked', true); //mgnum이 1 이면 체크 표시 되어있게 하고 

		  $('#mgnumcheck').click(function() { //mgnum을 클릭했을 때 
		    if ($(this).is(':checked')) { //값이 체크면 
		      $(this).val(1); //val 을 1로 주고 
		    } else { 
		      $(this).val(0); //아니라면 0으로 줘 
		    }
		  });
		}	
	
	$('#cancel').click(function(){
		 $('#imgf').hide();
	});
	
	//수정 폼 숨기기 
    $('#imgf').hide();

    //수정버튼 누르면 해당 이미지가 몇번째 이미지인지 확인
    $(".e").click(function(){
	   	 $('#imgf').show();
        let id = $(this).attr("id");
        let num = id.substring(2);
        $('#imgnum').attr("value", num); 
        //'#imgnum'의 속성을 bnum 으로 설정 
       
    });
    
    //이미지 수정 버튼 누르면 ajax로 이미지 교체 go 
 	$('#imgf').click(function(){
 		$('#imgf').show();
	});
    
    
	
    //삭제버튼 누르면 
	$('.d').click(function(){
		let id = $(this).attr("id");
		let num = id.substring(2);
		location.href="/board/delimg?bnum=${dto.bnum}&imgnum="+num;
	});
	
	//취소버튼 누르면 사진 업로드 양식 사라짐 
	

});

</script>


</head>
<body>
<h3> 수정 폼 </h3>


<table>
	<tr>
	
<!-- 	이미지가 아예 없으면 없게 뜨고 누르면 이미지 등록하는게 뜨게 하고 싶어  -->
	<td>
			<c:if test="${not empty dto.img1}">
			<img src="/board/read_img?fname=${dto.img1}">
				<td><input type="button" class="e" id="eb1" value="수정">
				<input type="button" class="d" id="db1" value="삭제"></td>					
			</c:if>
		</td>
		<td>
			<c:if test="${not empty dto.img2}">
				<img src="/board/read_img?fname=${dto.img2}">
						<td><input type="button" class="e" id="eb2" value="수정">
						<input type="button" class="d" id="db2" value="삭제"></td>				
			</c:if>
		
		</td>
		<td>
			<c:if test="${not empty dto.img3}">
				<img src="/board/read_img?fname=${dto.img3}">
						<td><input type="button" class="e" id="eb3" value="수정">
						<input type="button" class="d" id="db3" value="삭제"></td>			
				</c:if>
		</td>		
	</tr>
	
</table>


<!-- 이미지 등록 폼  -->
<div id="imgf">
<form action="/board/editimg" method="post" enctype="multipart/form-data">
<input type="file" name="f1"><br/>
<input type="hidden" name="bnum" value="${dto.bnum }">
<input type="hidden" name="imgnum" id="imgnum">
<input type="submit" value="등록">
<input type="button" value="취소" id="cancel">
</form>
</div>


<!-- 수정폼 -->
<form id = "f" action ="/board/edit" method="post">
<table border="1">
<tr><th>번호</th><td> ${dto.bnum }</td></tr>
<tr><th>중요도</th><td><input type="checkbox" name="mgnum" value="1" id="mgnumcheck">중요
</td></tr>
<tr><th>작성자</th><td>${dto.teacherid.teacherid }</td></tr>
<tr><th>제목</th><td><input type = "text" name ="title" value= "${dto.title}"></td></tr>
<tr><th>등록날짜</th><td>${dto.wdate }</td></tr>
<tr><th>내용</th><td><textarea name="content" rows="5" cols="30">${dto.content }</textarea></td></tr>
<tr><th>이벤트날짜</th><td><input type="date" name="edate" value = "${dto.edate }"></td></tr>
<tr><th>수정</th><td><input type= "submit" value = "수정" id = "editc"></td></tr>
</table>
<input type="hidden" name="bnum" value="${dto.bnum }">
</form>


</body>
</html>