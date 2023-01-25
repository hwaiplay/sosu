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

<form action="/members/findid.sosu" method="POST">
   <div>이름</div><input type="text" name="M_NAME" id="m_name">
   <div>휴대전화</div><input type="text" name="M_PHONE" id="m_phone">
   <div>질문</div>
      <select name="M_QUE">
         <option value="1">기억에 남는 추억의 장소는?</option>
         <option value="2">자신이 세번째로 존경하는 인물은?</option>
         <option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
         <option value="4">다시 태어나면 되고 싶은 것은?</option>
         <option value="5">초등학교 때 기억에 남는 짝꿍 이름은?</option>
         <option value="6">인상깊게 읽은 책 이름은?</option>
      </select>
      <input type="text" name="M_ANS">
   
   <input type="submit" value="확인">
</form>

</div>
</body>
</html>