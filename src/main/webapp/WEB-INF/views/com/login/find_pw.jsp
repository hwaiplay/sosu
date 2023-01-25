<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<form action="/members/findpw.sosu" method="POST">
   <div>이름</div><input type="text" name="M_NAME" id="m_name">
   <div>이메일(아이디)</div><input type="text" name="M_EMAIL">
   <div>주민등록번호</div>
   <input type="text" name="M_JUMIN" maxlength="6">     
   
   <input type="submit" value="확인">
</form>
</div>
</body>
</html>