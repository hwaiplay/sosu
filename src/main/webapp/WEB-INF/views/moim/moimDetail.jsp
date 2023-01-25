<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<body>
<%
      pageContext.setAttribute("crcn", "\r\n");
      pageContext.setAttribute("br", "<br>"); 
%> 

<input type="hidden" name = "MO_IDX" value="${MO_IDX}">
<main class="layoutCenter">
<div align="center"><h1>모임 디테일</h1></div>
<form action="/moim/moimDelete.sosu">
<table>
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
			<th>회원 닉네임</th>
			<td>
				<strong>${Detail.M_NICKNAME}</strong>
			</td>
			<th>모임지역</th>
			<td>${Detail.MO_DETAILREGION}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td colspan="7">${Detail.MO_REGDATE }</td>
		</tr>
		<tr>
			<td>${Detail.MO_DETAIL}</td>
		</tr>
	</tbody>
</table>


<div align="center" id="btndiv">	
<a href="/moim/${MO_CATEGORY}.sosu" class = "btn normal">목록으로</a>
<input type = "hidden" name = "MO_CATEGORY" value = "${DEATAIL.MO_CATEGORY}"/>

<a href="/moimModify/${MO_IDX}.sosu" class = "btn normal">수정하기</a>

<input type="hidden" value="${MO_IDX}"  name = "MO_IDX">
<button type="submit" onclick="check();">삭제하기</button>

</div>
</form>
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