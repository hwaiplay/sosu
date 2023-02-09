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
               <option value="/culture.sosu" <c:if test="${MO_CATEGORY == 'culture'}">selected="selected"</c:if>>문화/예술</option>
               <option value="/sports.sosu" <c:if test="${MO_CATEGORY == 'sports'}">selected="selected"</c:if>>운동/스포츠</option>
               <option value="/game.sosu" <c:if test="${MO_CATEGORY == 'game'}">selected="selected"</c:if>>게임/오락</option>
               <option value="/outdoor.sosu" <c:if test="${MO_CATEGORY == 'outdoor'}">selected="selected"</c:if>>아웃도어/여행</option>
               <option value="/food.sosu" <c:if test="${MO_CATEGORY == 'food'}">selected="selected"</c:if>>음식</option>
               <option value="/etc.sosu" <c:if test="${MO_CATEGORY == 'etc'}">selected="selected"</c:if>>기타</option>
            </select>
            </div>
         </div>
      </div>
      <div class="row gy-5">
         <div class="col" style="margin-top: 10px; margin-bottom: 20px;">
      
      <!-- 작성(개설) 버튼 -->
      <%if(session.getAttribute("M_IDX")!=null){ %>
      <div style="text-align: right;">
         <button type="button" onclick="location.href='/moim/moimRegister.sosu'" class="mrgbtn">모임 개설하기</button>
      </div>
      <% } %>
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
         <input type="hidden" name="M_IDX"   value="${m.M_IDX}">
            <input type="hidden" name="MO_IDX" value="${m.MO_IDX}">
            <img src="/resources/img/upload/${m.MF_SVNAME}" alt=""
            style='width: 300px; height: 300px'>
                     <br />
               <!-- 지역 -->
               <p class="detail-region">${m.MO_DETAILREGION }</p>
               
               <!-- 타이틀이 16자 보다 크거나 같다면  -->
               <c:if test="${fn:length(m.MOTT) >= 16}"> 
					<p class="moim-title">${m.MOTT}...</p>
				</c:if>
				<!-- 타이틀이 16자 보다 작거나 같다면  -->	
				<c:if test="${fn:length(m.MOTT) < 16}"> 
					<p class="moim-title">${m.MOTT}</p>
				</c:if>
				
			<!-- 인원수 -->	
			<c:if test="${m.MO_MAXPEOPLE != 0}">
             <p> <span class="max">[${m.MOMEM_COUNT}명/${m.MO_MAXPEOPLE}명]</span>
            </c:if>
			<c:if test="${m.MO_MAXPEOPLE == 0}">
			<p>	<span class="max">[제한없음]</span>
			</c:if>
			
			<!-- 디테일 카테고리 -->
               <span class="detail-cate"> #${m.MO_DETAILCATEGORY}</span></p>
               <hr style="width:300px;">
            
            <!-- 참가비용 -->   
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
                  <!-- 찜 수 -->
                  <%-- <span class="hhh" style="margin-top: -7px;">${r.RZ_COUNT}</span> --%>
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
      <!-- 작성(개설) 버튼 -->
         <span><a href="/freeboard/${MO_CATEGORY}.sosu" class="allb">전체보기</a></span>
      </p>
         <c:forEach items="${frlist}" var="f" end="3">
            <div class="col-lg-3 menu-item" onclick="location.href='/freeboard/${f.FR_CATEGORY}/${f.FR_IDX}.sosu'">
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
</body>
</html>