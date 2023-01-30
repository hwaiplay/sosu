<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><input type="text" value="${MO_CATEGORY}" /></h1>
	<a href="/members/reviewForm.sosu">리뷰작성하기</a>
	
	 <table>
      <thead>
         <tr align="center">
            <th>리뷰번호</th>
            <th>회원번호</th>
            <th>모임번호</th>
            <th>리뷰제목</th>
            <th>등록날짜</th>
            <th>별점</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${fn:length(reviewList) > 0 }">
               <c:forEach items="${reviewList}" var = "r" end = "3">
                  <tr align="center" onclick= "location.href='/review/${MO_CATEGORY}/${r.MO_IDX}.sosu'">
                     <td>${r.RV_IDX}<input type="hidden" name="MO_IDX" value="${r.RV_IDX}"></td>
                     <td>${r.M_IDX}<input type="hidden" name="M_IDX" value="${r.M_IDX}"></td>
                     <td>${r.MO_IDX}</td>
                      <td>${r.RV_TITLE}</td>
                     <td>${r.RV_REGDATE}</td>
                     <td>${r.RV_STAR}</td>
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