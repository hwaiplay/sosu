<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/resources/css/detail.css" rel="stylesheet">
<script defer type="text/javascript" src="/resources/js/moimDetail.js"></script>

<body>
<%   //개행을 위한..(구현X)
      pageContext.setAttribute("crcn", "\r\n");
      pageContext.setAttribute("br", "<br>"); 
%> 

<div class="container" style="text-align: center; width: 1000px; margin: 50px auto;">

<input type="hidden" name = "MO_IDX" value="${MO_IDX}" id = "idx">
<input type="hidden" name = "MO_CATEGORY" value="${MO_CATEGORY}" id="cate">
<main>
      <div class="detailBody">
         <div class="imgArea">

            <c:if test="${Detail.F_SVNAME eq null }">
               <img src="/resources/img/sample.jpg"
                  style="width: 1000px; height: auto;">
            </c:if>

            <!-- 진짜 사진 -->
            <c:if test="${Detail.F_SVNAME ne null }">
               <!-- <img src="${pageContext.request.contextPath}/resources/assets/img/image/${Detail.F_SVNAME }" style="width: 1000px; height: auto;"> -->
            </c:if>

         </div>

         <div class="detailArea">
            <!-- 모임 제목 -->
            <p class="dtitle">${Detail.MO_TITLE}</p>
            <hr>

            <!-- 세부 정보 -->
            <p id="MO_IDX">
               ☀︎
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
            <p>
               ✈
               <fmt:formatDate value="${Detail.MO_DEADLINE}" pattern="yyyy/MM/dd" />

               <fmt:parseDate value="${Detail.MO_DEADTIME}" var="deadtime"
                  pattern="HH:mm" />
               <fmt:formatDate value="${deadtime}" pattern="HH:mm" />
            </p>
            <p>
               ❖
               <c:if test="${Detail.MO_MINAGE != '0'}">
               <input type = "hidden" value="${Detail.MO_MINAGE}" name = "MO_MINAGEE" id = "minAge"/>
               <input type = "hidden" value="${Detail.MO_MAXAGE}" name = "MO_MAXAGE" id = "maxAge"/>
      ${Detail.MO_MINAGE}~${Detail.MO_MAXAGE}세  
      </c:if>

               <c:if test="${Detail.MO_MINAGE == '0'}">
      연령 제한 없음
      </c:if>
      </p>
      <p id="gender">☺
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
            <p>
               ⍟
               <c:if test="${Detail.MO_MAXPEOPLE != '0'}">
               <input type = "hidden" value="${Detail.MO_MAXPEOPLE}" name = "MO_MAXPEOPLE" id = "maxP"/>
               <input type = "hidden" value="${Detail.MOMEM_COUNT}" name = "MOMEM_COUNT" id = "presentP"/>
      현재${Detail.MOMEM_COUNT}명/최대 ${Detail.MO_MAXPEOPLE}명
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
         <div class="modetail">
      <p class="dtitle">모임소개</p>
      ${Detail.MO_DETAIL}
      
      <%-- <img src="">${Detail.MF_SVNAME} --%>
   
   </div>
      </div>
      <br> <br>
      <div style="text-align: left;">
      <h3>참여 인원 리스트</h3>
      <table>
         <thead>
            <tr align="center">
               <th>참여자 프로필</th>
               <th>참여자 닉네임</th>
               <c:if test="${sessionss eq Detail.M_IDX}">
                  <th>관리</th>
               </c:if>
            </tr>
         </thead>
         <tbody>
            <c:choose>
               <c:when test="${fn:length(list) > 0 }">
                  <c:forEach items="${list}" var="m" varStatus="status">
                  <input type="hidden" value="${m.M_IDX}" name="M_IDX" id = "pmidx${status.index}">
                     <tr align="center">
                        <td>${m.PROFILE}</td>
                        <td><form action="/members/usermypage.sosu">
                              <input type="hidden" value="${m.M_NICKNAME}" name="M_NICKNAME">
                              <button type="submit">${m.M_NICKNAME}</button>
                           </form></td>
                        <c:if test="${sessionss eq Detail.M_IDX}">
                           <td>
                              <form action=/moim/moimMemberBan.sosu>
                                 <input type="hidden" value="${m.P_IDX}" name="P_IDX" id = "pmidx${status.index}">
                                 <input type="hidden" name="MO_IDX" value="${MO_IDX}">
                                 <button type="submit" class="btn normal"
                                    onclick="alert('강퇴완료.')">강퇴하기</button>
                              </form>
                           </td>
                        </c:if>

                     </tr>
                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <tr>
                  
                     <td colspan="4"><br>현재 참여한 인원이 없습니다.</td>
                  </tr>
               </c:otherwise>
            </c:choose>
         </tbody>
      </table>
      </div>
      <br> <br>
      
      <!-- 참여 대기자 리스트 (안보임) -->
      <div style="display: none;">
         <table>
               <c:choose>
                  <c:when test="${fn:length(list2) > 0 }">
                     <c:forEach items="${list2}" varStatus="status" var = "w">
                     <tr>
                     <td id="gg">${w.M_IDX}</td>
                     </tr>
                      <input type="hidden" value="${w.M_IDX}" name="M_IDX" id = "wmidx${status.index}">
                     </c:forEach>
                  </c:when>
               </c:choose>
         </table>
      </div>
      <!-- 강퇴자 리스트 (안보임) -->
      <div style="display: none;" >
      <h3>강퇴자 리스트</h3>
         <table>
               <c:choose>
                  <c:when test="${fn:length(list3) > 0 }">
                     <c:forEach items="${list3}" varStatus="status" var = "b">
                     <tr>
                     <td>${b.M_IDX}</td>
                     </tr>
                        <input type="hidden" name="M_IDX" value="${b.M_IDX}" id = "bmidx${status.index}">
                     </c:forEach>
                  </c:when>
               </c:choose>
         </table>
      </div>

      <c:if test="${sessionss eq Detail.M_IDX and Detail.MO_PERMIT eq 'Y'}">
      <div style="text-align: left;">
         <h3>참여대기 인원</h3>
         <table>
            <thead>
               <tr align="center">
                  <th>대기자 프로필</th>
                  <th>대기자 닉네임</th>
                  <th>승인 허가</th>
               </tr>
            </thead>
            <tbody>
               <c:choose>
                  <c:when test="${fn:length(list2) > 0 }">
                     <c:forEach items="${list2}" var="w"  varStatus="status">
                        <tr align="center">
                           <c:if test="${w.P_FINAL_YN eq 'N'}">
                              <td>${w.PROFILE}</td>
                              <td><form action="/members/usermypage.sosu">
                                    <input type="hidden" value="${w.M_NICKNAME}"
                                       name="M_NICKNAME">
                                    <button type="submit">${w.M_NICKNAME}</button>
                                 </form></td>
                              <td>
                                 <form action="/moim/moimWaitApprove.sosu">
                                    <input type="hidden" value="${w.P_IDX}" name="P_IDX">
                                    <input type="hidden" name="MO_IDX" value="${MO_IDX}">
                                    <button type="submit" class="btn normal"
                                       onclick="alert('참여승인이 완료되었습니다.')">참여 승인</button>
                                 </form>
                                 
                                 <form action="/moim/moimMemberBan.sosu">
                                    <input type="hidden" value="${w.P_IDX}" name="P_IDX">
                                    <input type="hidden" name="MO_IDX" value="${MO_IDX}">
                                    
                                    <button type="submit" class="btn normal" onclick="alert('승인 거부 처리 되었습니다.')">승인 거부</button>
                                 </form>
                              </td>
                           </c:if>
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
      </c:if>
      
   <!--====== 버튼들.. ======-->
      <div align="center" id="btndiv">
      <!-- 참여 승인이 필요하지 않은 모임 -->
         <c:if
            test="${sessionss ne null and sessionss ne Detail.M_IDX and Detail.MO_PERMIT eq 'N' and Detail.MO_CLOSE_YN eq 'N'}">
            <form action="/moim/moimJoin.sosu" onsubmit="return checkJoin();">
               <button class="btn normal" type="submit" id="cham">참여하기</button>
               <input type="hidden" name="MO_IDX" value="${MO_IDX}"> <input
                  type="hidden" name="M_GENDER" value="${sessgender}" id="ssgender">
               <input type="hidden" name="M_IDX" value="${sessionss}"
                  id="sessionss">
               <input type="hidden" name="M_JUMIN" value="${sessage}"
                  id="sessage">
            </form>

            <!-- 탈퇴하기 버튼 -->
            <form action="/moim/moimExit.sosu" onsubmit="return exit();">
               <button class="btn normal" type="submit" id="tal" style="display: none;">탈퇴하기</button>
               <input type="hidden" name="MO_IDX" value="${MO_IDX}">
               <input type="hidden" name="M_IDX" value="${sessionss}" id="sessionss">
            </form>
            
         </c:if>
         
         <!-- 마감된 모임일 때 -->
         <c:if
            test="${Detail.MO_CLOSE_YN eq 'Y'}">
            <div>
               <button class="btn normal" >마감된 모임입니다.</button>
            </div>
         </c:if>
         
         <!-- 참여 승인이 필요한 모임 -->
         <c:if
            test="${sessionss ne null and sessionss ne Detail.M_IDX and Detail.MO_PERMIT eq 'Y' and Detail.MO_CLOSE_YN eq 'N'}">
            <form action="/moim/moimJoinPermit.sosu"
               onsubmit="return checkJoin2();">
               <button class="btn normal" type="submit" id="cham2">참가요청</button>
               <input type="hidden" name="MO_IDX" value="${MO_IDX}"> <input
                  type="hidden" name="M_GENDER" value="${sessgender}" id="ssgender">
               <input type="hidden" name="M_IDX" value="${sessionss}"
                  id="sessionss">
            </form>

            <!-- 탈퇴하기 버튼 -->
            <form action="/moim/moimExit.sosu" onsubmit="return exit();" style="display:none;">
               <button class="btn normal" type="submit" id="tal2">참가 취소하기</button>
               <input type="hidden" name="MO_IDX" value="${MO_IDX}">
               <input type="hidden" name="M_IDX" value="${sessionss}" id="sessionss">
            </form>

         </c:if>
         
         <!-- 목록으로 버튼 -->
         <div>
            <a href="/moim/${MO_CATEGORY}.sosu" class="btn normal">목록으로</a>
            <input type="hidden" name="MO_CATEGORY" value="${Detail.MO_CATEGORY}" />
         
         <!-- 방장일 때 보이는 -->
         <c:if test="${sessionss ne null and sessionss eq Detail.M_IDX and Detail.MO_CLOSE_YN eq 'N'}">
            <a href="/moimModify/${MO_IDX}.sosu" class="btn normal">수정하기</a>
            <input type="hidden" value="${MO_IDX}" name="MO_IDX">
            
            <form action="/moim/moimDelete.sosu" id="moimDelete" onsubmit="return confirm('모임을 삭제하시겠습니까?')">
               <input type="submit" class="btn normal" value="삭제하기">
               <input type="hidden" value="${MO_IDX}" name="MO_IDX">
            </form>
            
            <form action="/moim/moimSelfClose.sosu" id="selfclose" onsubmit="return confirm('모임을 마감 하시겠습니까?');">
               <input type="submit" value="조기마감">
               <input type="hidden" value="${MO_IDX}" name="MO_IDX">
            </form>
         </c:if>
      </div>
      </div>
   </main>
   </div>
</body>