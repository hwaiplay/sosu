<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/list.css" rel="stylesheet">
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<meta charset="UTF-8">
</head>
<body>
<div class="container" style="margin-top:75px;">
	<div class="row gy-5" style="margin-bottom: 90px;">
		<div class="container">
		<div class="row gy-5">
			<div class="col">
				<div style="float: left; font-size: 14.5px;">
				<select onchange="location.href=(this.value);">
					<option value="#">선택</option>
					<option value="/culture.sosu">문화/예술</option>
					<option value="/sports.sosu">운동/스포츠</option>
					<option value="/game.sosu">게임/오락</option>
					<option value="/outdoor.sosu">아웃도어/여행</option>
					<option value="/food.sosu">음식</option>
					<option value="/etc.sosu">기타</option>
				</select>
			
					<div class="reg">
						<span>전체</span> <span>중부</span> <span>동부</span> <span>서부</span> <span>남부</span>
						<span>북부</span>
					</div>
		
					<div class="filter">
						<input type="datetime-local">
					</div>
				
				</div>
			</div>
		</div>
		<div class="row gy-5">
			<div class="col" style="margin-top: 20px; margin-bottom: 20px;">
				<hr>
			</div>
		</div>
		</div>
	
	
	<!--============== 모임 리스트 4개 ==============-->		
      <c:choose>
		<c:when test="${fn:length(molist) > 0 }">
		<p class="ct">모임
			<span><a href="/moim/${MO_CATEGORY}.sosu" class="allb">전체보기</a></span>
		</p>
		
         <c:forEach items="${molist}" var="m" end="3">
            <div class="col-lg-3 menu-item">
			<div class="row gy-5"  onclick="location.href='/moim/${m.MO_CATEGORY}/${m.MO_IDX}.sosu'" style="cursor: pointer;">
			<input type="hidden" name="M_IDX"	value="${m.M_IDX}">
            <input type="hidden" name="MO_IDX" value="${m.MO_IDX}">
				<img src="${pageContext.request.contextPath}/resources/assets/img/image/${m.F_SVNAME }" alt=""
				style='width: 300px; height: 300px'>
                     <br />
					<p class="detail-region">${m.MO_DETAILREGION }</p>
					<p class="moim-title">${m.MO_TITLE}
					<span class="moim-people">[${m.MOMEM_COUNT} 명]
					<span class="detail-cate"> #${m.MO_DETAILCATEGORY}</span></span></p>
					<hr style="width:300px;">
					<c:if test="${m.MO_COST != null }">
					<p class="mo-cost">${m.MO_COST}원
						<span class="hhh">♡</span>
					</p>
					</c:if>
					<c:if test="${m.MO_COST == null }">
					<p class="mo-cost">0원
						<span class="hhh">♡</span>
					</p>	
					</c:if>
				</div>
			</div>
         </c:forEach>
         </c:when>
         <c:otherwise>
			<div class="row gy-5" style="height: 165px; margin-bottom: 12px;">
       			<p class="ct">모임</p>
       			<div class="none">
					조회된 결과가 없습니다.
				</div>	
		</div>
		 </c:otherwise>
      </c:choose>
      </div>
      
      
      <!--============== 리뷰 리스트 4개 ==============-->
      <div class="row gy-5" style="margin-bottom: 90px;">
      <c:choose>
		<c:when test="${fn:length(relist) > 0 }">
         <p class="ct">리뷰
         	<span><a href="/review/${MO_CATEGORY}.sosu" class="allb">전체보기</a></span>
         </p>
         <c:forEach items="${relist}" var="r" end="3">
         <div class="col-lg-3 menu-item">
			<div class="row gy-5"  onclick="location.href='/review/${r.MO_CATEGORY}/${r.RV_IDX}.sosu'" style="cursor: pointer;">
			<input type="hidden" name="M_IDX" value="${r.RV_IDX}">
            <input type="hidden" name="MO_IDX" value="${r.M_IDX}">
            
             <c:if test="${r.f_svname != null }">
                 <img
                     src="${pageContext.request.contextPath}/resources/assets/img/image/${r.F_SVNAME }"
                     alt="" style='width: 300px; height: 300px'>
                 </c:if>
                 <c:if test="${r.f_svname == null }">
                 	<img src="/resources/img/icons/list.png"  style='width: 300px; height: 300px'>
                 </c:if> 
                     <br />
					<p class="rmoim-title">${r.RV_TITLE}
					<span class="rdetail-cate">
					<fmt:formatDate value="${r.RV_REGDATE}" pattern ="yyyy/MM/dd" />
					</span></p>
					<span class="review-star" style="color: #ffc81e;text-align: left;margin-top: -27px; font-size: 21px;">
								<c:if test="${r.RV_STAR eq 1}"><c:out value="★☆☆☆☆"/></c:if> 
								<c:if test="${r.RV_STAR eq 2}"><c:out value="★★☆☆☆" /></c:if> 
								<c:if test="${r.RV_STAR eq 3}"><c:out value="★★★☆☆" /></c:if> 
								<c:if test="${r.RV_STAR eq 4}"><c:out value="★★★★☆" /></c:if>
								<c:if test="${r.RV_STAR eq 5}"><c:out value="★★★★★" /></c:if>
					</span>
					<p class="ddd" style="margin-top: 14px;">
					<%-- <img class="kingimg" src="${pageContext.request.contextPath}/resources/assets/img/image/${r.PROFILE}"
			                     alt="profile"> --%>
			             <!-- ▼임시사진 -->
			             <img class="kingimg" src="/resources/img/category/basketball.jpg"
			                     alt="profile">
						<span style="padding-left: 6px">
						${r.M_NICKNAME}
						</span>
						<span class="hhh" style="margin-top: -7px;">♡</span>
					</p>	
				</div>
			</div>
      
      </c:forEach>
      </c:when>
       <c:otherwise>
       <div class="row gy-5" style="height: 165px; margin-bottom: 12px;">
       <p class="ct">리뷰</p>
       <div class="none">
			조회된 결과가 없습니다.
		</div>	
	   </div>
		 </c:otherwise>
      </c:choose>
     </div> 
      
     <div class="row gy-5"> 
      <!--============== 자유게시판 4개 ==============-->
      <c:choose>
		<c:when test="${fn:length(frlist) > 0 }">
		<p class="ct">자유게시판
			<span><a href="/freeboard/${MO_CATEGORY}.sosu" class="allb">전체보기</a></span>
		</p>
         <c:forEach items="${frlist}" var="f" end="3">
         	<div class="col-lg-3 menu-item" onclick="location.href='/freeboard/${f.MO_CATEGORY}/${f.FR_IDX}.sosu'">
                <c:if test="${f.f_svname != null }">
                <img
                     src="${pageContext.request.contextPath}/resources/assets/img/image/${f.F_SVNAME }"
                     alt="" style='width: 300px; height: 300px'>
                 </c:if>
                 <c:if test="${f.f_svname == null }">
                 	<img src="/resources/img/icons/list.png"  style='width: 300px; height: 300px'>
                 </c:if> 
                     <br />
                     
                    <p class="ddd" style="margin-top: 14px; width:100%;">
					<%-- <img class="kingimg" src="${pageContext.request.contextPath}/resources/assets/img/image/${r.PROFILE}"
			                     alt="profile"> --%>
			             <!-- ▼임시사진 -->
			             <img class="kingimg" src="/resources/img/category/basketball.jpg"
			                     alt="profile">
						<span style="padding-left: 6px">
						${f.M_NICKNAME}
						</span>
					</p>	
                     
					<p class="moim-title" style="margin-top: 2px; width:100%; padding-left: 2px;">
					${f.FR_TITLE}
						<span class="hhh" style="">♡</span>
					</p>
                  <input type="hidden" value="${f.FR_IDX}">
                  <input type="hidden" value="${f.M_IDX}">
            </div>
      
      </c:forEach>
      </c:when>
       <c:otherwise>
		<div class="row gy-5" style="height: 165px; margin-bottom: 12px;">
       <p class="ct">자유게시판</p>
       <div class="none">
			조회된 결과가 없습니다.
		</div>	
	   </div>
		 </c:otherwise>
      </c:choose>
      
      
      </div>
   </div>

					
					
						<%-- <tr align="center"
							onclick="location.href='/moim/${m.MO_CATEGORY}/${m.MO_IDX}.sosu'">
							<td>${m.MO_IDX}<input type="hidden" name="MO_IDX"
								value="${m.MO_IDX}"></td>
							<td>${m.MO_TITLE}<input type="hidden" name="M_IDX"
								value="${m.M_IDX}"></td>
							<td>${m.MO_REGION}</td>
							<td>${m.MO_DETAILREGION}</td>
							<td>${m.MOMEM_COUNT}</td>
							<td>${m.MZ_COUNT}</td>
							<c:if test="${sessionss ne null}">
								<td>${m.MZ_CHECK}</td>
							</c:if>
							<c:if test="${sessionScope.M_IDX eq null}">
							</c:if>
							<td>${m.MF_SVNAME}</td>
						</tr> --%>
				

			<%-- <div>
				<table class="table">
					<thead>
						<tr align="center">
							<th>모임번호</th>
							<th>모임제목</th>
							<th>모임지역</th>
							<th>모임상세지역</th>
							<th>현재참여인원</th>
							<th>스크랩수</th>
							<%
							if (session.getAttribute("M_IDX") != null) {
							%>
							<th>스크랩유무</th>
							<%
							} else {
							%>
							<%
							}
							%>
							<th>파일</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div> --%>


			<!-- 리뷰 리스트 4개 -->
			<%-- <table>
				<thead>
					<tr align="center">
						<th>리뷰번호</th>
						<th>리뷰사진</th>
						<th>모임이름</th>
						<th>별점</th>
						<th>작성자프사</th>
						<th>작성자</th>
						<th>좋아요 수</th>
						<%
						if (session.getAttribute("M_IDX") != null) {
						%>
						<th>좋아요 유무</th>
						<%
						} else {
						%>
						<%
						}
						%>
						<th>작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(relist) > 0 }">
							<c:forEach items="${relist}" var="r" end="4" varStatus="status">
								<tr align="center"
									onclick="location.href='/review/${r.MO_CATEGORY}/${r.RV_IDX}.sosu'">
									<td>${r.RV_IDX}<input type="hidden" value="${r.RV_IDX}"></td>
									<td>${r.RF_SVNAME}<input type="hidden" value="${r.M_IDX}"></td>
									<td>${r.MO_TITLE}</td>
									<td>${r.RV_STAR}</td>
									<td>${r.PROFILE}</td>
									<td>${r.M_NICKNAME}</td>
									<td>${r.RZ_COUNT}</td>
									<c:if test="${sessionss ne null}">
										<td>${r.RZ_CHECK}</td>
									</c:if>
									<c:if test="${sessionScope.M_IDX eq null}">
									</c:if>
									<td>${r.RV_REGDATE}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table> --%>
			<%-- <table>
				<thead>
					<tr align="center">
						<th>게시판번호</th>
						<th>게시판사진</th>
						<th>게시판제목</th>
						<th>작성자이름</th>
						<th>작성자프사</th>
						<th>좋아요 수</th>
						<%
						if (session.getAttribute("M_IDX") != null) {
						%>
						<th>스크랩유무</th>
						<%
						} else {
						%>
						<%
						}
						%>
						<th>작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(frlist) > 0 }">
							<c:forEach items="${frlist}" var="f" varStatus="status" end="3">
								<tr align="center"
									onclick="location.href='/freeboard/${f.MO_CATEGORY}/${f.FR_IDX}.sosu'">
									<td>${f.FR_IDX}<input type="hidden" value="${f.FR_IDX}"></td>
									<td>${f.FF_SVNAME}<input type="hidden" value="${f.M_IDX}"></td>
									<td>${f.FR_TITLE}</td>
									<td>${f.M_NICKNAME}</td>
									<td>${f.PROFILE}</td>
									<td>${f.FRZ_COUNT}</td>
									<c:if test="${sessionss ne null}">
										<td>${f.FZ_CHECK}</td>
									</c:if>
									<c:if test="${sessionScope.M_IDX eq null}">
									</c:if>
									<td>${f.FR_REGDATE}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table> --%>
</body>
</html>