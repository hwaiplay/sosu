<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/resources/css/detail.css" rel="stylesheet">

<body>
<%   //개행을 위한..(구현X)
      pageContext.setAttribute("crcn", "\r\n");
      pageContext.setAttribute("br", "<br>"); 
%> 

<div class="container" style="text-align: center; width: 1000px; margin: 50px auto;">

<input type="hidden" name = "MO_IDX" value="${MO_IDX}">

<div class="detailBody">
	<div class="imgArea">
	
	<c:if test="${Detail.F_SVNAME eq null }">
	<img src="/resources/img/sample.jpg" style="width: 1000px; height: auto;">
	</c:if>
	
	<!-- 진짜 사진 -->
	<c:if test="${Detail.F_SVNAME ne null }">
	<!-- <img src="${pageContext.request.contextPath}/resources/assets/img/image/${Detail.F_SVNAME }" style="width: 1000px; height: auto;"> -->
	</c:if>
	
	</div>
	
	<div class="detailArea">
		<!-- 모임 제목 -->
		<p class="dtitle">${Detail.MO_TITLE}
		</p>
		<hr>
		
		<!-- 세부 정보 -->
		<p>☀︎
		<c:if test="${Detail.MO_CATEGORY == 'culture' }">
		문화/예술
		</c:if>
		<c:if test="${Detail.MO_CATEGORY == 'sports' }">
		운동/스포츠
		</c:if>
		<c:if test="${Detail.MO_CATEGORY == 'outdoor' }">
		아웃도어/여행
		</c:if>
		<c:if test="${Detail.MO_CATEGORY == 'game' }">
		게임/오락
		</c:if>
		<c:if test="${Detail.MO_CATEGORY == 'food' }">
		음식
		</c:if>
		<c:if test="${Detail.MO_CATEGORY == 'etc' }">
		기타
		</c:if>
		 </p>
		<p>♫ ${Detail.MO_DETAILCATEGORY}</p>
		<p>⚑ ${Detail.MO_DETAILREGION}</p>
		<p>✎ <fmt:formatDate value="${Detail.MO_DEADLINE}" pattern="yyyy/MM/dd" />
		
		<fmt:parseDate value="${Detail.MO_DEADTIME}" var="deadtime" pattern="HH:mm" />
		<fmt:formatDate value="${deadtime}" pattern="HH:mm" /> </p>
		<p>❖
		<c:if test="${Detail.MO_MINAGE != '0'}">
		${Detail.MO_MINAGE}~${Detail.MO_MAXAGE}세  
		</c:if>
		
		<c:if test="${Detail.MO_MINAGE == '0'}">
		연령 제한 없음 /
		</c:if>
		
		<c:if test="${Detail.MO_GENDER == 'W'}">
		 여자만
		</c:if>
		<c:if test="${Detail.MO_GENDER == 'M'}">
		 남자만
		</c:if>
		<c:if test="${Detail.MO_GENDER == '0'}">
		성별 제한 없음
		</c:if>
		 </p>
		<p>☺
		<c:if test="${Detail.MO_MAXPEOPLE != '0'}">
		인원 ${Detail.MO_MAXPEOPLE}명
		</c:if>
		<c:if test="${Detail.MO_MAXPEOPLE == '0'}">
		인원 제한 없음
		</c:if>
		</p>
		
	</div>
	
	<div class="kingArea">
		<hr>
		<!-- 0127기준 미완 방장 프로필 -->
		<%-- ${Detail.KPROFILE} --%>
		<img src="${pageContext.request.contextPath}/resources/assets/img/image/${f.F_SVNAME}" class="kingimg">
		<form action="/members/usermypage.sosu" style="height: 35px;">
              <input type="hidden" value="${Detail.M_NICKNAME}" name="M_NICKNAME">
              <button type="submit" class="king">${Detail.M_NICKNAME}</button>
        </form>
        <span class="ks"><fmt:formatDate value="${Detail.MO_REGDATE}" pattern="yyyy/MM/dd" /> 개설</span>
	</div>
		<hr>
	
	<!-- 0127기준 미완 -->
	<div class="partyArea">
	<p class="dtitle">참여 인원</p>
	 <c:choose>
            <c:when test="${fn:length(list) > 0 }">
               <c:forEach items="${list}" var = "m" >
                     ${m.PROFILE}
                   <form action="/members/usermypage.sosu">
               <input type="hidden" value="${m.M_NICKNAME}" name="M_NICKNAME">
               <button type="submit">${m.M_NICKNAME}</button>
            </form>
                    
               </c:forEach>
            </c:when>
            <c:otherwise>
               참여자를 기다리고 있어요!
               
            </c:otherwise>
         </c:choose>
	</div>
	<hr>
	
	<div class="modetail">
		<p class="dtitle">모임소개</p>
		${Detail.MO_DETAIL}
		
		<%-- <img src="">${Detail.MF_SVNAME} --%>
	
	</div>
	
	<!-- 0127기준 미완 -->
	<div align="center" id="btndiv">
		<c:if test ="${sessionss ne null and sessionss ne Detail.M_IDX and Detail.MO_PERMIT eq 'N'}">
			<form action = "/moim/moimJoin.sosu">
				<button type="submit" onclick="checkJoin();" class = "btn normal">참여하기</button>
				<input type="hidden" name = "MO_IDX" value="${MO_IDX}">
			</form>
		</c:if> 
		
		<c:if test ="${sessionss ne null and sessionss ne Detail.M_IDX and Detail.MO_PERMIT eq 'Y'}">
				<button type="submit" onclick="checkJoin2();" class = "btn normal">참가요청</button>
				<input type = "hidden" name = "MO_IDX" value="${MO_IDX}">
				<input type = "hidden" name = "MO_PERMIT" value = "${MO_PERMIT}">
		</c:if>  
		
			<a href="/moim/${MO_CATEGORY}.sosu" class ="btn normal">목록으로</a>
			<input type = "hidden" name = "MO_CATEGORY" value = "${Detail.MO_CATEGORY}"/>
		
		<c:if test ="${sessionss ne null and sessionss eq Detail.M_IDX}">
				<a href="/moimModify/${MO_IDX}.sosu" class = "btn normal">수정하기</a>
				<input type="hidden" value="${MO_IDX}"  name = "MO_IDX">
				<form action="/moim/moimDelete.sosu">
					<button type="submit" onclick="check();" class = "btn normal">삭제하기</button>
				</form>
		</c:if>
	</div>
</div>

<%-- <table>
   <colgroup>   
      <col width="15%"/>
      <col width="5%"/>
      <col width="15%"/>
   </colgroup>
   <tbody>
      <tr>
         <th>카테고리</th>
         <td>
            <strong id="cate">${Detail.MO_CATEGORY}</strong>   
         </td>
         <th>모임번호</th>
         <td id="MO_IDX">
            <strong>${Detail.MO_IDX}</strong>   
         </td>
         <th>모임제목</th>
         <td>
            <strong>${Detail.MO_TITLE}</strong>
         </td>
         <th>방장 닉네임</th>
         <td>
            <form action="/members/usermypage.sosu">
               <input type="hidden" value="${Detail.M_NICKNAME}" name="M_NICKNAME">
               <button type="submit">${Detail.M_NICKNAME}</button>
            </form>
         </td>
         <th>모임지역</th>
         <td>${Detail.MO_DETAILREGION}</td>
      </tr>
      <tr>
         <th>작성일</th>
         <td colspan="7">${Detail.MO_REGDATE}</td>
      </tr>
      <tr>
         <td>${Detail.MO_DETAIL}</td>
      </tr>
   </tbody>
</table>
<br>
<br>
<p>참여 인원 리스트</p>
   <table>
      <thead>
         <tr align="center">
            <th>참여자 프로필</th>
            <th>참여자 닉네임</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${fn:length(list) > 0 }">
               <c:forEach items="${list}" var = "m" >
                  <tr align="center">
                      <td>${m.PROFILE}</td>
                     <td><form action="/members/usermypage.sosu">
               <input type="hidden" value="${Detail.M_NICKNAME}" name="M_NICKNAME">
               <button type="submit">${Detail.M_NICKNAME}</button>
            </form></td>
                    
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



</div>
</body>

<!-- 삭제 컨펌 alert 1/20기준 미완 -->
<script type="text/javascript">
function check() {
   
   var cate = $("#cate").text();
   var idx = $("#MO_IDX").text();
   var list = ${list};
   
   
    if (confirm("게시글을 삭제 하시겠습니까?")){ 
       alert("삭제 되었습니다.");
       location.href="/moim/moimDelete.sosu";
       } else {
       location.href="/moim/" +cate + "/" + idx + ".sosu";
      return false;
   }
    }
function checkJoin() {
   
   var cate = $("#cate").text();
   var idx = $("#MO_IDX").text();
   
   
   for(int i=0 ; i<list.size() ; i++){
      if(<%=session.getAttribute("sessionss")%>==${list[i].M_IDX}){
         alert("이미 참여함ㅋ");
         return false;
      }else{
         if (confirm("모임에 참여하시겠습니까??")){ 
             alert("참여완료.");
             location.href="/moim/moimJoin.sosu";
             } else {
             location.href="/moim/" +cate + "/" + idx + ".sosu";
            return false;
         }
      }
   }
}
</script>