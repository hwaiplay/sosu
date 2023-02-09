<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script defer type="text/javascript" src='/resources/js/common.js'></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script type="text/javascript">
history.replaceState({},null,location.pathname);
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>회원 관리</h1>
<a href="/members/logout.sosu">로그아웃</a>

<form action="/admin/memberlist.sosu">
   <input type="hidden" name="listType" value="adminMemberList">
   <input type="submit" value="전체 회원 리스트">
</form>
<form action="/admin/memberlist.sosu">
   <input type="hidden" name="listType" value="adminReportMemberList">
   <input type="submit" value="신고받은 회원 리스트">
</form>
<form action="/admin/memberlist.sosu">
   <input type="hidden" name="listType" value="adminStopMemberList">
   <input type="submit" value="정지당한 회원 리스트">
</form>

<table>
   <thead>
      <tr>
         <th>회원번호</th>
         <th>아이디</th>
         <th>닉네임</th>
         <th>이름</th>
         <th>회원상태</th>
         <th>정지일</th>
         <th>신고누적횟수</th>
         
         <th></th>
      </tr>
   </thead>
      
      <c:forEach begin="0" end="${fn:length(adminList)}" items="${adminList}" var="memberList">
            <tr>
            <td>${memberList.M_IDX}</td>
            <td>${memberList.M_EMAIL}</td>
            <td>${memberList.M_NICKNAME}</td>
            <td>${memberList.M_NAME}</td>
            
            <td>
               <c:if test="${memberList.M_DEL_YN eq 'N'}">
                  정상
               </c:if>
               <c:if test="${memberList.M_DEL_YN eq 'S'}">
                  정지
               </c:if>
            </td>
            
            <td>
               <c:if test="${memberList.M_BAN_DATE eq null }">
                  -
               </c:if>
               <c:if test="${memberList.M_BAN_DATE ne null }">
                  <fmt:formatDate value="${memberList.M_BAN_DATE}" pattern="yyyy-MM-dd"/>
               </c:if>
            </td>
            <td>${memberList.RECOUNT}</td>
            <td>
               <form action="/admin/memberdetail.sosu">
                  <input type="hidden" name="M_IDX" value="${memberList.M_IDX}">
                  <input type="hidden" name="RECOUNT" value="${memberList.RECOUNT}">
                  <input type="submit" value="상세보기">
               </form>
            </td>
            </tr>
         </c:forEach>
        
   
</table>

<c:if test="${not empty paginationInfo}">
		<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
	</c:if>
	<input type="hidden" id="currentPageNo" name="currentPageNo"/>

<form id="commonForm" name="commonForm"></form>

<script type="text/javascript">

	function fn_search(pageNo){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/memberlist.sosu' />");
		comSubmit.addParam("currentPageNo", pageNo);
		comSubmit.submit();
	}
</script>


</div>

</body>
</html>