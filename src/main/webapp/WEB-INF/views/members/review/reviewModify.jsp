<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/reviewModify.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reviewForm.css"/>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<main class="container">
<article>
	<form action="/reviewModify/${RV_IDX}.sosu" method="post" onsubmit="return check()" name="insertReview" id="insertReview">
		<h1>리뷰 수정하기</h1>
		
		<fieldset>
		    <legend>별점을 선택해주세요</legend>
		    <input type="radio" name="rv_star" value="5" id="rate1"><label for="rate1">⭐</label>
		    <input type="radio" name="rv_star" value="4" id="rate2"><label for="rate2">⭐</label>
		    <input type="radio" name="rv_star" value="3" id="rate3"><label for="rate3">⭐</label>
		    <input type="radio" name="rv_star" value="2" id="rate4"><label for="rate4">⭐</label>
		    <input type="radio" name="rv_star" value="1" id="rate5"><label for="rate5">⭐</label>
		</fieldset>
		
		<h3>제목</h3>
		<input type="text" name="rv_title" id="rv_title" value="${reviewMap.RV_TITLE}">
		
		<h3>내용</h3>
		<textarea name="rv_content" id="rv_content" placeholder="후기 내용을 작성해주세요.">${reviewMap.RV_CONTENT}</textarea>
		
		<!-- 회원번호 모임번호 -->
		<input type="hidden" name="rv_m_idx" value="${reviewMap.M_IDX}"> <!-- ${m_idx} -->
		<input type="hidden" name="rv_mo_idx" value="${reviewMap.MO_IDX}"> <!-- ${mo_idx} -->
		
		<input type="file" id="review_file" accept="image/jpeg, image/png, image/jpg"> <!-- accept로 이미지파일 확장자 제한 가능 -->
		
		<a href="/review/${MO_CATEGORY}.sosu" class="btn">취소</a><!-- 마이페이지 URL  -->
		<button class="submit">등록</button>
	</form>
</article>
</main>