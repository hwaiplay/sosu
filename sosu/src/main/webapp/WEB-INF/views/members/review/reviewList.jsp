<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/css/list.css" rel="stylesheet">
<script src="/resources/js/review.js"></script>

<main class="container" style="margin-top: 75px;">
	<article>
		<section>
			<div class="container">
				<div class="row gy-5">
					<div class="col">
						<div style="float: left; font-size: 14.5px;">
							<select onchange="location.href=(this.value);">
								<option value="/review/culture.sosu"
									<c:if test="${MO_CATEGORY == 'culture'}">selected="selected"</c:if>>문화/예술</option>
								<option value="/review/sports.sosu"
									<c:if test="${MO_CATEGORY == 'sports'}">selected="selected"</c:if>>운동/스포츠</option>
								<option value="/review/game.sosu"
									<c:if test="${MO_CATEGORY == 'game'}">selected="selected"</c:if>>게임/오락</option>
								<option value="/review/outdoor.sosu"
									<c:if test="${MO_CATEGORY == 'outdoor'}">selected="selected"</c:if>>아웃도어/여행</option>
								<option value="/review/food.sosu"
									<c:if test="${MO_CATEGORY == 'food'}">selected="selected"</c:if>>음식</option>
								<option value="/review/etc.sosu"
									<c:if test="${MO_CATEGORY == 'etc'}">selected="selected"</c:if>>기타</option>
							</select>
						</div>
					</div>
				</div>

				<div></div>
			</div>
			<hr>
		</section>

		<section class="row gy-5" style="margin-bottom: 90px;">
			<c:choose>
				<c:when test="${fn:length(list) > 0 }">
					<c:forEach items="${list}" var="r" varStatus="var">
						<input type="hidden" value="${sessionss}" id="session">


						<div class="col-lg-3 menu-item" style="margin-bottom: 80px;">
							<div class="row gy-5" style="padding-left: 11px;">
								<div class="row gy-5"
									onclick="location.href='/review/${r.MO_CATEGORY}/${r.RV_IDX}.sosu'"
									style="cursor: pointer;">
									<input type="hidden" name="MO_CATEGORY" value="${r.MO_CATEGORY}"> <input
										type="hidden" name="RV_IDX" value="${r.RV_IDX}">
									<c:if test="${r.F_SVNAME ne '0'}">
										<img src="/resources/img/upload/${r.F_SVNAME}">
									</c:if>
									<c:if test="${r.F_SVNAME eq '0'}">
										<img src="/resources/img/icons/list.png">
									</c:if>
									<br/><br/><br/>
									
									 <span class="review-star"
										style="color: #ffc81e; text-align: left; margin-top: -27px; font-size: 21px;">
										<c:if test="${r.RV_STAR eq 1}">
											<c:out value="★☆☆☆☆" />
										</c:if> <c:if test="${r.RV_STAR eq 2}">
											<c:out value="★★☆☆☆" />
										</c:if> <c:if test="${r.RV_STAR eq 3}">
											<c:out value="★★★☆☆" />
										</c:if> <c:if test="${r.RV_STAR eq 4}">
											<c:out value="★★★★☆" />
										</c:if> <c:if test="${r.RV_STAR eq 5}">
											<c:out value="★★★★★" />
										</c:if>
									</span>
									<!-- 타이틀이 16자 보다 크거나 같다면  -->
									<span class="rdetail-cate"> <fmt:formatDate
											value="${r.RV_REGDATE}" pattern="yyyy/MM/dd" />
									</span>
									<br>
									<span class="max">${r.RV_TITLE}</span>
								</div>

								<!-- 디테일 카테고리 -->
								<div class="hashtag">
									<input type="hidden" value="${r.MO_IDX}">
									<button type="button"
										onclick="location.href='/moim/${r.MO_CATEGORY}/${r.MO_IDX}.sosu'"
										class="mrgbtn33" style="width: 100%;">#${r.MO_TITLE}</button>
								</div>

								<!-- 프로필과 찜 -->
								<p class="mo-cost">
									<img class="kingimg" src="/resources/img/upload/${r.PROFILE}"
										style="margin-right: 9px;"> <span
										style="float: left; padding-top: 8px;">${r.M_NICKNAME}</span>
									<c:if
										test="${sessionss eq null or sessionss ne null and r.RZ_CHECK eq '0'}">
										<input type="hidden" name="RV_IDX" value="${r.RV_IDX}">
										<button type="button" class="hhhbtn"
											onclick="return insertHeart(${r.RV_IDX})">
											<img alt="heart" src="/resources/img/icons/like.png"
												width="32px;">
										</button>
										<span class="mzcount">${r.RZ_COUNT}</span>
									</c:if>
									<c:if test="${sessionss ne null and r.RZ_CHECK ne '0'}">
										<input type="hidden" name="MO_IDX" value="${r.RV_IDX}">
										<button type="button" class="hhhbtn"
											onclick="return deleteHeart(${r.RV_IDX})">
											<img alt="heart" src="/resources/img/icons/heart.png"
												width="32px;">
										</button>
										<span class="mzcount">${r.RZ_COUNT}</span>
									</c:if>
								</p>

							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div>
						<div>조회된 결과가 없습니다.</div>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</article>
</main>