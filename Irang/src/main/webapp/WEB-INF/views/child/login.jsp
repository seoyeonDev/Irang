<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
<title>Signup</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.container{
	padding:16px;
}
input[type=text],input[type=password]{
	width:100%;
	padding:12px 20px;
	margin:8px 0;
	display:inline-block;
	box-sizing:border-box;
	
}
button{
	background-color:#4caF50;
	color:white;
	padding:14px 20px;
	margin:8px 0;
	border:none;
	cursor:pointer;
	width:100%;
	
	
}
.btncan{
	padding:14px 20px;
	background-color:red;
}
.btncan,.btnsign{
	float:left;
	width:50%;
}
.clearfix::after{
	content:"";
	clear:both;
	display:table;
}
@media screen and (max-width:300px){
	.btncan,.btnsign{
		width:100%;
	}
}
</style>
<link rel="stylesheet" href="css/style1.css">
</head>
<body>
<h2> login From</h2>
<form action="/child/login" method="post" style="border:3px solid #ccc">
<div class="container">
<label><b>ID</b></label>
<input type="text" placeholder="Id" name="childid" >
<label><b>Password</b></label>
<input type="text" placeholder="Password" name="pwd">
<p> Forgot your password click link <a href="#">Terms & Privacy</a></p>
<p> By create an account you agree to our <a href="#">Terms & Privacy</a></p>
</div>
<div class="clearfix">
<button type="cancel" class="btncan">Cancel</button>
<button type="Signup" class="btnsign">Login</button>
</div>
</form>
</body>
</html>