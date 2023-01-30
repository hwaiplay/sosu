<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<input type="hidden" name="FR_IDX" value="${FR_IDX}">
	
	<table class="board_view" >
		<tbody>
			<c:choose>
				<c:when test="${!empty map}">
					<c:forEach items="${map}" var="i" >
			<tr>
				<th scope="row" style="width: 90px;">자유게시판 번호</th>
				<td style="width: 250px;">${i.FR_IDX}</td>	
				<th scope="row">작성일</th>
				<td colspan="3">${i.FR_REGDATE }</td>
				<th scope="row">수정여부</th>
				<td colspan="3">${i.RE_MOD_YN }</td>
				<th scope="row">작성자</th>
				<td colspan="3">${i.FR_WRITER }</td>
				
			</tr>
			<tr>
				<th scope="row" style="width: 90px;">카테고리</th>
				<td style="width: 250px;">${i.FR_CATEGORY }</td>	
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td>${i.FR_TITLE }</td>
				
			</tr>
			<tr>
				<th scope="row">내용</th> 
				<td colspan="3"><pre style="white-space: pre-wrap;"><c:out value="${i.FR_CONTENT}" /></pre></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th scope="row">첨부파일</th> -->
<!-- 				<td colspan="3"> -->
<%-- 					<c:forEach var="row" items="${!empty map }"> --%>
<!-- 					<div> -->
<%-- 						<input type="hidden" id="F_ARTICLE" value="${row.F_ARTICLE }"> --%>
<%-- 						<a href="#this" name="file">${row.F_SVNAME }</a> --%>
						
<%-- 							(${row.F_SIZE}kb)<br> --%>
<!-- 					</div> -->
<%-- 					</c:forEach> --%>
				
<!-- 				</td> -->

<!-- 			</tr> -->
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>

	<script src="/resources/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){  //수정하기
				e.preventDefault();
				fn_openBoardUpdate();
			});
			
			
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/freeboard/{FR_CATEGORY}.sosu' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var fr_idx = "${i.FR_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sosuboard/updatefree' />");
			comSubmit.addParam("FR_IDX", fr_idx);
			comSubmit.submit();
		}
		
		
		
		
</script> 


