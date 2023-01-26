<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/list.css" rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
<div class="mainL" style="width:1400px; text-align: center; margin: 50px auto;">
   
   현재 카테고리~~~ ${MO_CATEGORY}
   <div class="catte" style="text-align: left; margin-bottom: 40px;">
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
		<span>전체</span>	
		<span>중부</span>	
		<span>동부</span>	
		<span>서부</span>	
		<span>남부</span>	
		<span>북부</span>	
	</div>

   <div class="filter">
   	<input type="datetime-local">
   </div>

   </div>
   

   <!-- 모임 리스트 4개 -->
   <div class="moim" >
   <span>
			<a href="/culture.sosu">
			<img alt="culture" src="/resources/img/pic01.jpg" style="cursor: pointer; position: relative;">
			</a>
			</span>
			<span> <a href="/sports.sosu"> <img class="mimg"
					alt="sports" src="/resources/img/pic01.jpg"
					style="cursor: pointer;">
			</a>
			</span>
			<span> <a href="/game.sosu"> <img class="mimg"
					alt="game" src="/resources/img/pic01.jpg"
					style="cursor: pointer;">
			</a>
			</span>
			<span> <a href="/game.sosu"> <img class="mimg"
					alt="game" src="/resources/img/pic01.jpg"
					style="cursor: pointer;">
			</a>
			</span>
   
   
   	<c:choose>
            <c:when test="${fn:length(molist) > 0 }">
               <c:forEach items="${molist}" var = "m" end = "3">
                  <tr align="center" onclick= "location.href='/moim/${m.MO_CATEGORY}/${m.MO_IDX}.sosu'">
                     <td>${m.MO_IDX}<input type="hidden" name="MO_IDX" value="${m.MO_IDX}"></td>
                     <td>${m.MO_TITLE}<input type="hidden" name="M_IDX" value="${m.M_IDX}"></td>
                     <td>${m.MO_REGION}</td>
                      <td>${m.MO_DETAILREGION}</td>
                     <td>${m.MOMEM_COUNT}</td>
                     <td>${m.MZ_COUNT}</td>
                     <c:if test ="${sessionss ne null}">
                     <td>${m.MZ_CHECK}</td>
                     </c:if>
                     <c:if test ="${sessionScope.M_IDX eq null}">
                     </c:if>
                     <td>${m.MF_SVNAME}</td>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
   
			
	
   
   
   
   
   <div>
   <table class="table">
      <thead>
         <tr align="center">
            <th>모임번호</th>
            <th>모임제목</th>
            <th>모임지역</th>
            <th>모임상세지역</th>
            <th>현재참여인원</th>
            <th>스크랩수</th>
            <%if(session.getAttribute("M_IDX") != null){ %>
            <th>스크랩유무</th>
            <%}else{ %>
            <%} %>
            <th>파일</th>
         </tr>
      </thead>
      <tbody>
         
      </tbody>
   </table>
   </div>
   
   
   <!-- 리뷰 리스트 4개 -->
   <table>
      <thead>
         <tr align="center">
             <th>리뷰번호</th>
            <th>리뷰사진</th>
            <th>모임이름</th>
            <th>별점</th>
            <th>작성자프사</th>
            <th>작성자</th>
            <th>좋아요 수</th>
            <%if(session.getAttribute("M_IDX") != null){ %>
            <th>좋아요 유무</th>
            <%}else{ %>
            <%} %>
            <th>작성날짜</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${fn:length(relist) > 0 }">
               <c:forEach items="${relist}" var = "r"  end = "4" varStatus="status">
                   <tr align="center" onclick= "location.href='/review/${r.MO_CATEGORY}/${r.RV_IDX}.sosu'">
                     <td>${r.RV_IDX}<input type = "hidden" value = "${r.RV_IDX}"></td>
                     <td>${r.RF_SVNAME}<input type = "hidden" value = "${r.M_IDX}"></td>
                     <td>${r.MO_TITLE}</td>
                     <td>${r.RV_STAR}</td>
                     <td>${r.PROFILE}</td>
                     <td>${r.M_NICKNAME}</td>
                      <td>${r.RZ_COUNT}</td>
                     <c:if test ="${sessionss ne null}">
                     <td>${r.RZ_CHECK}</td>
                     </c:if>
                     <c:if test ="${sessionScope.M_IDX eq null}">
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
   </table>
   <table>
      <thead>
         <tr align="center">
            <th>게시판번호</th>
            <th>게시판사진</th>
            <th>게시판제목</th>
            <th>작성자이름</th>
            <th>작성자프사</th>
            <th>좋아요 수</th>
             <%if(session.getAttribute("M_IDX") != null){ %>
            <th>스크랩유무</th>
            <%}else{ %>
            <%} %>
            <th>작성날짜</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${fn:length(frlist) > 0 }">
               <c:forEach items="${frlist}" var = "f" varStatus="status" end = "3">
                <tr align="center" onclick= "location.href='/freeboard/${f.MO_CATEGORY}/${f.FR_IDX}.sosu'">
                     <td>${f.FR_IDX}<input type = "hidden" value = "${f.FR_IDX}"></td>  
                     <td>${f.FF_SVNAME}<input type = "hidden" value = "${f.M_IDX}"></td>            
                     <td>${f.FR_TITLE}</td>
                     <td>${f.M_NICKNAME}</td>
                     <td>${f.PROFILE}</td>
                     <td>${f.FRZ_COUNT}</td>
                     <c:if test ="${sessionss ne null}">
                     <td>${f.FZ_CHECK}</td>
                     </c:if>
                     <c:if test ="${sessionScope.M_IDX eq null}">
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
   </table>
   </div>
   </div>
</body>
</html>