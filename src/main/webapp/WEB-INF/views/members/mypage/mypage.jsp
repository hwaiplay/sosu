<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script defer type="text/javascript" src="/resources/js/mypage.js"></script>



<title>Insert title here</title>
<link href="/resources/css/mypage.css" rel="stylesheet">
</head>
<body>
<h1>회원 정보</h1>
<div class="container">
   <div>
   
   <form enctype="multipart/form-data">
      <img src="${pageContext.request.contextPath}/resources/img/upload/${mypageInfo[9][0].F_SVNAME}"><br/>
   </form>
   <!-- 공통 정보 -->
   닉네임 : ${mypageInfo[0][0].M_NICKNAME}<br><a href="/members/mypagemodifyform.sosu">수정하기</a>
   이메일 : ${mypageInfo[0][0].M_EMAIL}<br>  
   별점(소수) : ${mypageInfo[1][0].STARFLOAT}<br>
   별점(정수) : ${mypageInfo[2][0].STARINT}<br>
   <br><br>
   </div>
   <hr>
   
   <form action="/members/mypage.sosu" method="get">
      <input type="hidden" id="category" name="mypageCategory" value="">
      <input type="hidden" id="review" name="selectReview" value="">
      <input type="hidden" id="zzim" name="selectZzim" value="">
      
      <input type="submit" id="check1" value="내가 개설한 모임">
      <input type="submit" id="check2" value="내가 참여한 모임">
      <input type="submit" id="check3" value="리뷰">
      <input type="submit" id="check4" value="스크랩">
   
   
   
   <c:if test="${mypageCategory eq '1' }">
   <h3>내가 개설한 모임</h3>
   <section id="1"> 내가 개설한 모임 개수 : ${fn:length(mypageInfo[3])}<br>
      <div class="col-lg-3">
      <c:forEach begin="0" end="${fn:length(mypageInfo[3])}" items="${mypageInfo[3]}" var="mypage">
         모임상세지역 : ${mypage.MO_DETAILREGION }<br> 
         모임제목 : ${mypage.MO_TITLE}<br>
         모임인원 : [${mypage.MOIMMEMBER} / ${mypage.MO_MAXPEOPLE }]<br>
         모임상세카테고리 : # ${mypage.MO_DETAILCATEGORY }<br>
         모임비용 : ${mypage.MO_COST }<br>
         <hr>
      </c:forEach>
      </div>
   </section>
   <hr>
   </c:if>
   
   <c:if test="${mypageCategory eq '2' }">
   <h3>내가 참여한 모임</h3>
      비공개
      <label class="switch-button">
         <input type="checkbox" onclick="checkReview()" id="private1" value="1" <c:if test="${privateCheck eq '1' || privateCheck eq '2'}">checked</c:if>>
      <span class="onoff-switch"></span>
   </label>
   <section id="2"> 내가 참여한 모임 개수 : ${fn:length(mypageInfo[4])}<br>
      <c:forEach begin="0" end="${fn:length(mypageInfo[4])}" items="${mypageInfo[4]}" var="mypage">
         모임상세지역 : ${mypage.MO_DETAILREGION }<br> 
         모임제목 : ${mypage.MO_TITLE}<br>
         모임인원 : [${mypage.MOIMMEMBER} / ${mypage.MO_MAXPEOPLE }]<br>
         모임상세카테고리 : # ${mypage.MO_DETAILCATEGORY }<br>
         모임비용 : ${mypage.MO_COST }<br>
         <hr>
      </c:forEach>
   </section>
   <hr>
   </c:if>
   
   <c:if test="${mypageCategory eq '3' }">
   <section id="3"><%-- 리뷰 전체 개수 : ${{fn:length(mypageInfo[5])} + ${fn:length(mypageInfo[6]) }} --%><br/>
   <h3>리뷰</h3>
   <input type="submit" id="check5" value="내가 남긴 리뷰">
   <input type="submit" id="check6" value="나에게 남긴 리뷰">
      <c:if test="${selectReview eq '5' }">
         <div>내가 남긴 리뷰 개수 : ${fn:length(mypageInfo[5]) }</div>
         <c:forEach begin="0" end="${fn:length(mypageInfo[5])}" items="${mypageInfo[5]}" var="mypage">
            모임제목 : ${mypage.MO_TITLE}<br>
            날짜 : ${mypage.MO_REGDATE}<br>
            별점 : ${mypage.RV_STAR}<br>
            <hr>
         </c:forEach>
      </c:if>
      
      <c:if test="${selectReview eq '6' }">
         <div>나에게 남긴 리뷰 개수 : ${fn:length(mypageInfo[6]) }</div>
         <c:forEach begin="0" end="${fn:length(mypageInfo[6])}" items="${mypageInfo[6]}" var="mypage">
            모임제목 : ${mypage.MO_TITLE}<br>
            날짜 : ${mypage.MO_REGDATE }<br>
            별점 : ${mypage.RV_STAR }<br>
            <hr>
         </c:forEach>
      </c:if>
   </section>
   </c:if>
   
   
   <c:if test="${mypageCategory eq '4' }">
   <section id="4"> <%-- 찜 전체 개수 :  ${{fn:length(mypageInfo[7])} + ${fn:length(mypageInfo[8]) }} --%><br/>
   <h3>모임</h3>
      비공개
      <label class="switch-button">
         <input type="checkbox" onclick="checkZzim()" id="private2" value="1" <c:if test="${privateCheck eq '1' || privateCheck eq '3'}">checked</c:if>>
      <span class="onoff-switch"></span>
   </label>
   <br>
   <input type="submit" id="check7" value="내가 찜한 모임">
   <input type="submit" id="check8" value="내가 찜한 자유게시판">
      
      <c:if test="${selectZzim eq '7' }">
      <div>내가 찜한 모임 개수 : ${fn:length(mypageInfo[7]) }</div>
         <c:forEach begin="0" end="${fn:length(mypageInfo[7])}" items="${mypageInfo[7]}" var="mypage">
            모임상세지역 : ${mypage.MO_DETAILREGION }<br> 
            모임제목 : ${mypage.MO_TITLE}<br>
            모임인원 : [${mypage.MOIMMEMBER} / ${mypage.MO_MAXPEOPLE }]<br>
            모임상세카테고리 : # ${mypage.MO_DETAILCATEGORY }<br>
            모임비용 : ${mypage.MO_COST }<br>
            <hr>
         </c:forEach>
      </c:if>
      
      <c:if test="${selectZzim eq '8' }">
      <div>내가 찜한 자유게시판 개수 : ${fn:length(mypageInfo[8]) }</div>
         <c:forEach begin="0" end="${fn:length(mypageInfo[8])}" items="${mypageInfo[8]}" var="mypage">
            작성자 : ${mypage.FR_WRITER}<br>
            게시글 제목 : ${mypage.FR_TITLE }<br>
            게시판 카테고리:  ${mypage.FR_CATEGORY}<br>
            작성일 : ${mypage.FR_REGDATE}<br>
            조회수 : ${mypage.FR_COUNT}<br>
            <hr>
         </c:forEach>
      </c:if>
   </section>
   </c:if>
   </form>
</div>
<a href="/main.sosu">메인으로</a>
</body>
</html>