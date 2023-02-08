<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/form.css" rel="stylesheet">
<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1">
<script type="text/javascript">
history.replaceState({}, null, location.pathname);
</script>
<script defer type="text/javascript" src="/resources/js/moimModify.js"></script>
</head>
<body>
<div class="container" style="text-align:center; margin-bottom: 100px;">
<h2 style=" margin-top: 90px; margin-bottom: 50px;">모임 수정하기</h2>
   <form action="/moim/moimModify.pro" method="post" id="f" encType="multipart/form-data" name="moimR">
            
    <input type="hidden" name="M_IDX" value = "${modify.M_IDX}">
            
    <table class="input-form" >
      <colgroup>
      <col style="width:150px;">
      <col style="width:auto;"> 
      </colgroup>
   
         <tbody>
            <tr>
               <th class="header"><label for="MO_TITLE" >제목</label></th>
               <td class="contents"><input type="text" class="form-control" name="MO_TITLE" id="MO_TITLE"
                   style="width: 754px;" value="${modify.MO_TITLE}"></td>
            </tr>
            
            <tr>
               <th class="header"><label for="MO_CATEGORY" >카테고리</label></th>
               <td class="contents">
                  <select name="MO_CATEGORY" class="mo_cate" id="MO_CATEGORY" required>
                        <option value="culture" <c:if test="${modify.MO_CATEGORY == 'culture'}">selected="selected"</c:if>>문화/예술</option>
                        <option value="sports" <c:if test="${modify.MO_CATEGORY == 'sports'}">selected="selected"</c:if>>운동/스포츠</option>
                        <option value="game" <c:if test="${modify.MO_CATEGORY == 'game'}">selected="selected"</c:if>>게임/오락</option>
                        <option value="outdoor" <c:if test="${modify.MO_CATEGORY == 'outdoor'}">selected="selected"</c:if>>아웃도어/여행</option>
                        <option value="food" <c:if test="${modify.MO_CATEGORY == 'food'}">selected="selected"</c:if>>음식</option>
                        <option value="etc" <c:if test="${modify.MO_CATEGORY == 'etc'}">selected="selected"</c:if>>기타</option>
                     </select>
                     
                  <label for="mo_detailca" style="padding:0 5px 0 25px; font-size: 15px;">세부 카테고리</label>
                   <input type="text" name="MO_DETAILCATEGORY" class="mo_detailca" value="${modify.MO_DETAILCATEGORY }">
               </td>
            </tr>
            
            <tr>
               <th class="header"><label for="selectRegion" >지역</label></th>
               <td class="contents">
                  <select name="MO_REGION" id="selectRegion" class="selectRegion" onchange="addressKindChange(this)">
                     <option value="중부" <c:if test="${modify.MO_REGION == '중부'}">selected="selected"</c:if>>중부</option>
                     <option value="동부" <c:if test="${modify.MO_REGION == '동부'}">selected="selected"</c:if>>동부</option>
                     <option value="서부" <c:if test="${modify.MO_REGION == '서부'}">selected="selected"</c:if>>서부</option>
                     <option value="남부" <c:if test="${modify.MO_REGION == '남부'}">selected="selected"</c:if>>남부</option>
                     <option value="북부" <c:if test="${modify.MO_REGION == '북부'}">selected="selected"</c:if>>북부</option>
                  </select>
                     
                  <label for="selectRDetail" style="padding:0 5px 0 25px; font-size: 15px;">세부 지역</label>
                    <select name="MO_DETAILREGION" class="form-control" id="selectRDetail">
                       <option>선택해주세요.</option>
                    </select>
               </td>
            </tr>
         
         <tr>
               <th class="header"><label for="MO_PERMIT">승인 허가 여부</label></th>
               <td class="gc" style="padding: 15px 0px 15px 0px;">
               <label for="MO_PERMIT" style="vertical-align: middle;">필요</label>
               <input style="vertical-align: middle;" type="radio" name="MO_PERMIT" value="Y"
                  <c:if test="${modify.MO_PERMIT eq 'Y' }">checked="checked"</c:if>
               >
                  <label for="MO_PERMIT" style="vertical-align: middle;">불필요</label>
                  <input style="vertical-align: middle;" type="radio" name="MO_PERMIT" value="N"
                     <c:if test="${modify.MO_PERMIT eq 'N' }">checked="checked"</c:if>
                  >
               </td>
            </tr>
         <tr>
               <th class="header"><label for="MO_GENDER">참가 성별</label></th>
               <td class="contents">
               <c:if test="${modify.MO_GENDER eq 'W' }">
                  여성
               </c:if>
               <c:if test="${modify.MO_GENDER eq 'M' }">
                  남성
               </c:if>
               <c:if test="${modify.MO_GENDER eq '0' }">
                  제한없음
               </c:if>
               </td>
            </tr>
            <tr>
            <th class="header"><label for="MO_MINAGE" >참가 연령</label></th>
            <td class="contents" id="agetd" style="padding-bottom: 0px;">
            <c:if test="${modify.MO_MAXAGE == '200'}">
               <div id="l2">제한없음</div>
            </c:if>
            <c:if test="${modify.MO_MAXAGE != '200'}">
               <input type="text" class="form-control" name="MO_MINAGE" id="MO_MINAGE"
                   value="${modify.MO_MINAGE }">
                 <input type="text" class="form-control" name="MO_MAXAGE" id="MO_MAXAGE" required
                  value="${modify.MO_MAXAGE }">
               </c:if> 
            </td>
             </tr>   
          <tr>
             <th></th>
             <td>
             <input type="button" id="ageNoLimit" class="noLB" value="제한없음" style="cursor: pointer;">
             <input type="button" id="up" class="noLB" value="수정하기" style="cursor: pointer;">
             </td>
          </tr>
       
            <tr>
            <th class="header"><label for="MO_MAXPEOPLE" >참가 인원</label></th>
            <td class="contents" style="padding-bottom: 0px;">
            
            
            <input type="text" class="form-control" name="MO_MAXPEOPLE" id="MO_MAXPEOPLE"
                  value="${modify.MO_MAXPEOPLE }">
              </td>
         </tr> 
         <tr>
          <th></th>
          <td><button type="button" id="peopleNoLimit" class="noLB" style="cursor: pointer;">제한 없음</button></td>
       </tr>
         
            
           <tr>
            <th class="header"><label for="MO_COST" >참가 비용</label></th>
            <td class="contents" style="padding-bottom: 0px;">
            
            <input type="text" class="form-control" name="MO_COST" id="MO_COST"
               <c:if test="${modify.MO_COST ne null}">value="${modify.MO_COST}"</c:if>
               <c:if test="${modify.MO_COST eq null}">value="0"</c:if>
            >
            </td>
         </tr>   
         <tr>
            <th></th>
            <td style="text-align: left; font-size: small; color: red; padding-bottom: 15px;">
               *숫자로만 작성 해주세요.(ex.1000)
            </td>
         </tr>
         
         <tr>
            <th class="header"><label for="date" >모임 날짜</label></th>
            <td class="contents">
               <input type="date" class="form-control" name="MO_DEADLINE" id="date">
            </td>
         </tr>  
            
         <tr>
            <th class="header"><label for="MO_DEADTIME" >모임 시간</label></th>
            <td class="contents">
               <input type="time" class="form-control" name="MO_DEADTIME" id="MO_DEADTIME">
            </td>
         </tr>  
            
         <tr>
            <th class="header"><label for="textArea_byteLimit" >내용</label></th>
            <td class="contents">
               <textarea style="width: 100%;" rows="17" class="form-control" name="MO_DETAIL" class="form-control" id="textArea_byteLimit" name="textArea_byteLimit" onkeyup="fn_checkByte(this)" wrap="hard" cols = "">${modify.MO_DETAIL}</textarea>
                 <sup>(<span id="nowByte">0</span>/1400bytes)</sup>
            </td>
         </tr> 
            
         <tr>
            <th class="header"><label for="file" >이미지 첨부</label></th>
            <td class="contents" id="fileDiv">
               <span><input type="file" id="file" name="file_0"> <a
                  href="#this" class="btn" id="delete" name="delete">삭제</a> <a
                  href="#this" class="btn" id="addFile">파일 추가</a></span>
            </td>
         </tr>   
   </tbody>
   </table>
   
        <input type="hidden" name="MO_IDX" value="${modify.MO_IDX}">
         <button type="submit" id="delB">등록</button>
         </form>
      </div>
</body>
</html>