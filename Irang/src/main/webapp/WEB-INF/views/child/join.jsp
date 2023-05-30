<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
    	let abc = false;
        $('#idcheck').click(function(){
            $.ajax({
                url:'/child/idcheck',
                type: 'post',
                data:{'id':$('#childid').val()},
                dataType:'json',
                success:function(result){
                    let txt = '<h4 style="color:';
                    if(result.flag){
                    	abc = result.flag;
                        txt += 'blue">사용 가능한 아이디</h4>';
                    }
                    else{
                        txt += 'red">사용 불가능한 아이디</h4>';
                    }
                    $('#res').html(txt);
                },
                error:function(req, status){
                    alert(status);
                }
            });
        })
        $('#submitbtn').click(function(){
        	if(abc){
        		form.submit();
        	}else{
        		alert('id 중복체크를 통과해야함');
        	}
        })
    })
</script>
</head>
<body>
<div class="container">
    <h3>회원가입(※선생님은 t_가 붙고 아이는 c_가 붙습니다)</h3>
    <form action="/child/join" method="post" enctype="multipart/form-data" name="form">
        <div class="form-group">
            <label for="id">ID:</label>
            <div class="input-group">
                <input type="text" class="form-control" value="c_" id="childid" name="childid">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="button" id="idcheck">ID 중복체크</button>
                </div>
            </div>
            <span id="res"></span>
        </div>
        <div class="form-group">
            <label for="pwd">비밀번호:</label>
            <input type="password" class="form-control" id="pwd" name="pwd">
        </div>
        <div class="form-group">
            <label for="name">아이의이름:</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="form-group">
            <label for="pname">부모님성함:</label>
            <input type="text" class="form-control" id="pname" name="pname">
        </div>
         <div class="form-group">
            <label for="pname">생년월일:</label>
            <input type="text" class="form-control" id="birthday" name="birthday">
        </div>
         <div class="form-group">
            <label for="pname">부모님전화번호:</label>
            <input type="text" class="form-control" id="phone" name="phone">
        </div>
         <div class="form-group">
            <label for="pname">알러지정보:</label>
            <input type="text" class="form-control" id="allergy" name="allergy">
        </div>
         <div class="form-group">
            <label for="pname">아이의 반:</label>
            <input type="number" class="form-control" id="classnum" name="classnum">
        </div>
        <div class="form-group">
          <label for="child_img">아이증명사진</label>
          <input type="file" class="form-control" id="child_img" name="f" required>
        </div>
        <input type="submit" id="submitbtn" class="btn btn-primary" value="가입">
    </form>
</div>
</body>
</html>