<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script defer type="text/javascript" src="/resources/js/login.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">

<form action="/members/login.sosu" method="post">

   <div>이메일</div><input type="text" name="M_EMAIL" id="m_email">
   <div>비밀번호</div><input type="password" name="M_PW" id="m_pw">
   
   <input type="submit" value="로그인" id="loginform">
   
</form>

<a href="/members/findidform.sosu">아이디찾기</a>
<a href="/members/findpwform.sosu">비밀번호 찾기</a>


</div>

</body>
</html>