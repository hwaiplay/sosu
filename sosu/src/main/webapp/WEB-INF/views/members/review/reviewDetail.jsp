<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/resources/js/review.js"></script>
<link href="/resources/css/review.css" rel="stylesheet">

<main>
	<article class="container">
		<div>
			<h1 class="h1_review">후기 ${review_count.RVC}개 있어요!</h1>
			<div class="AVGstarpoint">
				<c:forEach begin="1" end="${((review_count.AVGSP*10)-(review_count.AVGSP*10%10))/10}">⭐</c:forEach>
				<span>&nbsp;${review_count.AVGSP}</span>
			</div>
		</div>
		<br>
		<hr>
		<br>
		<form action="/review/{MO_CATEGORY}.sosu" method="post" onsubmit="return confirm('삭제하시겠습니까?');">
			<section>
				<c:choose>
					<c:when test="${detailList[0].TOTAL_COUNT != 0}">
						<c:forEach items="${detailList}" var="r">
							<div class="reviewHeader">
								<!-- input hidden 값 -->
								<input type="hidden" name="MO_CATEGORY" id="mo_category" value="${r.MO_CATEGORY}">
								<input type="hidden" name="RV_IDX" id="rv_idx" value="${r.RV_IDX}">
								<input type="hidden" name="M_IDX" id="rv_idx" value="${r.M_IDX}">
								<input type="hidden" name="MO_IDX" id="MO_IDX" value="${r.MO_IDX}">
								<input type="hidden" class="review_regdate name" name="RV_REGDATE" id="RV_REGDATE" value="${r.RV_REGDATE}">
								<div class="info">
									<div class="profile">
										<img src="/resources/upload/chunsic.png">
									</div>
									<div class="info_notPhoto">
										<div class="name">${r.M_NICKNAME}</div>
										<div class="info_SD">
											<div class="starpoint">
												<c:forEach begin="1" end="${r.RV_STAR}">⭐</c:forEach>
											</div>
											<div class="review_date"></div>
										</div>
									</div>
								</div>
								<%-- <div class="title">${r.RV_TITLE}</div> --%>
								<div class="contents">${r.RV_CONTENT}</div>
							</div>
							<div class="join_moim">
								<div class="title_moim">${r.MO_TITLE}</div>
							</div>
							<br>
							<hr>
							<br>
						</c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td>조회된 결과가 없습니다.</td>
					</tr>
					</c:otherwise>
				</c:choose>
			</section>
			
			<%-- <div>	
				<a href="/review/${detail.MO_CATEGORY}.sosu" class="btn normal">목록으로</a>
				
				<a href="/reviewModify/${detail.MO_CATEGORY}/${detail.RV_IDX}.sosu">수정하기</a>
				
				<button class="submit">삭제</button>
			</div> --%>
		</form>
	</article>
</main>