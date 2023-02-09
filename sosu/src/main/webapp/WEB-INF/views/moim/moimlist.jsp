<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/css/list.css" rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
<input type="hidden" value="${MO_CATEGORY }">

<div class="container" style="margin-top:75px;">
   <div class="row gy-5" style="margin-bottom: 90px;">
      <div class="container">
      <div class="row gy-5">
         <div class="col">
            <div style="float: left; font-size: 14.5px;">
            <select onchange="location.href=(this.value);">
               <option value="/moim/culture.sosu" <c:if test="${MO_CATEGORY == 'culture'}">selected="selected"</c:if>>문화/예술</option>
               <option value="/moim/sports.sosu" <c:if test="${MO_CATEGORY == 'sports'}">selected="selected"</c:if>>운동/스포츠</option>
               <option value="/moim/game.sosu" <c:if test="${MO_CATEGORY == 'game'}">selected="selected"</c:if>>게임/오락</option>
               <option value="/moim/outdoor.sosu" <c:if test="${MO_CATEGORY == 'outdoor'}">selected="selected"</c:if>>아웃도어/여행</option>
               <option value="/moim/food.sosu" <c:if test="${MO_CATEGORY == 'food'}">selected="selected"</c:if>>음식</option>
               <option value="/moim/etc.sosu" <c:if test="${MO_CATEGORY == 'etc'}">selected="selected"</c:if>>기타</option>
            </select>
         
                 <div class="reg">
                  <span><a href = "/moim/${MO_CATEGORY}.sosu" style = "color:#000;">전체</a></span>
                  <span><a href = "/moim/${MO_CATEGORY}.sosu?MO_REGION=중부" style = "color:#000;">중부</a></span>
                  <span><a href = "/moim/${MO_CATEGORY}.sosu?MO_REGION=동부" style = "color:#000;">동부</a></span>
                  <span><a href = "/moim/${MO_CATEGORY}.sosu?MO_REGION=서부" style = "color:#000;">서부</a></span> 
                  <span><a href = "/moim/${MO_CATEGORY}.sosu?MO_REGION=남부" style = "color:#000;">남부</a></span>
                  <span><a href = "/moim/${MO_CATEGORY}.sosu?MO_REGION=북부" style = "color:#000;">북부</a></span>
               </div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>현재모임${count.MO_COUNT}개</span>
      
            </div>
         </div>
      </div>
      
      <%if(session.getAttribute("M_IDX")!=null){ %>
      <div style="text-align: right; margin-top: 20px">
         <button type="button" onclick="location.href='/moim/moimRegister.sosu'" class="mrgbtn">모임 개설하기</button>
      </div>
      <% } %>
      
      <div class="row gy-5">
         <div class="col" style="margin-top: 5px; margin-bottom: 20px;">
            <hr>
         </div>
      </div>
      </div>
   
   
         <c:choose>
            <c:when test="${fn:length(list) > 0 }">
               <c:forEach items="${list}" var = "m">
                 <div class="col-lg-3 menu-item" style="margin-bottom: 80px;">
         <div class="row gy-5"  onclick="location.href='/moim/${m.MO_CATEGORY}/${m.MO_IDX}.sosu'" style="cursor: pointer;">
         <input type="hidden" name="M_IDX"   value="${m.M_IDX}">
            <input type="hidden" name="MO_IDX" value="${m.MO_IDX}">
            <img src="/resources/img/upload/${m.MF_SVNAME}" alt=""
            style='width: 300px; height: 300px'>
                     <br />
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

				<p class="mo-cost">${m.MO_COST2}원
                  <c:if test = "${sessionss eq NULL or m.MZ_CHECK eq 0}">
                  <span class="hhh" style = "margin-left:160px;">♡</span>
                  </c:if>
                  <c:if test = "${sessionss ne NULL and m.MZ_CHECK eq 1}">
                  <span class="hhh"  style = "margin-left:160px;">♥</span>
                  </c:if>
               </p>

               <%-- <c:if test="${m.MO_COST != null }">
               <p class="mo-cost">${m.MO_COST}원
                  <span class="hhh">♡</span>
               </p>
               </c:if>
               <c:if test="${m.MO_COST == null }">
               <p class="mo-cost">0원
                  <span class="hhh">♡</span>
               </p>   
               </c:if> --%>
            </div>
         </div>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <div class="row gy-5" style="height: 165px; margin-bottom: 12px;">
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