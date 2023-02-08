<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>자유게시판 작성</title>
</head>
<body>
	<form id="frm" name="insertForm" enctype="multipart/form-data">
		<table>
			<caption>게시글등록</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" id="FR_TITLE" name="FR_TITLE"
						maxlength="70" placeholder="제목을 입력하세요"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>${FR_CATEGORY} <input type="hidden" id="FR_CATEGORY"
						name="FR_CATEGORY" value="${FR_CATEGORY}"> <input
						type="hidden" id="MO_CATEGORY" name="MO_CATEGORY"
						value="${FR_CATEGORY}">
					<td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${M_NICKNAME } <input type="hidden" name="FR_WRITER"
						value="${M_NICKNAME }">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="view_text" colspan="4"><textarea rows="5"
							id="FR_CONTENT" name="FR_CONTENT" placeholder="내용을 입력하세요"
							style="width: 500px; height: 300px"></textarea></td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td>
						<div id="fileDiv">
							<p>
								<input type="file" id="file" name="file_0"> <a
									href="#this" class="btn" id="delete" name="delete">삭제</a>
							</p>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<a href="#this" class="btn" id="addFile">파일 추가</a> <a href="#this"
				class="btn" id="write">작성하기</a> <a
				href="/freeboard/${FR_CATEGORY }.sosu" class="btn">목록으로</a>
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		$("#write").on("click", function(e) {
			var mo_cate = $("#FR_CATEGORY").val();
			$.ajax({
				url : "/freeboard/insertfree.sosu",
				type : "post",
				data : {
					FR_CATEGORY : mo_cate
				},
				success : function(data) {
				}
			});
		});

		var gfv_count = 1;

		$(document).ready(function() {
			$("#write").on("click", function(e) { //작성하기 버튼
				if (document.insertForm.FR_TITLE.value == "") {
					alert("제목을 입력해주세요.");
					document.insertForm.FR_TITLE.focus();
					return false;
				}

				if (document.insertForm.FR_CONTENT.value == "") {
					alert("내용을 입력해주세요.");
					document.insertForm.FR_CONTENT.focus();
					return false;
				}

				e.preventDefault();
				fn_insertfree();
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

		function fn_insertfree() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/freeboard/insertfree.sosu' />");
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
</body>
</html>