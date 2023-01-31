<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1><input type="text" value="${MO_CATEGORY}" /></h1>
   <br />
   <table>
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
      </tbody>
   </table>
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
</body>
</html>