<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
    
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/review.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reviewForm.css"/>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<main class="container">
<article>
	<form action="/review/reviewModify.sosu" method="post" onsubmit="return check()" 
	name="insertReview" id="insertReview" enctype="multipart/form-data">
		<h1>${map.MO_TITLE}</h1>
		
		<fieldset>
		    <legend>별점을 선택해주세요</legend>
		    <input type="radio" name="RV_STAR" value="5" id="rate1"><label class="starp" for="rate1">⭐</label>
		    <input type="radio" name="RV_STAR" value="4" id="rate2"><label class="starp" for="rate2">⭐</label>
		    <input type="radio" name="RV_STAR" value="3" id="rate3"><label class="starp" for="rate3">⭐</label>
		    <input type="radio" name="RV_STAR" value="2" id="rate4"><label class="starp" for="rate4">⭐</label>
		    <input type="radio" name="RV_STAR" value="1" id="rate5"><label class="starp" for="rate5">⭐</label>
		</fieldset>
		
		<h3>제목</h3>
		<input type="text" name="RV_TITLE" id="rv_title" value="${map.RV_TITLE}">
		
		<h3>내용</h3>
		<textarea name="RV_CONTENT" id="rv_content" placeholder="후기 내용을 작성해주세요.">${map.RV_CONTENT}</textarea>
		
		<!-- 회원번호 -->
		<input type="hidden" name="M_IDX" value="${map.M_IDX}">
		<!-- 모임번호 --> 
		<input type="hidden" name="MO_IDX" value="${map.MO_IDX}">
		<!-- 리뷰번호 -->
		<input type="hidden" name="RV_IDX" value="${RV_IDX}"> 
		<!-- 선택한 카테고리 -->
		<input type="hidden" id="mo_cate" name="MO_CATEGORY" value="${MO_CATEGORY}">
		
		<div id="fileDiv">
		<c:forEach items="${list}" varStatus="m" var="r">
			<div class="filebox"> <!-- accept로 이미지파일 확장자 제한 가능 -->
			
				<c:if test="${r.F_MAIN_YN eq 'Y'}">
					<!-- 메인사진  -->
					<input class="upload-name-main" id="name_${m.index}" name="name_${m.index}" value="${r.F_OGNAME}" placeholder="${r.F_OGNAME}">
					<label class="filesearch" for="file">썸네일수정</label> 
					<input type="file" id="file" name="mainIamge" accept="image/jpeg, image/png, image/jpg">
					(${r.F_SIZE}kb)
					<a href="#this" class="btn_a" id="delete_${m.index}" name="delete_${m.index}">삭제</a>
					
					<!-- 파일번호 -->
					<input type="hidden" id="F_IDX" name="F_IDX_${m.index}" value="${r.F_IDX}"> 
					<!-- 파일 태그 --> 
					<input type="hidden" id="F_TABLE" name="F_TABLE_${m.index}" value="${r.F_TABLE}">
				</c:if>
				 
				<c:if test="${r.F_MAIN_YN ne 'Y'}">
					<!-- 사진  -->
					<input class="upload-name" id="name_${m.index}" name="name_${m.index}" value="${r.F_OGNAME}" placeholder="${r.F_OGNAME}">
					<label for="file_0" class="filesearch">파일찾기</label>
					<input type="file" id="file_0" name="file_0" accept="image/jpeg, image/png, image/jpg"> 
					(${r.F_SIZE}kb) 
					<a href="#this" class="btn_a" id="delete_${m.index}" name="delete_${m.index}">삭제</a>
					
					<!-- 파일번호 -->
					<input type="hidden" id="F_IDX" name="F_IDX_${m.index}" value="${r.F_IDX}"> 
					<!-- 파일 태그 --> 
					<input type="hidden" id="F_TABLE" name="F_TABLE_${m.index}" value="${r.F_TABLE}">
				</c:if>
			</div>
		</c:forEach>
		</div>
		<br/>
		<br/>
		<a href="#this" class="btn_a" id="addFile">파일 추가</a>
		<a href="/members/mypage.sosu" class="btn_a">취소</a><!-- 마이페이지 URL  -->
		<button class="submit success">수정하기</button>
	</form>
</article>
</main>
<script type="text/javascript">
	var gfv_count = '${fn:length(list)+1}';

	$(document).ready(function() {

		$("#deleteCafeinfo").on("click", function(e) { //삭제하기 버튼
			e.preventDefault();
			fn_deleteCafeinfo();
		});

		$("#addFile").on("click", function(e) { //파일추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name^='delete']").on("click", function(e) { //파일추가 삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});

	});

	function fn_addFile(){
		var str = "<div class='filebox'>" +
				"<input class='upload-name' id='name_${m.index}' name='name_${m.index}' value='첨부파일' placeholder='첨부파일'>"+
				"<label for='file' class='filesearch'>파일찾기</label>" +
				"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
				"<a href='#this' class='btn_a' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
			"</div>";
		$("#fileDiv").append(str);
		$("#delete_"+(gfv_count++)).on("click", function(e){ 
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
	
	$("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name-main").val(fileName);
	});
	
	$("#file_0").on('change',function(){
		  var fileNames = $("#file_0").val();
		  $(".upload-name").val(fileNames);
	});
</script>