<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<script src="/resources/js/common.js"></script>
<head>
<link href="/resources/css/list.css" rel="stylesheet">
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">

<meta charset="UTF-8">
<title>소수 자유게시판</title>
</head>
<main>
   <article>
      <input type="hidden" value="${FR_CATEGORY }" id = "cate">

      <div class="container" style="margin-top:75px;">
      <div class="row gy-5" style="margin-bottom: 90px;">
         <div class="container">
         <div class="row gy-5">
            <div class="col">
               <div style="float: left; font-size: 14.5px;">
                  <select onchange="location.href=(this.value);" >
                     <option value="/freeboard/culture.sosu" <c:if test="${FR_CATEGORY == 'culture' }">selected="selected"</c:if>>문화/예술</option>
                     <option value="/freeboard/sports.sosu" <c:if test="${FR_CATEGORY == 'sports' }">selected="selected"</c:if>>운동/스포츠</option>
                     <option value="/freeboard/game.sosu" <c:if test="${FR_CATEGORY == 'game' }">selected="selected"</c:if>>게임/오락</option>
                     <option value="/freeboard/outdoor.sosu" <c:if test="${FR_CATEGORY == 'outdoor' }">selected="selected"</c:if>>아웃도어/여행</option>
                     <option value="/freeboard/food.sosu" <c:if test="${FR_CATEGORY == 'food' }">selected="selected"</c:if>>음식</option>
                     <option value="/freeboard/etc.sosu" <c:if test="${FR_CATEGORY == 'etc' }">selected="selected"</c:if>>기타</option>
                  </select>
                  <form action="/freeboard/search.sosu" method="post">
                     <select name="searchType">
                        <option value="A">전체</option>
                        <option value="T">제목</option>
                        <option value="C">내용</option>
                     </select>
                     <input type="text" class="form-control" placeholder="검색어 입력" name="keyword" maxlength="100">
                     <input class="btn" type="submit" value="검색">
                  </form>
               </div>
            </div>
         </div>
      
      <%if(session.getAttribute("M_IDX")!=null){ %>
      <div style="text-align: right; margin-top: 20px">
         <button type="button" onclick="location.href='/freeboard/insertForm/${FR_CATEGORY }.sosu'" class="mrgbtn">글쓰기</button>
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
               <c:forEach items="${list }" var = "list">
            <div class="col-lg-3 menu-item" style="margin-bottom: 80px;">
            <div class="row gy-5"  onclick="location.href='/freeboard/${list.FR_CATEGORY }/${list.FR_IDX }.sosu'" style="cursor: pointer;">
               <input type="hidden" name="M_IDX"   value="${list.M_IDX }">
               <input type="hidden" name="FR_IDX" value="${list.FR_IDX }">
                  <c:if test="${list.FF_SVNAME != '0' }">
                     <img src="${pageContext.request.contextPath }/resources/img/upload/${list.FF_SVNAME }" alt="" style='width: 300px; height: 300px'>
                  </c:if>
                  <c:if test="${list.FF_SVNAME == '0' }">
                     <img src="/resources/img/icons/list.png"  style='width: 300px; height: 300px'>
                  </c:if>
                  <p></p>
                  <p class="ddd" style="margin-top: 14px; width:100%;">
                     <%-- <img class="kingimg" src="${pageContext.request.contextPath}/resources/assets/img/image/${r.PROFILE}" alt="profile"> --%>
                     <!-- ▼임시사진 -->
                     <img class="kingimg" src="/resources/img/category/basketball.jpg" alt="profile">
                     <span style="padding-left: 6px">
                        ${list.M_NICKNAME}
                     </span>
                  </p>        
                  <p class="moim-title" style="margin-top: 2px; width:100%; padding-left: 2px;">
                     ${list.FR_TITLE}
                     <span class="hhh" style="">♡</span>
                  </p>
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
      <c:if test="${!empty paginationInfo}">
         <div class="paging">
            <ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="paging" />
         </div>
      </c:if>
      </div>
      </div>
   </article>
</main>