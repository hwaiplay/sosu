<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script defer type="text/javascript" src="/resources/js/mypage.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<h1>내 정보 수정</h1>

<form action="/members/mypagemodify.sosu" method="post" enctype="multipart/form-data">
<input type="hidden" value="${modify.M_IDX }" name="M_IDX" id="M_IDX">

<img src="${pageContext.request.contextPath}/resources/img/upload/${profileGet.F_SVNAME}" id="img1">
<br/>
프로필 사진 수정 : <input type="file" name="file" id="file">
프로필 사진 삭제 : <input type="button" value="삭제" id='delete' >
<input type="hidden" id="delete_result" name="GenderCheck"  value="0"> 

<div>이름</div> <input type="text" value="${modify.M_NAME}" name="M_NAME"> 
<input type="hidden" value="${modify.M_GENDER }" id="m_gender" readonly>
<button id="male">남</button><button id="female">여</button>
<div>닉네임</div> <input type="text" value="${modify.M_NICKNAME}" name="M_NICKNAME">
<div>아이디(EMAIL)</div> <input type="text" value="${modify.M_EMAIL}" readonly>
<div>비밀번호</div> <input type="password" value="${modify.M_PW}" name="M_PW">
<div>비밀번호 확인</div> <input type="password" name="M_PW2">
<div>휴대전화</div> <input type="text" value="${modify.M_PHONE }" name="M_PHONE">
<div>주민등록번호</div> <input type="text" value="${modify.M_JUMIN}" name="M_JUMIN">-<input type="text" value="*******" readonly>

<div>질문</div>
   <select name="M_QUE">
      <option value="${modify.M_QUE}" hidden="hidden">
         <c:if test="${modify.M_QUE eq '1'}">기억에 남는 추억의 장소는?</c:if>
         <c:if test="${modify.M_QUE eq '2'}">자신이 세번째로 존경하는 인물은?</c:if>
         <c:if test="${modify.M_QUE eq '3'}">내가 좋아하는 캐릭터는?</c:if>
         <c:if test="${modify.M_QUE eq '4'}">다시 태어나면 되고 싶은 것은?</c:if>
         <c:if test="${modify.M_QUE eq '5'}">초등학교 때 기억에 남는 짝꿍 이름은?</c:if>
         <c:if test="${modify.M_QUE eq '6'}">인상깊게 읽은 책 이름은?</c:if>
      </option>
      <option value="1">기억에 남는 추억의 장소는?</option>
      <option value="2">자신이 세번째로 존경하는 인물은?</option>
      <option value="3">내가 좋아하는 캐릭터는?</option>
      <option value="4">다시 태어나면 되고 싶은 것은?</option>
      <option value="5">초등학교 때 기억에 남는 짝꿍 이름은?</option>
      <option value="6">인상깊게 읽은 책 이름은?</option>
   </select>
   <input type="text" name="M_ANS" value="${modify.M_ANS }">


<input type="button" value="취소" onclick="location.href='/members/mypage.sosu'">
<input type="submit" value="수정" id="modify">
<input type="button" value="탈퇴" onclick="location.href='/members/mypagedelete.sosu'">

</form>

</div>
</body>
</html>