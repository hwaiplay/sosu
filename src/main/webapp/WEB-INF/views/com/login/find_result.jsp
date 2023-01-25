<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<c:choose>
<c:when test="${M_EMAIL != null }">
당신의 이메일(아이디)는 ${M_EMAIL} 입니다. 
</c:when>
<c:when test="${M_PW != null}">
당신의 비밀번호는 ${M_PW} 입니다. 
</c:when>
</c:choose>
</div>

<a href="/members/loginform.sosu">확인</a>

</body>
</html>