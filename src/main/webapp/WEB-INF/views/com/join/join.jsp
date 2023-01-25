<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script defer type="text/javascript" src="/resources/js/join.js"></script>
<title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>

<div class="container">
   <form action="/members/join.sosu" method="post">
   <input type="hidden" id="doubleCheck" value='0'>
   <input type="hidden" id="pwSameCheck" value='0'>
      
      <div>이름</div><input type="text" name="M_NAME" id="m_name">
      
      <div>닉네임</div><input type="text" name="M_NICKNAME" id="m_nickname">
      
      <div>이메일(아이디)</div><input type="text" name="M_EMAIL" id="m_email" placeholder="이메일 형식으로 입력해주세요.">
      <input type="button" id="double" value='아이디 중복 체크'> <!-- 팝업창 -->
      
      <div class="double_check_result" id="double_check_result"></div>
      
      <div>비밀번호</div><input type="password" name="M_PW" id="m_pw">
      
      <div>비밀번호 확인</div><input type="password" name="M_PW2" id="m_pw2">
      <div class="pwCheck" id="pwCheck"></div>
      
      <div>휴대전화</div><input type="text" name="M_PHONE" id="m_phone">
      
      <div>주민등록번호</div><input type="text" name="M_JUMIN" id="m_jumin" maxlength="6">
      <input type="text" name="M_GENDER" id="m_gender" maxlength="1">******
      
      <div>질문</div>
      <select name="M_QUE" id="m_que">
         <option value="">질문을 선택해 주세요.</option>
         <option value="1">기억에 남는 추억의 장소는?</option>
         <option value="2">자신이 세번째로 존경하는 인물은?</option>
         <option value="3">내가 좋아하는 캐릭터는?</option>
         <option value="4">다시 태어나면 되고 싶은 것은?</option>
         <option value="5">초등학교 때 기억에 남는 짝꿍 이름은?</option>
         <option value="6">인상깊게 읽은 책 이름은?</option>
      </select>
      <input type="text" name="M_ANS" id="m_ans">
      
      
      <input type="submit" value="회원가입" id="join">
      
   </form>
</div>



</body>
</html>