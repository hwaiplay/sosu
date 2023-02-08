<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>소수 자유게시판 수정</title>
</head>
<div class="container">
	<h3>게시글 수정하기</h3>
</div>
<form id="frm" name="updateForm" enctype="multipart/form-data" method="post">
<table class="board_view">
	<tbody>
		<tr>
			<th scope="row">자유No.</th>
			<td colspan="4">
				${map.FR_IDX}
				<input type="hidden" id="FR_IDX" name="FR_IDX" value="${map.FR_IDX }">
			</td>
		</tr>
		<tr>
			<th scope="row">작성자</th>
			<td colspan="4"> 
				${map.M_IDX }
				<input type="hidden" id="M_IDX" name="M_IDX" value="${map.M_IDX }">
			</td>
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td colspan="4">
				<input type="text" id="FR_TITLE" name="FR_TITLE" value="${map.FR_TITLE }" placeholder="제목을 입력하세요">
			</td>	
		</tr>	
		<tr>
			<th scope="row" style="width: 90px;">카테고리</th>
			<td colspan="4">
				${map.FR_CATEGORY }
			</td>	
		</tr>
		<tr>
			<th>내용</th>
			<td class="view_text" colspan="4">
				<textarea rows="20" cols="100" id="FR_CONTENT" name="FR_CONTENT" placeholder="내용을 입력하세요" style="height:300px">${map.FR_CONTENT }</textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">첨부파일</th>
			<td colspan="3">
				<div id="fileDiv">
					<!-- varStatus 속성을 이용해 반복자에 대한 정보 변수에 담기 -->
					<c:forEach var="row" items="${list}" varStatus="var">
						<p>
							<!-- 반복자.index 를 사용하여 몇 번째 반복인지 값 담기 -->
							<input type="hidden" id="F_ARTICLE" name="F_ARTICLE_${var.index }" value="${row.F_ARTICLE }">
							<a href="#this" id="name_${var.index }" name="name_${var.index }">
								${row.F_OGNAME }
							</a>
							<input type="file" id="file_${var.index }" name="file_${var.index }">
							(${row.F_SIZE }kb)
							<a href="#this" class="btn" id="delete_${var.index }" name="delete_${var.index }">삭제</a>
							<br>
						</p>
					</c:forEach>
				</div>
			</td>
		</tr>
	</tbody>
</table>

<div align="center">
	<a href="#this" class="btn" id="addFile">파일 추가</a>
	<a href="#this" class="btn" id="update">수정하기</a>
</div>
</form>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>		
<script type="text/javascript">

	var gfv_count = 1;

	$(document).ready(function() {
		$("#update").on("click", function(e) { //수정하기 버튼
			if (document.updateForm.FR_TITLE.value=="") {
				  alert("제목을 입력해주세요.");
				  document.updateForm.FR_TITLE.focus();
				  return false;
			  }
		
			if(document.updateForm.FR_CONTENT.value=="") {
				  alert("내용을 입력해주세요.");
				  document.updateForm.FR_CONTENT.focus();
				  return false;
			  }
			
			e.preventDefault();
			fn_updatefree();
		});

		$("#addFile").on("click", function(e) { //파일추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});

	});

	function fn_updatefree() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/freeboard/updatefree.sosu' />");
		comSubmit.submit();
	}

	function fn_addFile() {
		var str = "<p><input type='file' name='file_" + (gfv_count++)
				+ "'><a href='#this' class='btn' name='delete'>삭제</a></p>";
		$("#fileDiv").append(str); //<<div id="fileDiv">에 변수 str의 값을 추가
		$("a[name='delete']").on("click", function(e) {
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove(); //this의 바로 위의 요소(<p>태그)를 삭제
	}
</script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/freeboard.js"></script>