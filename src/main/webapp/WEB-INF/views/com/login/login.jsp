<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script defer type="text/javascript" src="/resources/js/login.js"></script>
<link href="/resources/css/login.css" rel="stylesheet">
</head>
<body>


<div class="container" style="text-align:center">

<h1 style="margin-top:50px; margin-bottom:40px">LOGIN</h1>

<form action="/members/login.sosu" method="post">
	
	<table class="input-form" >
	<colgroup>
			<col style="width:20%;">
			<col style="width:80%;">
		</colgroup>
	<thead></thead>
	<tbody>
		<tr>
			<th class="header"><label for="m_email" >이메일</label></th>
			<td class="contents"><input type="text" name="M_EMAIL" id="m_email"></td>
		</tr>
		
		<tr>
		<th class="header"><label for="m_pw">비밀번호</label></th>
		<td class="contents"><input type="password" name="M_PW" id="m_pw"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center" height="25"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="로그인" id="loginform" class="btn-login">
			</td>
		</tr>
		
		<tr>	
			<td colspan="2" align="center">
			<a href="/members/joinform.sosu" class="btn-a">회원가입</a>
			<a href="/members/findidform.sosu"  class="btn-a">아이디찾기</a>
			<a href="/members/findpwform.sosu"  class="btn-a">비밀번호 찾기</a></td>
		
</tbody>
	</table>
</form>


  

</div>

</body>
</html>
