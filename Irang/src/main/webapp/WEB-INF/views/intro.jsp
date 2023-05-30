<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 

.container {
margin-top :200px;
  display: flex;
  justify-content: center;
}

.login {
  margin: 10px;
}

img {
  border: 2px solid #A9CFE2;
  border-radius: 100%;
  display: block;
  width:400px;
  height: 400px;
}

.login:first-child {
  margin-right: 20px;
}

.login:last-child {
  margin-left: 20px;
}

</style>
</head>
<body>

<div class="container">
  <div class="login">
    <a href="/teacher/login">
    
      <img src="../image/001.png">
    </a>
  </div>

  <div class="login">
    <a href="/child/login">
      <img src="../image/002.png">
    </a>
  </div>
</div>

</body>
</html>