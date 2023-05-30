<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>


#side-menu {
  width: 20%;
}

/* #main { */
/*   width: 70%; */
/*   background-color: #FFF; */
/*   position: absolute; */
/*   top: 50%;  */
/*    left: 50%;  */
/*    transform: translate(-50%, -50%);  */

/* } */


#main{
    
    padding-top: 100%;  /* 1:1 ratio */
    overflow: hidden;
}


</style>
</head>

<body>	

<header>
<jsp:include page="header.jsp"/>
	</header>
	
	

<div id="side-menu">
    <jsp:include page="sidemenu.jsp" />
  </div>
  

 <div class = "wrapper">
  <div id="main">
   <jsp:include page="${bodyview }"/>
  </div>
  </div>

</body>
</html>