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


/* #main{     */
/*     padding-top: 100%;  /* 1:1 ratio */ */
/*     overflow: hidden; */
/* } */


</style>
</head>

<body>	

<header>
 <c:if test ="${not empty sessionScope.loginId }">
<jsp:include page="header.jsp"/>
 </c:if>
	</header>
	
	

<div id="side-menu">
 <c:if test ="${not empty sessionScope.loginId }">
    <jsp:include page="sidemenu.jsp" />
     </c:if>
  </div>
  

 <div class = "wrapper">
 
  <div id="main">
  
  <c:if test ="${empty sessionScope.loginId }">
   <jsp:include page="intro.jsp"/>
   </c:if>
   
   <c:if test ="${not empty sessionScope.loginId }">
   <jsp:include page="${bodyview }"/>
   </c:if>
  </div>
  </div>

</body>
</html>