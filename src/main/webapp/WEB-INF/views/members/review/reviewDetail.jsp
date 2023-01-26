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
<input type="hidden" name = "MO_IDX" value="${MO_IDX}">
<main>
	<article class="container">
	<h1>리뷰</h1>
		<form action="/review/reviewDelete.sosu">
			<table>
				<tbody>
					<tr>
						<th>카테고리</th>
						<td>
							<strong>${detail.MO_CATEGORY}</strong>	
						</td>
						<th>리뷰번호</th>
						<td>
							<strong>${detail.RV_IDX}</strong>	
						</td>
						<th>회원번호</th>
						<td>
							<strong>${detail.M_IDX}</strong>
						</td>
						<th>모임번호</th>
						<td>
							<strong>${detail.MO_IDX}</strong>
						</td>
						<th>제목</th>
						<td>${detail.RV_TITLE}</td>
					</tr>
					<tr>
						<th>등록날짜</th>
						<td>${detail.MO_REGDATE}</td>
					</tr>
					<tr>
						<td>${detail.RV_CONTENT}</td>
					</tr>
				</tbody>
			</table>
			
			<div align="center" id="btndiv">	
			<a href="/review/${MO_CATEGORY}.sosu" class = "btn normal">목록으로</a>
			<input type = "hidden" name = "MO_CATEGORY" value = "${DEATAIL.MO_CATEGORY}"/>
			
			<a href="/moimModify/${MO_IDX}.sosu" class = "btn normal">수정하기</a>
			
			<input type="hidden" value="${MO_IDX}"  name = "MO_IDX">
			<button type="submit" onclick="check();">삭제하기</button>
			
			</div>
		</form>
	</article>
</main>
</body>

<!-- 삭제 컨펌 alert 1/20기준 미완 -->
<script type="text/javascript">
function check() {
	
	var cate = $("#cate").text();
	var idx = $("#MO_IDX").text();
	
	
    if (confirm("게시글을 삭제 하시겠습니까?")){ 
       alert("삭제 되었습니다.");
       location.href="/moim/moimDelete.sosu";
       } else {
    	location.href="/moim/" +cate + "/" + idx + ".sosu";
		return false;
	}
    }
</script>

</html>