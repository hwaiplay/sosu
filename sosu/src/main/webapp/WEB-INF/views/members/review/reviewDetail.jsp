<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
    
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/review.js"></script>
<link href="/resources/css/review.css" rel="stylesheet">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<main class="container">
	<article>
		<section>
			
				<div class="reviewHeader">
					
					<div class="info">
						<div class="profile">
							<div class="profile">
								<img class="review_profile" src="/resources/img/profile/base_m.png">
							</div>
						</div>
						<div class="info_notPhoto">
							<div class="name">${map.M_NICKNAME}</div>
							<div class="info_SD">
								<div class="starpoint">
									<c:forEach begin="1" end="${map.RV_STAR}">⭐</c:forEach>
								</div>
								<div class="review_date"></div>
							</div>
						</div>
					</div>
					  <c:choose>
                        <c:when test="${fn:length(list) > 0 }">
					<c:forEach items="${list}" var="f">
				   <c:if test = "${f.F_MAIN_YN eq 'N'}">
							<div class="rv_img"><img class="rv" src="/resources/img/upload/${f.F_SVNAME}"></div>
					</c:if>
					</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
					</c:choose>
					<div class="contents">${map.RV_CONTENT}</div>
				</div>
				<div class="join_moim">
					<div class="title_moim">${map.MO_TITLE}</div>
				</div>
				<div class="rv_btn">	
					<a href="/review/${map.MO_CATEGORY}.sosu" class="btn_a">목록으로</a>
					
					<c:if test="${sessionss eq map.M_IDX}">
					<a href="/reviewModify/${map.MO_CATEGORY}/${RV_IDX}.sosu" class="btn_a">수정하기</a>
					<form action="/review/{MO_CATEGORY}.sosu" method="post" onsubmit="return confirm('삭제하시겠습니까?');">
					<button class="submit warning">삭제</button></form>
					</c:if>
				</div>
			
		</section>
	</article>
</main>