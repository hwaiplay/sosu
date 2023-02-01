<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/list.css" rel="stylesheet">
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">

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
				<select onchange="location.href=(this.value);" id = "cate">
					<option value="/moim/culture.sosu" <c:if test="${MO_CATEGORY == 'culture'}">selected="selected"</c:if>>문화/예술</option>
					<option value="/moim/sports.sosu" <c:if test="${MO_CATEGORY == 'sports'}">selected="selected"</c:if>>운동/스포츠</option>
					<option value="/moim/game.sosu" <c:if test="${MO_CATEGORY == 'game'}">selected="selected"</c:if>>게임/오락</option>
					<option value="/moim/outdoor.sosu" <c:if test="${MO_CATEGORY == 'outdoor'}">selected="selected"</c:if>>아웃도어/여행</option>
					<option value="/moim/food.sosu" <c:if test="${MO_CATEGORY == 'food'}">selected="selected"</c:if>>음식</option>
					<option value="/moim/etc.sosu" <c:if test="${MO_CATEGORY == 'etc'}">selected="selected"</c:if>>기타</option>
				</select>
			
					<div class="reg">
						<input type = "checkbox" name = "MO_REGION" value = "중부">중부
						<input type = "checkbox" name = "MO_REGION" value = "동부">동부
						<input type = "checkbox" name = "MO_REGION" value = "서부">서부
						<input type = "checkbox" name = "MO_REGION" value = "남부">남부
						<input type = "checkbox" name = "MO_REGION" value = "북부">북부
						<button type = "submit" id = "regionSearch" class="mrgbtn">검색</button>
					</div>
		
					<div class="filter">
						<input type="datetime-local">
					</div>
				
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
			<input type="hidden" name="M_IDX"	value="${m.M_IDX}">
            <input type="hidden" name="MO_IDX" value="${m.MO_IDX}">
				<img src="${pageContext.request.contextPath}/resources/assets/img/image/${m.F_SVNAME }" alt=""
				style='width: 300px; height: 300px'>
                     <br />
					<p class="detail-region">${m.MO_DETAILREGION }</p>
					<p class="moim-title">${m.MO_TITLE}
					<span class="moim-people">[${m.MOMEM_COUNT} 명]
					<span class="detail-cate"> #${m.MO_DETAILCATEGORY}</span></span></p>
					<hr style="width:300px;">
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
       			<div class="none">
					조회된 결과가 없습니다.
				</div>	
		</div>
            </c:otherwise>
         </c:choose>
   </div>
   </div>
</body>
<script>	
	var cate = $("#cate");

	$('#regionSearch').on('click', function() {
		var regionList = [];

		$("input[name=MO_REGION]:checked").each(function(i) {
			regionList.push($(this).val());
		});
		 var allData = { chbox : regionList	};
		$.ajax({
			url : "/moim/" + cate + "/.sosu", 
			type : "get",
			data : JSON.stringify(allData), //변수이름 chbox ,변수값: regionList 
			dataType : 'json',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(result) {
			}
		});
	});
</script>
</html>